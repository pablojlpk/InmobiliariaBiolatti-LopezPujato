using System.Security.Claims;
using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace InmobiliariaBiolatti_LopezPujato.Controllers
{
    public class PagoController : Controller
    {
        private readonly ILogger<PagoController> _logger;
        RepositorioPago repositorioPago = new RepositorioPago();
        RepositorioContrato rcontratos = new RepositorioContrato();
        RepositorioInmueble rinmuebles = new RepositorioInmueble();
        RepositorioInquilino rinquilinos = new RepositorioInquilino();

        public PagoController(ILogger<PagoController> logger)
        {
            _logger = logger;
        }
        RepositorioAuditoria ra = new RepositorioAuditoria();

        [Authorize]
        public IActionResult Index()
        {
            RepositorioPago rp = new RepositorioPago();
            var pagos = rp.GetPagos();
            return View(pagos);
        }
        [Authorize]
        public IActionResult agregar()
        {

            ViewBag.Contratos = rcontratos.GetContratos();
            ViewBag.Meses= Pago.MesesList();

            return View();
        }

        [Authorize]
        public IActionResult detalle(int id)
        {
            Pago p = new RepositorioPago().GetPago(id);
            Contrato contrato = rcontratos.GetContrato(p.idcontrato);
            p.datosContrato = contrato;
            return View(p);
        }


        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public IActionResult Create(Pago p)
        {
            if (ModelState.IsValid)
            {
                //audit
                var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
                var detalle = ra.ArmarDetalle(User.Identity.Name, "Alta");
                ra.AltaAuditoria(idus, detalle, " Modulo: Pagos");
                //
                RepositorioPago rp = new RepositorioPago();
                rp.altaPago(p);

                return RedirectToAction(nameof(Index));
            }
            ViewBag.Contratos = rcontratos.GetContratos();
           
            return View(p);

        }
        [Authorize]
        public IActionResult multa()
        {
            ViewBag.Contratos = rcontratos.GetContratos();

            return View();
        }

        [Authorize]
        public IActionResult AgregarMulta(Pago p)
        {
            if (ModelState.IsValid)
            {
                //audit
                var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
                var detalle = ra.ArmarDetalle(User.Identity.Name, "MULTA");
                ra.AltaAuditoria(idus, detalle, " Modulo: Pagos");
                //

                RepositorioPago rp = new RepositorioPago();
                rp.altaMulta(p);


            }
            return RedirectToAction(nameof(Index));


        }
        [Authorize]
        public IActionResult Editar(int id)
        {
            ViewBag.Contratos = rcontratos.GetContratos();
            Pago p = new Pago();
            p = new RepositorioPago().GetPago(id);
            return View(p);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        [Authorize]
        public IActionResult Editar(Pago p)
        {
            if (ModelState.IsValid)
            {
                //audit
                var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
                var detalle = ra.ArmarDetalle(User.Identity.Name, "Modificar");
                ra.AltaAuditoria(idus, detalle, " Modulo: Pagos");
                //
                RepositorioPago rp = new RepositorioPago();
                rp.ModificaPago(p);
                return RedirectToAction(nameof(Index));
            }
            ViewBag.Contratos = rcontratos.GetContratos();
            return View(p);
        }
        [Authorize]
        public IActionResult AnularPago(int idpago)
        {
            //audit
            var idus = (User.Claims.FirstOrDefault(c => c.Type == ClaimTypes.PrimarySid).Value);
            var detalle = ra.ArmarDetalle(User.Identity.Name, "Anular");
            ra.AltaAuditoria(idus, detalle, " Modulo: Pagos");
            //
            repositorioPago.Anular(idpago);
            return RedirectToAction(nameof(Index));
        }

        [Authorize]
        public IActionResult anular(int? id)

        {
            if (id == null)
            {
                return NotFound();
            }

            var pago = repositorioPago.GetPago(id.Value);
            if (pago == null)
            {
                return NotFound();
            }

            ViewBag.Contratos = rcontratos.GetContratos();
            return View(pago);
        }

        //final
    }
}



