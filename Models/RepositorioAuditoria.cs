using System.Data;
using MySql.Data.MySqlClient;

namespace InmobiliariaBiolatti_LopezPujato.Models;

public class RepositorioAuditoria
{
    readonly string ConnectionString = "Server=localhost;Database=inmodotnet;User=root;Password=;";
    public RepositorioAuditoria()
    {

    }

    public int AltaAuditoria(string idusuario,string detalle, string modulo)
    {
        int res = -1;

        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = $@"INSERT INTO auditorias ({nameof(Auditoria.IdUsuario)},
              {nameof(Auditoria.Fecha)},
              {nameof(Auditoria.Observaciones)})
            values (@IdUsuario,@Fecha,@Observaciones)";
            using (var command = new MySqlCommand(sql, connection))
            {
                command.CommandType = CommandType.Text;
                command.Parameters.AddWithValue($@"{nameof(Auditoria.IdUsuario)}", Convert.ToInt32(idusuario));
                command.Parameters.AddWithValue("@Fecha", DateTime.Now);
                command.Parameters.AddWithValue("@Observaciones", detalle + modulo);
                connection.Open();
                res=Convert.ToInt32(command.ExecuteScalar());
                connection.Close();
            }
        }


        return res;
    }

    public IList<Auditoria> obtenerAuditorias()// funciona ok
    {
        var auditorias = new List<Auditoria>();

        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = $@"SELECT {nameof(Auditoria.IdAuditoria)},
            {nameof(Auditoria.IdUsuario)}, {nameof(Auditoria.Fecha)},
            {nameof(Auditoria.Observaciones)}
            FROM auditorias where 1 ORDER by fecha DESC;";
            using (var command = new MySqlCommand(sql, connection))
            {
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {

                        auditorias.Add(new Auditoria
                        {
                            IdAuditoria = reader.GetInt32(nameof(Auditoria.IdAuditoria)),
                            IdUsuario = reader.GetInt32(nameof(Auditoria.IdUsuario)),
                            Fecha = reader.GetDateTime(nameof(Auditoria.Fecha)),
                            Observaciones = reader.GetString(nameof(Auditoria.Observaciones)),
                            
                        });
                    }
                    connection.Close();
                }
            }
        }
        return auditorias;
    }


public string ArmarDetalle(string usuario, string accion){
    return ("Usuario:"+usuario+"-Acción: "+accion);
}
}