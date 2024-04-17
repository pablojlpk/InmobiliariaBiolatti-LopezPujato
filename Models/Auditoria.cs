using System.ComponentModel.DataAnnotations;
using System.Security.Permissions;

namespace InmobiliariaBiolatti_LopezPujato.Models;

public class Auditoria()
{
    [Key]
    public int IdAuditoria {get;  set;}
    public int IdUsuario {get;set;}
    [DataType(DataType.DateTime)]
    public DateTime Fecha {get;set;}
    public string? Observaciones{get;set;}
    
}