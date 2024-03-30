
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
            var sql = $"Select idinmueble, direccion, ambientes, superficie, latitud, longitud,  p.idpropietario, p.nombre, p.apellido, p.dni from inmuebles i Inner join propietario p on i.idpropietario=p.idpropietario";


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

    public Inmueble? GetInmueble(int idinmueble) //funciona ok
    {
        Inmueble? inmueble = null;
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = @$"SELECT i.idinmueble, i.direccion, i.ambientes, i.superficie, i.latitud, i.longitud,  p.idpropietario, p.nombre, p.apellido, p.dni
        FROM inmuebles i
        INNER JOIN propietario p on p.idpropietario=i.idpropietario
        WHERE i.borrado=false and i.idinmueble = @idinmueble";
            using (var command = new MySqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue($"@idinmueble", idinmueble);
                connection.Open();
                using var reader = command.ExecuteReader();
                if (reader.Read())
                {
                    inmueble = new Inmueble
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
                    };
                }
                connection.Close();
            }

        }

        return inmueble;
    }

    public int ModificaInmueble(Inmueble i) //funciona ok
    {

        using (var connection = new MySqlConnection(ConnectionString))
        {
            //var sql2 = @$"UPDATE inmuebles SET direccion = '{i.direccion}', ambientes = {i.ambientes}, superficie = {i.superficie}, idpropietario = {i.idpropietario} WHERE idinmueble = {i.idinmueble}";
            var sql=@$"UPDATE inmuebles SET {nameof(Inmueble.direccion)} =@{nameof(Inmueble.direccion)},
            {nameof(Inmueble.latitud)} =@{nameof(Inmueble.latitud)}, {nameof(Inmueble.longitud)} =@{nameof(Inmueble.longitud)},
             {nameof(Inmueble.ambientes)} =@{nameof(Inmueble.ambientes)}, {nameof(Inmueble.superficie)} =@{nameof(Inmueble.superficie)}, 
             {nameof(Inmueble.idpropietario)} =@{nameof(Inmueble.idpropietario)}
              WHERE {nameof(Inmueble.idinmueble)} =@{nameof(Inmueble.datospropietario.idpropietario)}";

            using (var command = new MySqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue($"@{nameof(Inmueble.direccion)}", i.direccion);
                command.Parameters.AddWithValue($"@{nameof(Inmueble.ambientes)}", i.ambientes);
                command.Parameters.AddWithValue($"@{nameof(Inmueble.latitud)}", i.latitud);
                command.Parameters.AddWithValue($"@{nameof(Inmueble.longitud)}", i.longitud);
                command.Parameters.AddWithValue($"@{nameof(Inmueble.superficie)}", i.superficie);
                command.Parameters.AddWithValue($"@{nameof(Inmueble.idpropietario)}", i.datospropietario.idpropietario);
                command.Parameters.AddWithValue($"@{nameof(Inmueble.idinmueble)}", i.idinmueble);
                
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }

        }
        return 0;

    }

//final
}
