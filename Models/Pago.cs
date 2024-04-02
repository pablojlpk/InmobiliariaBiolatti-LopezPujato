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
        public Contrato? Contrato{ get; set; }
		public decimal Monto{ get; set; }
        
        [DataType(DataType.Date)]
        public DateTime Afecha { get; set; }

}