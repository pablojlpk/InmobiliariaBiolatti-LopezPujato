using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Mvc.TagHelpers;
using ZstdSharp.Unsafe;
using System.Reflection.Metadata.Ecma335;
using System.Security.Claims;
using Microsoft.AspNetCore.Components;
using Microsoft.AspNetCore.Authorization;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;

public class PropietarioController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public PropietarioController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    RepositorioAuditoria ra = new RepositorioAuditoria();

    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult Index()
    {
        RepositorioPropietario rp = new RepositorioPropietario();
        var lista = rp.GetPropietarios();

        return View(lista);
    }


    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult create(Propietario p)
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "Alta");
        ra.AltaAuditoria(idus, detalle, " Modulo: Propietarios");
        //
        RepositorioPropietario rp = new RepositorioPropietario();
        rp.AltaPropietario(p);
        return RedirectToAction(nameof(Index));
    }
    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult Editar(int id)
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "Editar");
        ra.AltaAuditoria(idus, detalle, " Modulo: Propietarios");
        //
        RepositorioPropietario rp = new RepositorioPropietario();
        var propietario = rp.GetPropietario(id);


        return View(propietario);
    }

    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult ModPropietario(Propietario p)
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "Modificar");
        ra.AltaAuditoria(idus, detalle, " Modulo: Propietarios");
        //
        RepositorioPropietario rp = new RepositorioPropietario();
        var res = rp.Modifica(p);
        return RedirectToAction(nameof(Index));
    }
    [Authorize(policy: "Administrador")]
    public IActionResult Baja(int id)
    {
        //audit
        var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
        var detalle = ra.ArmarDetalle(User.Identity.Name, "Baja");
        ra.AltaAuditoria(idus, detalle, " Modulo: Propietarios");
        //
        RepositorioPropietario rp = new RepositorioPropietario();
        rp.Baja(id);
        return RedirectToAction(nameof(Index));
    }

    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult Agregar()
    {
        return View();
    }

    [Authorize(Policy = "EmpleadoOAdministrador")]
    public IActionResult ListadoInmueblesPorPropietario(int idp){
        RepositorioInmueble ri = new RepositorioInmueble();
        var idprop = Convert.ToInt32(RouteData.Values["id"]);
        
        var inmuebles = ri.ListadoInmueblesPorPropietario(idprop);
        ViewBag.Titulo="Listado de Inmuebles por Propietario";
        return View("listado",inmuebles);

        
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

}
