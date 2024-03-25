
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

    public IList<Propietario> GetPropietarios()
    {
        var propietarios = new List<Propietario>();


        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = $"SELECT {nameof(Propietario.idpropietario)}, {nameof(Propietario.nombre)}, {nameof(Propietario.apellido)}, {nameof(Propietario.dni)}, {nameof(Propietario.mail)}, {nameof(Propietario.clave)} FROM propietario where borrado=0";

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

    public Propietario AltaPropietario(Propietario p)
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

    public Propietario GetPropietario(int idpropietario)
    {
        
        Propietario propietario = new Propietario();
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = @$"SELECT {nameof(Propietario.idpropietario)}, {nameof(Propietario.nombre)}, {nameof(Propietario.apellido)}, {nameof(Propietario.dni)}, {nameof(Propietario.mail)}, {nameof(Propietario.clave)}
            FROM propietario
            WHERE borrado=false and {nameof(Propietario.idpropietario)} = @{nameof(Propietario.idpropietario)}" ;            
         
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
                
                connection.Close();
                
                

            }
            


            return propietario;
        }

    }

    ///final
    ///
}
