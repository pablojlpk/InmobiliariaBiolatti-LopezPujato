using System.ComponentModel.DataAnnotations;
using System.Reflection.Metadata.Ecma335;

namespace InmobiliariaBiolatti_LopezPujato.Models;



public class Inmueble
{
    [Key]

    public int idinmueble { get; set; }
    [Required]
    [DataType(DataType.Text)]
    public string? direccion { get; set; }
    [Required]
    [DataType(DataType.Text)]
    public int? ambientes { get; set; }
    [Required]
    [DataType(DataType.Text)]
    public int? superficie { get; set; }
    [Required]
    [DataType(DataType.Text)]
    public decimal? latitud { get; set; }
    [Required]
    [DataType(DataType.Text)]
    public decimal? longitud { get; set; }
    [DataType(DataType.Text)]
    public int? idpropietario { get; set; }

    public Propietario? datospropietario { get; set; }

    public bool? borrado { get; set; }
    public string? tipoinmueble { get; set; }
    [Required]

    public decimal importe { get; set; }
    public string? estado { get; set; } = "Disponible";
    public string? habilitado{get; set;}

    public override string ToString()
    {
        return $"{direccion}, amb: {ambientes}, superf: {superficie}, tipo: {tipoinmueble}, PB$: {importe}";
    }


    public static List<string> TipoInmueble()
    {
        List<string> listado = new List<string> { "comercial", "residencial", "Casa", "Comercio", "Departamento", "Depósito", "Local", "Terreno" };

        return listado;
    }
    public static List<string> Habita()
    {

        List<string> listado = new List<string> { "SI", "NO" };

        return listado;
    }

}


