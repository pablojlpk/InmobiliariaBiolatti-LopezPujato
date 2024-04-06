
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
            var sql = $"INSERT INTO inquilino (nombre, apellido, dni, mail, clave) VALUES ('{p.nombre}','{p.apellido}',{p.dni},'{p.mail}','{p.clave}')";


            using (var command = new MySqlCommand(sql, connection))
            {
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
        return p;
    }

    public int Baja(int idinquilino)//funciona ok
    {
        int res = -1;
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = @$"UPDATE inquilino
            SET borrado = true
            WHERE {nameof(Inquilino.idinquilino)} =@{nameof(Inquilino.idinquilino)}";

            using (var command = new MySqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue($"@{nameof(Inquilino.idinquilino)}", idinquilino);

                connection.Open();
                res = command.ExecuteNonQuery();
                connection.Close();
            }
        }
        return res;
    }

public Inquilino? GetInquilino(int idinquilino) //funciona ok
    {
        Inquilino? inquilino = null;
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = @$"SELECT {nameof(Inquilino.idinquilino)}, {nameof(Inquilino.nombre)}, {nameof(Inquilino.apellido)}, {nameof(Inquilino.dni)}, {nameof(Inquilino.mail)}, {nameof(Inquilino.clave)}
            FROM inquilino
            WHERE borrado=false and {nameof(Inquilino.idinquilino)} = @{nameof(Inquilino.idinquilino)}";

            using (var command = new MySqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue($"@{nameof(Inquilino.idinquilino)}",idinquilino );
                connection.Open();
                using var reader = command.ExecuteReader();
                if (reader.Read())
                {
                    inquilino = new Inquilino
                    {
                        idinquilino = reader.GetInt32(nameof(Inquilino.idinquilino)),
                        nombre = reader.GetString(nameof(Inquilino.nombre)),
                        apellido = reader.GetString(nameof(Inquilino.apellido)),
                        dni = reader.GetInt32(nameof(Inquilino.dni)),
                        mail = reader.GetString(nameof(Inquilino.mail)),
                        clave = reader.GetString(nameof(Inquilino.clave))

                    
                        
                    };
                }

                connection.Close();



            }



            return inquilino;
        }

    }


public int Modifica(Inquilino p) //funciona ok
    {
        int res = -1;
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = @$"UPDATE inquilino
            SET {nameof(Inquilino.nombre)} =@{nameof(Inquilino.nombre)}, {nameof(Inquilino.apellido)} =@{nameof(Inquilino.apellido)},
             {nameof(Inquilino.dni)} =@{nameof(Inquilino.dni)}, {nameof(Inquilino.mail)} =@{nameof(Inquilino.mail)}, 
             {nameof(Inquilino.clave)} =@{nameof(Inquilino.clave)}
            WHERE {nameof(Inquilino.idinquilino)} =@{nameof(Inquilino.idinquilino)}";

            using (var command = new MySqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue($"@{nameof(Inquilino.idinquilino)}", p.idinquilino);
                command.Parameters.AddWithValue($"@{nameof(Inquilino.nombre)}", p.nombre);
                command.Parameters.AddWithValue($"@{nameof(Inquilino.apellido)}", p.apellido);
                command.Parameters.AddWithValue($"@{nameof(Inquilino.dni)}", p.dni);
                command.Parameters.AddWithValue($"@{nameof(Inquilino.mail)}", p.mail);
                command.Parameters.AddWithValue($"@{nameof(Inquilino.clave)}", p.clave);
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
