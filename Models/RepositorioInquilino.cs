
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;
using Mysqlx.Connection;
using Org.BouncyCastle.Asn1.X509.SigI;

namespace InmobiliariaBiolatti_LopezPujato.Models;
public class RepositorioInquilino
{
    readonly string ConnectionString = "Server=localhost;Database=inmodotnet;User=root;Password=;";
    public RepositorioInquilino()
    {

    }

    
    public IList<Inquilino> GetInquilinos()
    {
        var inquilinos = new List<Inquilino>();


        using (var connection = new MySqlConnection(ConnectionString))
        {
            //var sql = $"SELECT {nameof(Inquilino.idinquilino)}, {nameof(Propietario.nombre)}, {nameof(Propietario.apellido)}, {nameof(Propietario.dni)}, {nameof(Propietario.mail)}, {nameof(Propietario.clave)} FROM propietario where borrado=0 ORDER by apellido ASC";
            var sql = $"SELECT {nameof(Inquilino.idinquilino)}, {nameof(Inquilino.nombre)}, {nameof(Inquilino.apellido)}, {nameof(Inquilino.dni)}, {nameof(Inquilino.mail)}, {nameof(Inquilino.clave)} FROM inquilino where borrado=0 ORDER by apellido ASC";

            using (var command = new MySqlCommand(sql, connection))
            {
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {

                        inquilinos.Add(new Inquilino
                        {
                            idinquilino = reader.GetInt32(nameof(Inquilino.idinquilino)),
                            nombre = reader.GetString(nameof(Inquilino.nombre)),
                            apellido = reader.GetString(nameof(Inquilino.apellido)),
                            dni = reader.GetInt32(nameof(Inquilino.dni)),
                            mail = reader.GetString(nameof(Inquilino.mail)),
                            clave = reader.GetString(nameof(Inquilino.clave))
                        });
                    }
                    connection.Close();
                }
            }
        }
        return inquilinos;
    }


    public Inquilino AltaInquilino(Inquilino p) 
    {
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = $"INSERT INTO inqulino (nombre, apellido, dni, mail, clave) VALUES ('{p.nombre}','{p.apellido}',{p.dni},'{p.mail}','{p.clave}')";


            using (var command = new MySqlCommand(sql, connection))
            {
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
        return p;
    }

  


    ///final
    ///
}
