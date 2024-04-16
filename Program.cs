using System.Security.Claims;
using Google.Protobuf.WellKnownTypes;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Http.Features;
using Microsoft.Extensions.Options;

var builder = WebApplication.CreateBuilder(args);


var configuration = builder.Configuration;

// Add services to the container.
//Agregando los Servicios

builder.Services.AddControllersWithViews();

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
    .AddCookie(options => {
        options.LoginPath = "/Home/Index";// item para login
        options.LogoutPath = "/usuario/Logout";//item para logout
        options.AccessDeniedPath = "/Home/Restringido"; //item para req. restringidos

    });


builder.Services.AddAuthorization(options =>  //requiero politicas
{
    options.AddPolicy("Administrador", policy =>
     policy.RequireRole("Administrador"));
     options.AddPolicy("Empleado", policy =>
     policy.RequireRole("Empleado"));
     //no activo la policy de empleado ya que solamente tengo dos roles en este ejemplo
});


/*
var claims = new List<Claim>
{
    new Claim(ClaimTypes.Name, e.nombre),
    new Claim("FullName", e.nombre + " " + e.apellido),
    new Claim(ClaimTypes.Role, e.rol),

};*/






var app = builder.Build();

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
    app.UseHsts();
}



app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Home}/{action=Index}/{id?}");

app.Run();
