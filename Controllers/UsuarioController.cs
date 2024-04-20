using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Authorization;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.Processing;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;



public class UsuarioController : Controller
{
    private readonly IWebHostEnvironment environment;

    public UsuarioController(IWebHostEnvironment environment)
    {
        this.environment = environment;
    }

    RepositorioUsuario repusu = new RepositorioUsuario();
    RepositorioAuditoria ra = new RepositorioAuditoria();


    [Authorize(Policy = "Administrador")]
    public IActionResult Index()
    {
        var lista = repusu.GetUsuarios();

        return View(lista);
    }


    public IActionResult Detalle(int id)
    {
        var lista = repusu.GetUsuario(id);
        return View(lista);
    }

    [HttpGet]
    /*[Authorize(Roles = "Administrador")]*/
    public ActionResult editar(int id)
    {
        //audit

        ViewBag.Roles = Usuario.ObtenerRoles();

        return View(repusu.GetUsuario(id));
    }

    public async Task<ActionResult> EditarUsuario(Usuario usuario, IFormFile avatarFile)
    {
        try
        {
            RepositorioUsuario ru = new RepositorioUsuario();
            Usuario? u = ru.GetUsuario(usuario.IdUsuario);

            if (u != null)
            {
                // Actualizar datos básicos del usuario
                u.Nombre = usuario.Nombre;
                u.Apellido = usuario.Apellido;
                u.Email = usuario.Email;
                u.Permiso = usuario.Permiso;

                // Actualizar la clave si se proporciona
                if (!string.IsNullOrEmpty(usuario.Clave))
                {
                    u.Clave = Usuario.hashearClave(usuario.Clave);
                }

                // Manejo del avatar
                if (!string.IsNullOrEmpty(u.AvatarUrl))
                {
                    var ruta = Path.Combine(environment.WebRootPath, "update", $"avatar_{u.IdUsuario}" + Path.GetExtension(u.AvatarUrl));
                    // Hacer algo con la ruta del avatar, si es necesario
                }

                if (avatarFile != null)
                {
                    var resizedImagePath = await AvatarAsync(u, avatarFile);
                    if (resizedImagePath == null)
                    {
                        return View(usuario); // Retorna la vista con errores de validación si la extensión del archivo no es válida
                    }

                    u.AvatarUrl = resizedImagePath;
                }
                else
                {
                    u.AvatarUrl = null; // Si no se proporciona un archivo, establece el AvatarUrl a null
                }

                ru.ModificaUsuario(u);
                return RedirectToAction("Index", "Usuario"); // Redirige al Index de Usuario después de una edición exitosa
            }
            else
            {
                ViewBag.Roles = Usuario.ObtenerRoles();
                return View(ru.GetUsuario(usuario.IdUsuario));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message.ToString());
            return RedirectToAction("editar", new { id = usuario.IdUsuario });
        }
    }



    [HttpGet]
    /*[Authorize(Roles = "Empleado")]*/
    public ActionResult Perfil(int id)
    {
        //audit

        ViewBag.Roles = Usuario.ObtenerRoles();

        return View(repusu.GetUsuario(id));
    }
    [HttpPost]
    public ActionResult Perfil(Usuario u)
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "Perfil");
        ra.AltaAuditoria(idus, detalle, " Modulo: usuarios");
        //
        u.Clave = Usuario.hashearClave(u.Clave);
        RepositorioUsuario ru = new RepositorioUsuario();

        ru.ModificaUsuario(u);
        //        return RedirectToAction("Index");
        return RedirectToAction("Perfil");
    }

    [HttpGet]
    /*[Authorize(Policy = "Administrador")]*/
    public IActionResult Create()
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "Alta");
        ra.AltaAuditoria(idus, detalle, " Modulo: usuarios");
        //
        ViewBag.Roles = Usuario.ObtenerRoles();
        return View();
    }


    private async Task<string?> AvatarAsync(Usuario usuario, IFormFile avatarFile)
    {
        string[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif", ".jfif", ".bmp" };
        var extension = Path.GetExtension(avatarFile.FileName).ToLower();
        if (!allowedExtensions.Contains(extension))
        {
            ModelState.AddModelError("AvatarFile", "Solo se permiten archivos de imagen (JPG, JPEG, PNG, GIF, JFIF, BMP).");
            return null;
        }

        var directoryPath = Path.Combine(environment.WebRootPath, "update");
        if (!Directory.Exists(directoryPath))
        {
            Directory.CreateDirectory(directoryPath);
        }

        var avatarFileName = $"avatar_{usuario.IdUsuario}{extension}";
        var avatarFilePath = Path.Combine(directoryPath, avatarFileName);

        // Cambios aquí: Guardar directamente en la carpeta "update"
        using (var stream = new FileStream(avatarFilePath, FileMode.Create))
        {
            await avatarFile.CopyToAsync(stream);
        }

        var resizedImagePath = ResizeImage(avatarFilePath);
        return resizedImagePath;
    }

    private string ResizeImage(string imagePath)//redimencionar la imagen
    {
        using (var image = Image.Load(imagePath))
        {
            image.Mutate(x => x.Resize(30, 30));
            var resizedImagePath = Path.Combine(environment.WebRootPath, "update", Path.GetFileName(imagePath));
            image.Save(resizedImagePath);
            return Path.Combine("/update", Path.GetFileName(imagePath));
        }
    }
    [HttpPost]
    public async Task<ActionResult> Create(Usuario usuario, IFormFile? avatarFile)
    {
        try
        {
            if (ModelState.IsValid)
            {
                //audit
                var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
                var detalle = ra.ArmarDetalle(User.Identity.Name, "Alta");
                ra.AltaAuditoria(idus, detalle, " Modulo: usuarios");
                //
                usuario.Clave = Usuario.hashearClave(usuario.Clave);
                var claveIngresada = usuario.Clave;
                var nbreRnd = Guid.NewGuid();
                repusu.AltaUsuario(usuario);

                if (avatarFile != null)
                {
                    var resizedImagePath = await AvatarAsync(usuario, avatarFile);
                    if (resizedImagePath == null)
                    {
                        return View(usuario); // Retorna la vista con errores de validación si la extensión del archivo no es válida
                    }
                    // Actualizar la ruta de la imagen redimensionada en la propiedad AvatarURL del usuario
                    usuario.AvatarUrl = resizedImagePath;

                    repusu.ModificaUsuario(usuario);
                    TempData["Id"] = usuario.IdUsuario;
                    return RedirectToAction(nameof(Index));
                }
                else
                {
                    return RedirectToAction(nameof(Index));
                }
            }
            else
            {
                return View(usuario);
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
            return View();
        }
    }


    [HttpGet]
    public ActionResult CambioAvatar(int id)
    {
        var usuario = repusu.GetUsuario(id);

        // Obtener el ID del usuario autenticado
        var usuarioId = Convert.ToInt32(User.FindFirstValue(ClaimTypes.PrimarySid));
        // Verificar si el usuario autenticado coincide con el ID del perfil solicitado
        if (usuarioId == id)
        {
            RedirectToAction(nameof(Index));
        }

        return View(usuario);
    }


    [HttpPost]
    public async Task<ActionResult> CambioAvatar(int id, IFormFile? avatarFile)
    {
        try
        {
            var usuario = repusu.GetUsuario(id);
            // Obtener el ID del usuario autenticado
            var usuarioId = Convert.ToInt32(User.FindFirstValue(ClaimTypes.PrimarySid));
            // Verificar si el usuario autenticado coincide con el ID del perfil solicitado
            if (usuarioId == id)
            {
                RedirectToAction(nameof(Index));
            }

            if (avatarFile != null)
            {
                var resizedImagePath = await AvatarAsync(usuario, avatarFile);
                if (resizedImagePath == null)
                {
                    ModelState.AddModelError("", "La extensión del archivo no es válida.");
                    return View(usuario);
                }
                // Actualizar la URL del avatar en la base de datos
                usuario.AvatarUrl = resizedImagePath;
                repusu.ModificaUsuario(usuario);
                TempData["Id"] = usuario.IdUsuario;
                return RedirectToAction(nameof(Index));
            }
            else
            {
                // Si no se proporciona un archivo,se sube null.
                usuario.AvatarUrl = "";
                repusu.ModificaUsuario(usuario);
                return RedirectToAction(nameof(Index));
            }
        }
        catch (Exception ex)
        {
            Console.WriteLine(ex.Message.ToString());
            return RedirectToAction("CambioAvatar", new { id = id });
        }
    }

    [HttpGet]
    public ActionResult CambioPassword(int id)
    {
        //audit

        ViewBag.Roles = Usuario.ObtenerRoles();

        return View(repusu.GetUsuario(id));
    }
    [HttpPost]
    public ActionResult CambioPassword(Usuario u)
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "CambioPassword");
        ra.AltaAuditoria(idus, detalle, " Modulo: usuarios");
        //
        u.Clave = Usuario.hashearClave(u.Clave);
        RepositorioUsuario ru = new RepositorioUsuario();

        ru.ModificaUsuario(u);
        //        return RedirectToAction("Index");
        return RedirectToAction("Index");
    }




    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

}
