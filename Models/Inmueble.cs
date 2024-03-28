namespace InmobiliariaBiolatti_LopezPujato.Models;

public class Inmueble{

    public int idinmueble { get; set; }
    public string? direccion { get; set; }
    public int? ambientes { get; set; }
    public int? superficie { get; set; }
    public decimal? latitud { get; set; }
    public decimal? longitud { get; set; }
    public Propietario? propietario { get; set; }
    public string? nompropietario { get; set; }
    public bool? borrado { get; set; }

}