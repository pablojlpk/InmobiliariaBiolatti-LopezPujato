using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Mvc;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;
public class PagoController : Controller
{
    private readonly ILogger<HomeController> _logger;   
    RepositorioContrato rcontratos = new RepositorioContrato();
     RepositorioInmueble rinmuebles = new RepositorioInmueble();
    RepositorioInquilino rinquilinos = new RepositorioInquilino();
    public PagoController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
{
    RepositorioPago rp = new RepositorioPago();
    var pagos = rp.GetPagos();
    return View(pagos); // Aquí se pasan los datos de los pagos a la vista
}


public IActionResult agregar()
    {   
        ViewBag.Inmuebles = rinmuebles.GetInmuebles();
        ViewBag.Inmuebles = rinmuebles.GetInmuebles();
        ViewBag.Inquilinos = rinquilinos.GetInquilinos();
        return View();
    }
public IActionResult create(Pago p)
    {
        RepositorioPago rp = new RepositorioPago();
        rp.altaPago(p);
        return RedirectToAction(nameof(Index));
    }



    

}


