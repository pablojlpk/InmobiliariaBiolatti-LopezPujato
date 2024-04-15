using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;

public class HomeController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public HomeController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    RepositorioUsuario repusu = new RepositorioUsuario();

    public IActionResult Index()
    {
        //return RedirectToAction("login", "Usuario");
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }

    /*
public IActionResult Login()
    {
       
            return View("Login");
    }

     [HttpPost]
        public async Task<IActionResult> Login(LoginView login)
        {
            try
            {
                if (!ModelState.IsValid)
                {
                    return View();
                }
                else
                {
                    var usuario = repusu.ObtenerUsuarioPorEmail(login.Email);
                    Console.WriteLine($"Usuario encontrado: {usuario?.Email}");
                    string hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(
                        password: login.Clave,
                        salt: System.Text.Encoding.ASCII.GetBytes("inmodotnet"),
                        prf: KeyDerivationPrf.HMACSHA1,
                        iterationCount: 10000,
                        numBytesRequested: 256 / 8
                    ));
                    Console.WriteLine($"Contraseña hasheada: {hashed}");
                    if (usuario == null || usuario.Clave != hashed){
                        Console.WriteLine("Usuario o contraseña incorrectos");
                        ModelState.AddModelError("", "El usuario o la contraseña son incorrectos");
                        return View();
                    }                    
                    var claims = new List<Claim>{
                        new Claim(ClaimTypes.Name, usuario.ToString()),
                        new Claim(ClaimTypes.PrimarySid, usuario.IdUsuario.ToString()),
                        new Claim(ClaimTypes.UserData, usuario.AvatarUrl ?? ""),
                        new Claim(ClaimTypes.Email, usuario.Email),
                        new Claim(ClaimTypes.Role, usuario.RolNombre),
                    };
                    var claimsIdentity = new ClaimsIdentity(claims,CookieAuthenticationDefaults.AuthenticationScheme);
                    await HttpContext.SignInAsync(
                        CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity)
                        );

                    return RedirectToAction("Index", "Home");
                }
            }
            catch (Exception ex)
            {
                ModelState.AddModelError("", ex.Message);
                return View();
            }
        }*/
}
