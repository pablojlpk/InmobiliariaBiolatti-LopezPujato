
using System.Configuration;
using System.Data;
using System.Data.SqlTypes;
using MySql.Data.MySqlClient;
using Mysqlx.Connection;


namespace InmobiliariaBiolatti_LopezPujato.Models;
public class RepositorioInmueble
{
    readonly string ConnectionString = "Server=localhost;Database=inmodotnet;User=root;Password=;";
    public RepositorioInmueble()
    {

    }
    public IList<Inmueble> GetInmuebles()
    {
        var inmuebles = new List<Inmueble>();
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = $"Select * from inmueble where borrado=0;";
            using (var command = new MySqlCommand(sql, connection))
            {
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        inmuebles.Add(new Inmueble
                        {
                            idinmueble = reader.GetInt32(nameof(Inmueble.idinmueble)),
                            direccion = reader.GetString(nameof(Inmueble.direccion)),
                            ambientes = reader.GetInt32(nameof(Inmueble.ambientes)),
                            superficie = reader.GetInt32(nameof(Inmueble.superficie)),
                            longitud = reader.GetDecimal(nameof(Inmueble.longitud)),
                            idpropietario = reader.GetInt32(nameof(Inmueble.idpropietario)),
                            nompropietario = null,
                            //borrado = reader.GetBoolean(nameof(Inmueble.borrado))
                        });
                    }
                    connection.Close();
                }
            }

        }
      return inmuebles;
    }

//final
}