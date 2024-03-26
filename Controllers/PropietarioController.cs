using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Mvc.TagHelpers;
using ZstdSharp.Unsafe;
using System.Reflection.Metadata.Ecma335;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;

public class PropietarioController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public PropietarioController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        RepositorioPropietario rp = new RepositorioPropietario();
        var lista = rp.GetPropietarios();

        return View(lista);
    }

    public IActionResult Agregar()
    {

        return View();
    }

    public IActionResult create(Propietario p)
    {
        RepositorioPropietario rp = new RepositorioPropietario();
        rp.AltaPropietario(p);
        return RedirectToAction(nameof(Index));
    }

    public IActionResult Editar(int id)
    {
        RepositorioPropietario rp = new RepositorioPropietario();
        var propietario = rp.GetPropietario(id);

        return View(propietario);
    }


    public IActionResult ModPropietario(Propietario p)
    {
        RepositorioPropietario rp = new RepositorioPropietario();
        var res=rp.Modifica(p);
        return RedirectToAction(nameof(Index));
    }


    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
    public IActionResult Baja(int id){
        RepositorioPropietario rp = new RepositorioPropietario();
        rp.Baja(id);
        return RedirectToAction(nameof(Index));
    }


}
