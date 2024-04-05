using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace InmobiliariaBiolatti_LopezPujato.Models;

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


        public override string ToString(){
            var res =$" {datosContrato}";
            return res;
        }

}