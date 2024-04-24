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

    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult Index() //funciona ok
    {
        RepositorioInmueble ri = new RepositorioInmueble();
        var inmuebles = ri.GetInmuebles();
        return View(inmuebles);
    }

    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult agregar() //redirecciono ventana alta inmueble y armo listafunciona ok
    {
        RepositorioPropietario rp = new RepositorioPropietario();
        ViewBag.Propietarios = rp.GetPropietarios();

        ViewBag.tipoinmueble = Inmueble.TipoInmueble();

        return View();
    }
    [Authorize(Policy = "EmpleadoOAdministrador")]
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
    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult Editar(int id) //funciona ok
    {
        RepositorioInmueble ri = new RepositorioInmueble();
        var inmueble = ri.GetInmueble(id);
        RepositorioPropietario rprop = new RepositorioPropietario();
        ViewBag.Propietarios = rprop.GetPropietarios();
        ViewBag.tipoinmueble = Inmueble.TipoInmueble();
        return View(inmueble);
    }

    [Authorize(Policy = "EmpleadoOAdministrador")]
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

    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult InmueblesDisponibles() //funciona ok
    {
        RepositorioInmueble ri = new RepositorioInmueble();
        var inmuebles = ri.GetInmueblesDisponibles();
        ViewBag.Titulo = "Listado de Inmuebles Disponibles";
        return View("listado", inmuebles);
    }

     [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult ListaContratoPorInmueble(int id)
    {
        RepositorioContrato rc = new RepositorioContrato();
        var buscar = id;
        var contratos = rc.ListadoContratosPorInmueble(buscar);
        ViewBag.Titulo = "Listado de Contratos por Inmueble";

        return View("listadocontratos", contratos);
    }


    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
