using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Mvc.TagHelpers;
using ZstdSharp.Unsafe;
using System.Reflection.Metadata.Ecma335;
using Microsoft.AspNetCore.Authorization;
using System.Security.Claims;
using System.Collections.Immutable;

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
    RepositorioAuditoria ra = new RepositorioAuditoria();


    [Authorize]
    public IActionResult Index()
    {
        RepositorioContrato rc = new RepositorioContrato();
        var contratos = rc.GetContratos();
        return View(contratos);

    }

    [Authorize]
    public IActionResult agregar()
    {
        ViewBag.Inmuebles = rinmuebles.GetInmuebles();
        ViewBag.Inquilinos = rinquilinos.GetInquilinos();
        return View();
    }
    [Authorize]
    public IActionResult Create(Contrato c)
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "Alta");
        ra.AltaAuditoria(idus, detalle, " Modulo: Contrato");
        //

        RepositorioContrato rc = new RepositorioContrato();
        rc.AltaContrato(c);
        rc.ModificaEstadoInmuebleContrato();
        return RedirectToAction(nameof(Index));
    }


    [Authorize]
    public IActionResult Editar(int id)
    {
        ViewBag.Inmuebles = rinmuebles.GetInmuebles();
        ViewBag.Inquilinos = rinquilinos.GetInquilinos();

        Contrato c = new Contrato();
        c = new RepositorioContrato().GetContrato(id);
        return View(c);
    }

    [Authorize(Policy = "Administrador")]
    public IActionResult Eliminar(int id)
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "Baja");
        ra.AltaAuditoria(idus, detalle, " Modulo: Contrato");
        //
        RepositorioContrato rc = new RepositorioContrato();
        rc.Eliminar(id);
        return RedirectToAction(nameof(Index));
    }

    [Authorize]
    public IActionResult ModContrato(Contrato c)
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "Modificar");
        ra.AltaAuditoria(idus, detalle, " Modulo: Contrato");
        //
        RepositorioContrato rc = new RepositorioContrato();
        rc.ModificaContrato(c);
        rc.ModificaEstadoInmuebleContrato();
        return RedirectToAction(nameof(Index));
    }
    [Authorize]
    public IActionResult Detalle(int id)
    {
        ViewBag.Inmuebles = rinmuebles.GetInmuebles();
        ViewBag.Inquilinos = rinquilinos.GetInquilinos();
        Contrato c = new Contrato();
        c = new RepositorioContrato().GetContrato(id);
        return View(c);
    }

    [Authorize]
    public IActionResult ListarContratosVigentes()
    {
        RepositorioContrato rc = new RepositorioContrato();
        var contratos = rc.ListarContratosVigentes();
        ViewBag.Titulo = "Listado de Contratos Vigentes";
        return View("listado", contratos);
    }

    [Authorize]
    public IActionResult ListaPagosPorContrato()
    {
        RepositorioPago rp = new RepositorioPago();
        var idcontrato = Convert.ToInt32(RouteData.Values["id"]);
        
        var pagos = rp.ListarPagosPorContrato(idcontrato);
        ViewBag.Titulo="Listado de Pagos por Contrato - Nro Contrato: "+ idcontrato;
        return View("listadopagos", pagos);
    }


    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
