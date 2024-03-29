namespace InmobiliariaBiolatti_LopezPujato.Models;

public class Propietario
{
    public int? idpropietario { get; set; }
    public string? nombre { get; set; }
    public string? apellido { get; set; }
    public int? dni { get; set; }
    public string? mail { get; set; }
    public string? clave { get; set; }
    public bool? borrado { get; set; }
    public override string ToString()
    {
        var res = $"{apellido}, {nombre} ({dni})";
        return res;
    }
}






