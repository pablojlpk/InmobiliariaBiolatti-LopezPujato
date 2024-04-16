using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using InmobiliariaBiolatti_LopezPujato.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using System.Security.Claims;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using System.Text;

namespace InmobiliariaBiolatti_LopezPujato.Controllers;

public class AuditoriaController : Controller
{
    private readonly ILogger<HomeController> _logger;

    public AuditoriaController(ILogger<HomeController> logger)
    {
        _logger = logger;
    }
    


    public IActionResult Index() 
    {

        return View();
    }

}
