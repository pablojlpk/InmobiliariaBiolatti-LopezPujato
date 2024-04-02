namespace InmobiliariaBiolatti_LopezPujato.Models;

public class Inmueble{

    public int idinmueble { get; set; }
    public string? direccion { get; set; }
    public int? ambientes { get; set; }
    public int? superficie { get; set; }
    public decimal? latitud { get; set; }
    public decimal? longitud { get; set; }
    public int? idpropietario { get; set; }
    public Propietario? datospropietario { get; set; }
 
    public bool? borrado { get; set; }
    public override string ToString()
    {
        return $"{direccion}, amb: {ambientes}, superf: {superficie}";

    
    }

}