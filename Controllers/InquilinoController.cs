using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaBiolatti_LopezPujato.Models;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;
public class InquilinoController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public InquilinoController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    RepositorioAuditoria ra = new RepositorioAuditoria();

    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult Index()
    {
        RepositorioInquilino ri = new RepositorioInquilino();
        var lista = ri.GetInquilinos();

        return View(lista);
    }

    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult agregar()
    {

        return View();
    }

    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult Create(Inquilino i)
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "Alta");
        ra.AltaAuditoria(idus, detalle, " Modulo: Inquilinos");
        //
        RepositorioInquilino ri = new RepositorioInquilino();
        var res = ri.AltaInquilino(i);

        return RedirectToAction(nameof(Index));
    }

    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult Editar(int id)
    {
        RepositorioInquilino ri = new RepositorioInquilino();

        var inquilino = ri.GetInquilino(id);

        return View(inquilino);
    }
    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult ModInquilino(Inquilino i)
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "Editar");
        ra.AltaAuditoria(idus, detalle, " Modulo: Inquilinos");
        //
        RepositorioInquilino ri = new RepositorioInquilino();
        var res = ri.Modifica(i);
        return RedirectToAction(nameof(Index));
    }
    
    [Authorize(Policy = "Administrador")]
    public IActionResult Eliminar(int id)
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "Baja");
        ra.AltaAuditoria(idus, detalle, " Modulo: Inquilinos");
        //
        RepositorioInquilino ri = new RepositorioInquilino();
        var res = ri.Baja(id);
        return RedirectToAction(nameof(Index));
    }



    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
