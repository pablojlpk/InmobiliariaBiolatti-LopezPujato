using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Mvc.TagHelpers;
using ZstdSharp.Unsafe;
using System.Reflection.Metadata.Ecma335;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;

public class ContratoController : Controller
{
    private readonly ILogger<HomeController> _logger;

    
    RepositorioInmueble rinmuebles = new RepositorioInmueble();
RepositorioInquilino rinquilinos = new RepositorioInquilino();
    

    public ContratoController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

     public IActionResult Index()
    {


        return View();
    }
    public IActionResult Agregar()
    {
              ViewBag.Inmuebles = rinmuebles.GetInmuebles();
       ViewBag.Inquilinos = rinquilinos.GetInquilinos();    
        return View();
    }

    
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
