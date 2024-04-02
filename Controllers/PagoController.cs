using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Mvc;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;
public class PagoController : Controller
{
    private readonly ILogger<HomeController> _logger;   

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



    

}


