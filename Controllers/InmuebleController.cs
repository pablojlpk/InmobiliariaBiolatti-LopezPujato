using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Mvc.TagHelpers;
using ZstdSharp.Unsafe;
using System.Reflection.Metadata.Ecma335;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;

public class InmuebleController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public InmuebleController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        RepositorioInmueble ri= new RepositorioInmueble();

        var inmuebles = ri.GetInmuebles();


        return View(inmuebles);
    }
    public IActionResult agregar()
    {
        RepositorioPropietario rp = new RepositorioPropietario();
        ViewBag.Propietarios = rp.GetPropietarios();
        
        return View();
    }
public IActionResult create(Inmueble i)
{ 
 
 RepositorioInmueble ri= new RepositorioInmueble();
 var res=ri.AltaInmueble(i);
 
    return RedirectToAction(nameof(Index));
}




    /// <summary>
    /// ////
    /// </summary>
    /// <returns></returns>

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
   


}
