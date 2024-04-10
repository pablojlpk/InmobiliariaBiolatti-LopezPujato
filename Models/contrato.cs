using System.ComponentModel.DataAnnotations;

namespace InmobiliariaBiolatti_LopezPujato.Models;

public class Contrato
{
    [Key]
    public int? idcontrato { get; set; }
    public int? idinquilino { get; set; }
    public Inquilino? datosinquilino { get; set; }
    public int? idinmueble { get; set; }
    public Inmueble? datosinmueble { get; set; }
    [DataType(DataType.Date)]
    public DateTime? fdesde { get; set; }
    [DataType(DataType.Date)]
    public DateTime? fhasta { get; set; }
    public decimal? importe { get; set; }

    public override string ToString()
    {
        return $"C.C.:{idcontrato},  C.Inm.:{idinmueble}-{datosinmueble.direccion} Cod. Inq: {idinquilino}-{datosinquilino.apellido}, {datosinquilino.nombre}";
    }   
}