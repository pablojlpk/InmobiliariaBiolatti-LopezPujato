using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaLopezPujato.Models;

namespace InmobiliariaLopezPujato.Controllers;

public class InquilinoController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public InquilinoController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }

    public IActionResult Index()
    {
        return View();
    }

    public IActionResult Privacy()
    {
        return View();
    }
    
    
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public IActionResult Error()
    {
        return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
    }
}
