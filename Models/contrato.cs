namespace InmobiliariaBiolatti_LopezPujato.Models;

public class Contrato{
    public int? idcontrato { get; set; }
    public int? idinquilino { get; set; }
    public Inquilino? datosinquilino { get; set; }
    public int? idinmueble { get; set; }
    public Inmueble? datosinmueble { get; set; }
    public DateTime? fdesde { get; set; }
    public DateTime? fhasta { get; set; }
    public decimal? importe { get; set; }
    public bool? borrado { get; set; }
}