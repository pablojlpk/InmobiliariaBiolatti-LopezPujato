
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using Mysqlx.Connection;
using Org.BouncyCastle.Asn1.X509.SigI;

namespace InmobiliariaBiolatti_LopezPujato.Models;
public class RepositorioPropietario
{
    readonly string ConnectionString = "Server=localhost;Database=inmodotnet;User=root;Password=;";
    public RepositorioPropietario()
    {

    }

    public IList<Propietario> GetPropietarios()// funciona ok
    {
        var propietarios = new List<Propietario>();


        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = $"SELECT {nameof(Propietario.idpropietario)}, {nameof(Propietario.nombre)}, {nameof(Propietario.apellido)}, {nameof(Propietario.dni)}, {nameof(Propietario.mail)}, {nameof(Propietario.clave)} FROM propietario where borrado=0 ORDER by apellido ASC";

            using (var command = new MySqlCommand(sql, connection))
            {
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {

                        propietarios.Add(new Propietario
                        {
                            idpropietario = reader.GetInt32(nameof(Propietario.idpropietario)),
                            nombre = reader.GetString(nameof(Propietario.nombre)),
                            apellido = reader.GetString(nameof(Propietario.apellido)),
                            dni = reader.GetInt32(nameof(Propietario.dni)),
                            mail = reader.GetString(nameof(Propietario.mail)),
                            clave = reader.GetString(nameof(Propietario.clave))
                        });
                    }
                    connection.Close();
                }
            }
        }
        return propietarios;
    }

    public Propietario AltaPropietario(Propietario p) // funciona ok
    {
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = $"INSERT INTO propietario (nombre, apellido, dni, mail, clave) VALUES ('{p.nombre}','{p.apellido}',{p.dni},'{p.mail}','{p.clave}')";


            using (var command = new MySqlCommand(sql, connection))
            {
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
        return p;
    }

    public Propietario? GetPropietario(int idpropietario) //funciona ok
    {

        Propietario? propietario = null;
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = @$"SELECT {nameof(Propietario.idpropietario)}, {nameof(Propietario.nombre)}, {nameof(Propietario.apellido)}, {nameof(Propietario.dni)}, {nameof(Propietario.mail)}, {nameof(Propietario.clave)}
            FROM propietario
            WHERE borrado=false and {nameof(Propietario.idpropietario)} = @{nameof(Propietario.idpropietario)}";

            using (var command = new MySqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue($"@{nameof(Propietario.idpropietario)}", idpropietario);
                connection.Open();
                using var reader = command.ExecuteReader();
                if (reader.Read())
                {
                    propietario = new Propietario
                    {
                        idpropietario = reader.GetInt32(nameof(Propietario.idpropietario)),
                        nombre = reader.GetString(nameof(Propietario.nombre)),
                        apellido = reader.GetString(nameof(Propietario.apellido)),
                        dni = reader.GetInt32(nameof(Propietario.dni)),
                        mail = reader.GetString(nameof(Propietario.mail)),
                        clave = reader.GetString(nameof(Propietario.clave))
                    };
                }

                //connection.Close();



            }



            return propietario;
        }

    }


    public int Modifica(Propietario p) //funciona ok
    {
        int res = -1;
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = @$"UPDATE propietario
            SET {nameof(Propietario.nombre)} =@{nameof(Propietario.nombre)}, {nameof(Propietario.apellido)} =@{nameof(Propietario.apellido)},
             {nameof(Propietario.dni)} =@{nameof(Propietario.dni)}, {nameof(Propietario.mail)} =@{nameof(Propietario.mail)}, 
             {nameof(Propietario.clave)} =@{nameof(Propietario.clave)}
            WHERE {nameof(Propietario.idpropietario)} =@{nameof(Propietario.idpropietario)}";

            using (var command = new MySqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue($"@{nameof(Propietario.idpropietario)}", p.idpropietario);
                command.Parameters.AddWithValue($"@{nameof(Propietario.nombre)}", p.nombre);
                command.Parameters.AddWithValue($"@{nameof(Propietario.apellido)}", p.apellido);
                command.Parameters.AddWithValue($"@{nameof(Propietario.dni)}", p.dni);
                command.Parameters.AddWithValue($"@{nameof(Propietario.mail)}", p.mail);
                command.Parameters.AddWithValue($"@{nameof(Propietario.clave)}", p.clave);

                connection.Open();
                res = command.ExecuteNonQuery();
                connection.Close();
            }
        }
        return res;
    }

    public int Baja(int idpropietario)//funciona ok
    {
        int res = -1;
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = @$"UPDATE propietario
            SET borrado = true
            WHERE {nameof(Propietario.idpropietario)} =@{nameof(Propietario.idpropietario)}";

            using (var command = new MySqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue($"@{nameof(Propietario.idpropietario)}", idpropietario);

                connection.Open();
                res = command.ExecuteNonQuery();
                connection.Close();
            }
        }
        return res;
    }

    ///final
    ///
}
