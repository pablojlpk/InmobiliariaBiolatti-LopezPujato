using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlTypes;
using MySql.Data.MySqlClient;
using Mysqlx.Connection;


namespace InmobiliariaBiolatti_LopezPujato.Models;
public class RepositorioContrato
{
    readonly string ConnectionString = "Server=localhost;Database=inmodotnet;User=root;Password=;";
    public RepositorioContrato()
    {

    }

    public Contrato AltaContrato(Contrato c)
    {

        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = $"INSERT INTO contratos (idinmueble, idinquilino, fdesde, fhasta, importe) VALUES ({c.idinmueble},{c.idinquilino},'{c.fdesde}','{c.fhasta}', {c.importe})";

            using (var command = new MySqlCommand(sql, connection))
            {
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
        return c;
    }


    public Contrato GetContrato(int idcontrato)
    {

        Contrato c = new Contrato();

        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = @$"SELECT c.idcontrato, c.idinmueble, c.idinquilino, c.fdesde, c.fhasta, c.importe,
              i.idinquilino, i.nombre, i.apellido, i.dni,
              m.direccion, m.superficie, m.ambientes
        FROM contratos c
        INNER JOIN inquilino i on c.idinquilino=i.idinquilino
        inner join inmuebles m on c.idinmueble=m.idinmueble
        WHERE i.borrado=false and c.idcontrato = @idcontrato";
            using (var command = new MySqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue($"@idcontrato", idcontrato);
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        c = new Contrato
                        {
                            idcontrato = reader.GetInt32(nameof(Contrato.idcontrato)),
                            idinmueble = reader.GetInt32(nameof(Contrato.idinmueble)),
                            idinquilino = reader.GetInt32(nameof(Contrato.idinquilino)),
                            fdesde = reader.GetDateTime(nameof(Contrato.fdesde)),
                            fhasta = reader.GetDateTime(nameof(Contrato.fhasta)),
                            importe = reader.GetDecimal(nameof(Contrato.importe)),
                            datosinquilino = new Inquilino
                            {
                               idinquilino = reader.GetInt32(nameof(Inquilino.idinquilino)),
                               nombre = reader.GetString(nameof(Inquilino.nombre)),
                               apellido = reader.GetString(nameof(Inquilino.apellido)),
                               dni = reader.GetInt32(nameof(Inquilino.dni))
                            },
                            datosinmueble = new Inmueble
                            {
                                idinmueble = reader.GetInt32(nameof(Inmueble.idinmueble)),
                                direccion = reader.GetString(nameof(Inmueble.direccion)),
                                superficie = reader.GetInt32(nameof(Inmueble.superficie)),
                                ambientes = reader.GetInt32(nameof(Inmueble.ambientes))
                            }
                        };
                    }
                    connection.Close();
                }

            }
        }
        return c;
    }


    public List<Contrato> GetContratos()
    {
        List<Contrato> contratos = new List<Contrato>();
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql2 = $@"SELECT {nameof(Contrato.idcontrato)}, {nameof(Contrato.idinmueble)}, {nameof(Contrato.idinquilino)},
             {nameof(Contrato.fdesde)}, {nameof(Contrato.fhasta)}, {nameof(Contrato.importe)},
            i.nombre ,i.apellido, i.dni,
            m.direccion, m.superficie, m.ambientes
            FROM contratos c
            JOIN inquilino i ON c.idinquilino = i.idinquilino
            JOIN inmuebles m ON c.idinmueble = m.idinmueble
            WHERE c.borrado = 0";

            var sql = $@"SELECT c.idcontrato, c.idinmueble, c.idinquilino,
             c.importe,
            i.nombre ,i.apellido, i.dni,
            m.direccion, m.superficie, m.ambientes
            FROM contratos c
            JOIN inquilino i ON c.idinquilino = i.idinquilino
            JOIN inmuebles m ON c.idinmueble = m.idinmueble
            WHERE c.borrado = 0";

            using (var command = new MySqlCommand(sql, connection))
            {
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        Contrato c = new Contrato
                        {
                            idcontrato = reader.GetInt32(nameof(Contrato.idcontrato)),
                            idinmueble = reader.GetInt32(nameof(Contrato.idinmueble)),
                            idinquilino = reader.GetInt32(nameof(Contrato.idinquilino)),
                            //fdesde = reader.GetDateTime(nameof(Contrato.fdesde)),
                            //fhasta = reader.GetDateTime(nameof(Contrato.fhasta)),
                            importe = reader.GetDecimal(nameof(Contrato.importe)),
                            datosinmueble = new Inmueble
                            {
                                idinmueble = reader.GetInt32(nameof(Inmueble.idinmueble)),
                                direccion = reader.GetString(nameof(Inmueble.direccion)),
                                superficie = reader.GetInt32(nameof(Inmueble.superficie)),
                                ambientes = reader.GetInt32(nameof(Inmueble.ambientes)),
                            },
                            datosinquilino = new Inquilino
                            {
                                idinquilino = reader.GetInt32(nameof(Inquilino.idinquilino)),
                                nombre = reader.GetString(nameof(Inquilino.nombre)),
                                apellido = reader.GetString(nameof(Inquilino.apellido)),
                                dni = reader.GetInt32(nameof(Inquilino.dni)),
                            }
                        };
                        contratos.Add(c);
                    }
                }
                connection.Close();
            }
        }
        return contratos;
    }

    public Contrato ModificaContrato(Contrato c)
    {
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = @$"UPDATE contratos SET {nameof(Contrato.idinmueble)} =@{nameof(Contrato.idinmueble)},
             {nameof(Contrato.idinquilino)} =@{nameof(Contrato.idinquilino)},
             {nameof(Contrato.importe)} =@{nameof(Contrato.importe)}
              WHERE {nameof(Contrato.idcontrato)} =@{nameof(Contrato.idcontrato)}";
            using (var command = new MySqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue($"@{nameof(Contrato.idcontrato)}", c.idcontrato);
                command.Parameters.AddWithValue($"@{nameof(Contrato.idinmueble)}", "1");
                command.Parameters.AddWithValue($"@{nameof(Contrato.idinquilino)}", c.idinquilino);
                command.Parameters.AddWithValue($"@{nameof(Contrato.importe)}", c.importe);
                connection.Open();
                command.ExecuteNonQuery();
                connection.Close();
            }
        }
        return c;
    }

    //final

}