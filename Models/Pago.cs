using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.SignalR;

namespace InmobiliariaBiolatti_LopezPujato.Models;

//var listapagos = new List<string>();
//public int numero=0;


public class Pago{ 
    [Key]
		[Display(Name = "Identificador")]
        public int idpago {get; set;} 

        [ForeignKey(nameof(idcontrato))]
        
		[Display(Name = "Contrato")]
		public int idcontrato { get; set; }
        public Contrato? datosContrato{ get; set; }
		public decimal importe{ get; set; }
        
        [DataType(DataType.Date)]
        public DateTime fpago { get; set; }
        public bool borrado { get; set; }

        public bool anulado { get; set; }
        public String? detalle {get; set; }="";

}