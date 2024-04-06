using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace InmobiliariaBiolatti_LopezPujato.Controllers
{
    public class PagoController : Controller
    {
        private readonly ILogger<PagoController> _logger;
        RepositorioContrato rcontratos = new RepositorioContrato();
        RepositorioInmueble rinmuebles = new RepositorioInmueble();
        RepositorioInquilino rinquilinos = new RepositorioInquilino();

        public PagoController(ILogger<PagoController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            RepositorioPago rp = new RepositorioPago();
            var pagos = rp.GetPagos();
            return View(pagos);
        }

        public IActionResult agregar()
        {
            ViewBag.Contratos = rcontratos.GetContratos();
            return View();
        }
        public IActionResult detalle()
        {
            ViewBag.Contratos = rcontratos.GetContratos();
            Pago p = new Pago();
            p =new RepositorioPago.GetPago();

            return View(p);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Create(Pago p)
        {
            if (ModelState.IsValid)
            {
                RepositorioPago rp = new RepositorioPago();
                rp.altaPago(p);
                return RedirectToAction(nameof(Index));
            }
            ViewBag.Contratos = rcontratos.GetContratos();
            return View(p);
        }

        public IActionResult Editar(int id)
        {
            ViewBag.Contratos = rcontratos.GetContratos();
            Pago p = new Pago();
            p = new RepositorioPago().GetPago(id);
            return View(p);
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public IActionResult Editar(Pago p)
        {
            if (ModelState.IsValid)
            {
                RepositorioPago rp = new RepositorioPago();
                rp.ModificaPago(p);
                return RedirectToAction(nameof(Index));
            }
            ViewBag.Contratos = rcontratos.GetContratos();
            return View(p);
        }
        

    }}