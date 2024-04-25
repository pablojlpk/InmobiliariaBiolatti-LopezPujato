using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using System.Text;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    RepositorioUsuario repusu = new RepositorioUsuario();
    RepositorioAuditoria ra = new RepositorioAuditoria();

    public IActionResult bienvenido()
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "ACCESO CORRECTO");
        ra.AltaAuditoria(idus, detalle, " Modulo: LOGIN");
        //
        return View("index");
    }

    public IActionResult Index() //LOGIN USUARIO AUTENTIFICADO
    {

        return View();
    }

public IActionResult Restringido()
{
    return View();
}

    public async Task<IActionResult> Login(LoginView usuariologin)
    {
        try
        {
            if (!ModelState.IsValid)
            {
                return View();
            }
            else
            {
                if (usuariologin == null)
                {
                    usuariologin = new LoginView();
                }
                var Mensaje = "";
                RepositorioUsuario ru = new RepositorioUsuario();
                string hashed = Usuario.hashearClave(usuariologin.Clave);

                var usuario = ru.ObtenerUsuarioLogin(usuariologin.Email, hashed);
                if (usuario == null || usuario.Clave != hashed)
                {
                    Mensaje = "El usuario o la contraseña son incorrectos";
                    if (Usuario.hashearClave(usuariologin.Clave) == Usuario.hashearClave(""))
                    {
                        Mensaje = "";
                    }

                    ViewBag.Mensaje = Mensaje;
                    return View();
                }

                var claims = new List<Claim>{
                        new Claim(ClaimTypes.Name, usuario.ToString()),
                        new Claim(ClaimTypes.PrimarySid, usuario.IdUsuario.ToString()),
                        new Claim(ClaimTypes.UserData, usuario.AvatarUrl ?? ""),
                        new Claim(ClaimTypes.Email, usuario.Email),
                        new Claim(ClaimTypes.Role, usuario.RolNombre),

                    };


                var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                await HttpContext.SignInAsync(
                    CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity)

                    );

                return RedirectToAction("bienvenido", "Home");
            }
        }
        catch (Exception ex)
        {
            ModelState.AddModelError("", ex.Message);
            return View();
        }
    }


    public async Task<ActionResult> salir()
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "cierre Sesión");
        ra.AltaAuditoria(idus, detalle, " Modulo: usuarios");
        //

        await HttpContext.SignOutAsync(
           CookieAuthenticationDefaults.AuthenticationScheme);
        return RedirectToAction("Index", "Home");
    }

    public IActionResult Privacy()
    {
        return View();
    }

    //final
}

