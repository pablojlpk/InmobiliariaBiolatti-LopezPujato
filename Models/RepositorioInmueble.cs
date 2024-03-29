
using System.ComponentModel;
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
            //var sql = $"Select * from inmuebles where borrado=0;";
            var sql = $"Select idinmueble, direccion, ambientes, superficie, latitud, longitud, p.idpropietario, p.nombre, p.apellido, p.dni from inmuebles i Inner join propietario p on i.idpropietario=p.idpropietario";
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
                            latitud = reader.GetDecimal(nameof(Inmueble.latitud)),
                            longitud = reader.GetDecimal(nameof(Inmueble.longitud)),
                            idpropietario = reader.GetInt32(nameof(Inmueble.idpropietario)),
                            datospropietario = new Propietario
                            {
                                idpropietario = reader.GetInt32(nameof(Propietario.idpropietario)),
                                nombre = reader.GetString(nameof(Propietario.nombre)),
                                apellido = reader.GetString(nameof(Propietario.apellido)),
                                dni = reader.GetInt32(nameof(Propietario.dni))
                            }
                            
                            //borrado = reader.GetBoolean(nameof(Inmueble.borrado))
                        });
                    }
                    connection.Close();
                }
            }

        }
      return inmuebles;
    }



    public Inmueble AltaInmueble(Inmueble i) // funciona ok
    {
     
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = $"INSERT INTO inmuebles (direccion,ambientes,superficie,longitud,idpropietario) VALUES ('{i.direccion}',{i.ambientes},{i.superficie},{i.longitud},{i.idpropietario})";


            using (var command = new MySqlCommand(sql, connection))
            {
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
        return i;
    }


//final
}