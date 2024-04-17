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
        ra.AltaAuditoria(1,"consulta-","usuarios");
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
        ViewBag.Roles = Usuario.ObtenerRoles();
        return View(repusu.GetUsuario(id));
    }
    public ActionResult EditarUsuario(Usuario u)
    {
        u.Clave = Usuario.hashearClave(u.Clave);
        RepositorioUsuario ru = new RepositorioUsuario();
        
        ru.ModificaUsuario(u);
        //        return RedirectToAction("Index");
        return RedirectToAction("Index");
    }

    [HttpGet]
    /*[Authorize(Policy = "Administrador")]*/
    public IActionResult Create()
    {
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



    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

}
