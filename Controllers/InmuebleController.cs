using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Mvc.TagHelpers;
using ZstdSharp.Unsafe;
using System.Reflection.Metadata.Ecma335;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;

public class InmuebleController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public InmuebleController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    RepositorioAuditoria ra = new RepositorioAuditoria();
    //audit

    [Authorize]
    public IActionResult Index() //funciona ok
    {
        RepositorioInmueble ri = new RepositorioInmueble();
        var inmuebles = ri.GetInmuebles();
        return View(inmuebles);
    }

    [Authorize]
    public IActionResult agregar() //redirecciono ventana alta inmueble y armo listafunciona ok
    {
        RepositorioPropietario rp = new RepositorioPropietario();
        ViewBag.Propietarios = rp.GetPropietarios();

        ViewBag.tipoinmueble = Inmueble.TipoInmueble();
        ViewBag.Habita = Inmueble.Habita();

        return View();
    }
    [Authorize]
    public IActionResult create(Inmueble i) //alta un nuevo inmueblefunciona ok
    {
        if (ModelState.IsValid)
        {

            //audit
            var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
            var detalle = ra.ArmarDetalle(User.Identity.Name, "Modificar");
            ra.AltaAuditoria(idus, detalle, " Modulo: Inmuebles");
            //

            RepositorioInmueble ri = new RepositorioInmueble();
            var res = ri.AltaInmueble(i);
            return RedirectToAction(nameof(Index));
        }

        return View(agregar);

    }
    [Authorize]
    public IActionResult Editar(int id) //funciona ok
    {
        RepositorioInmueble ri = new RepositorioInmueble();
        var inmueble = ri.GetInmueble(id);
        RepositorioPropietario rprop = new RepositorioPropietario();
        ViewBag.Propietarios = rprop.GetPropietarios();
        ViewBag.tipoinmueble = Inmueble.TipoInmueble();
        ViewBag.habita = Inmueble.Habita();
        return View(inmueble);
    }

    [Authorize]
    public IActionResult ModInmueble(Inmueble i)
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "Editar");
        ra.AltaAuditoria(idus, detalle, " Modulo: Inmuebles");
        //
        RepositorioInmueble ri = new RepositorioInmueble();
        ri.ModificaInmueble(i);
        return RedirectToAction(nameof(Index));
    }
    
    [Authorize(Policy = "Administrador")]
    public IActionResult Baja(int id)
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "Baja");
        ra.AltaAuditoria(idus, detalle, " Modulo: Inmuebles");
        //
        RepositorioInmueble ri = new RepositorioInmueble();
        ri.Baja(id);
        return RedirectToAction(nameof(Index));
    }

    [Authorize]
    public IActionResult InmueblesDisponibles() //funciona ok
    {
        RepositorioInmueble ri = new RepositorioInmueble();
        var inmuebles = ri.GetInmueblesDisponibles();
        ViewBag.Titulo = "Listado de Inmuebles Disponibles";
        return View("listado", inmuebles);
    }

     [Authorize]
    public IActionResult ListaContratoPorInmueble(int id)
    {
        RepositorioContrato rc = new RepositorioContrato();
        var buscar = id;
        var contratos = rc.ListadoContratosPorInmueble(buscar);
        ViewBag.Titulo = "Listado de Contratos por Inmueble - Codigo: " + buscar;

        return View("listadocontratos", contratos);
    }


    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
