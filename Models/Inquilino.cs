namespace InmobiliariaBiolatti_LopezPujato.Models;

    public  class Inquilino
    {
        public int? idinquilino { get; set; }
        public string? nombre { get; set; }
        public string? apellido { get; set; }
        public int? dni { get; set; }
        public string? mail { get; set; }
        public string? clave { get; set; }
        public bool? borrado { get; set; }
    public override string ToString(){
        return $"{apellido}, {nombre} ({dni})";
    }
    }
    




