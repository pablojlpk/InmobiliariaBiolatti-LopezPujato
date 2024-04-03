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
        RepositorioContrato rc = new RepositorioContrato();
        var contratos = rc.GetContratos();
        return View(contratos);
        
    }
    public IActionResult agregar()
    {
       ViewBag.Inmuebles = rinmuebles.GetInmuebles();
       ViewBag.Inquilinos = rinquilinos.GetInquilinos();
        return View();
    }
    public IActionResult Create(Contrato c)
    {
        RepositorioContrato rc = new RepositorioContrato();
        rc.AltaContrato(c);
        return RedirectToAction(nameof(Index));
    }


    
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
