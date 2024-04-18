using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Mvc.TagHelpers;
using ZstdSharp.Unsafe;
using System.Reflection.Metadata.Ecma335;
using System.Security.Claims;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;

public class PropietarioController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public PropietarioController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    RepositorioAuditoria ra = new RepositorioAuditoria();
    public IActionResult Index()
    {
        RepositorioPropietario rp = new RepositorioPropietario();
        var lista = rp.GetPropietarios();

        return View(lista);
    }



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

    public IActionResult Agregar()
    {
        return View();
    }

    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }

}
