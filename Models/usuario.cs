using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Cryptography.KeyDerivation;
using Microsoft.AspNetCore.Mvc;

namespace InmobiliariaBiolatti_LopezPujato.Models;

public enum enRoles
{
    Administrador = 1,
    Empleado = 2,
}

public class Usuario
{
    [Key]
    [Display(Name = "Código")]
    public int IdUsuario { get; set; }
    [Required]
    public string? Nombre { get; set; }
    [Required]
    public string? Apellido { get; set; }

    
    [Required]
    public string? Email { get; set; }

    [Required, DataType(DataType.Password)]
    public string? Clave { get; set; }="";
    public string? AvatarUrl { get; set; } = "";

    [NotMapped]
    public IFormFile? AvatarFile { get; set; }

    public bool? Borrado { get; set; }

    
    [Required]
    public int? Permiso { get; set; }
    [Display(Name = "Rol")]
    public string RolNombre => Permiso >0 ? ((enRoles)Permiso).ToString() : "";

    public static IDictionary<int, string> ObtenerRoles()
    {
        SortedDictionary<int, string> roles = new SortedDictionary<int, string>();
        Type tipoEnumRol = typeof(enRoles);

        foreach (var rol in Enum.GetValues(tipoEnumRol))
        {
            roles.Add((int)rol, Enum.GetName(tipoEnumRol, rol));
        }
        return roles;
    }
    

    public override string ToString()
    {
        return $"{Apellido}, {Nombre}-({IdUsuario})";
    }
    
     public static string hashearClave(string clave){
            string hashed = Convert.ToBase64String(KeyDerivation.Pbkdf2(
                        password: clave,
                        salt: System.Text.Encoding.ASCII.GetBytes("inmodotnet"),
                        prf: KeyDerivationPrf.HMACSHA1,
                        iterationCount: 10000,
                        numBytesRequested: 256 / 8
                    ));
            return hashed;
        }

}