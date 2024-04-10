using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Authorization;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;



public class UsuarioController : Controller
{
    private readonly ILogger<UsuarioController> _logger;

    public UsuarioController(ILogger<UsuarioController> logger)
    {
        _logger = logger;
    }

    RepositorioUsuario repusu = new RepositorioUsuario();

//[Authorize(Policy = "Administrador")]
    public IActionResult Index()
    {
        var lista = repusu.GetUsuarios();
        return View(lista);
    }

    
    public IActionResult Login()
    {
        return View();
    }
    
    public IActionResult create()
    {
        ViewBag.Roles = Usuario.ObtenerRoles();
        return View();
    }
    public IActionResult Alta(Usuario u)
    {
        repusu.AltaUsuario(u);
        return RedirectToAction("Index");
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
