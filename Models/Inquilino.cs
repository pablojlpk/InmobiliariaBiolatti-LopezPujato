using System.ComponentModel.DataAnnotations;

namespace InmobiliariaBiolatti_LopezPujato.Models;

    public  class Inquilino
    {
        public int? idinquilino { get; set; }
        [Required(ErrorMessage = "El nombre es requerido")]
        public string? nombre { get; set; }
        [Required(ErrorMessage = "El apellido es requerido")]
        public string? apellido { get; set; }
        [Required(ErrorMessage = "El dni es requerido")]
        public int? dni { get; set; }
        [Required(ErrorMessage = "El mail es requerido")]
        public string? mail { get; set; }
        [Required(ErrorMessage = "La clave es requerida")]
        public string? clave { get; set; }
        public bool? borrado { get; set; }
        public override string ToString(){
          return $"{nombre}, {apellido}  ({dni})";  
        } 
    }




