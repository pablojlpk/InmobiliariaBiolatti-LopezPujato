using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaBiolatti_LopezPujato.Models;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;
public class InquilinoController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public InquilinoController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        RepositorioInquilino ri=new RepositorioInquilino();
        var lista = ri.GetInquilinos();
        
        return View(lista);
    }


public IActionResult agregar()
{

    return View();
}
    
    public IActionResult Create(Inquilino i)
    {
        RepositorioInquilino ri = new RepositorioInquilino();
        var res=ri.AltaInquilino(i);
  
        return RedirectToAction(nameof(Index));
    }
    
    public IActionResult Eliminar(int id)
    {
        RepositorioInquilino ri = new RepositorioInquilino();
        var res=ri.Baja(id);
        
        return RedirectToAction(nameof(Index));
    }
    
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
