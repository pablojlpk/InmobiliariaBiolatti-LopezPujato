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


    public Contrato GetContrato(int id)
    {

        Contrato c = new Contrato();

        using (var connection = new MySqlConnection(ConnectionString))
        {

            //var sql = $"SELECT * FROM contratos WHERE idcontrato = {id}";
            var sql = $@"SELECT {nameof(Contrato.idcontrato)}, {nameof(Contrato.idinmueble)}, {nameof(Contrato.idinquilino)}, {nameof(Contrato.fdesde)}, {nameof(Contrato.fhasta)}, {nameof(Contrato.importe)},
            i.nombre ,i.apellido, i.dni,
            m.direccion, m.superficie, m.ambientes
            FROM contratos c
            JOIN inquilino i ON c.idinquilino = i.idinquilino
            JOIN inmuebles m ON c.idinmueble = m.idinmueble
            WHERE c.borrado = 0 and c.idcontrato = {id}";

            using (var command = new MySqlCommand(sql, connection))
            {
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {

                        c.idcontrato = reader.GetInt32(nameof(Contrato.idcontrato));
                        c.idinmueble = reader.GetInt32(nameof(Contrato.idinmueble));
                        c.idinquilino = reader.GetInt32(nameof(Contrato.idinquilino));
                        c.fdesde = reader.GetDateTime(nameof(Contrato.fdesde));
                        c.fhasta = reader.GetDateTime(nameof(Contrato.fhasta));
                        c.importe = reader.GetDecimal(nameof(Contrato.importe));
                        c.datosinmueble = new Inmueble
                        {
                            idinmueble = reader.GetInt32(nameof(Inmueble.idinmueble)),
                            direccion = reader.GetString(nameof(Inmueble.direccion)),
                            superficie = reader.GetInt32(nameof(Inmueble.superficie)),
                            ambientes = reader.GetInt32(nameof(Inmueble.ambientes)),

                        };

                        c.datosinquilino = new Inquilino
                        {
                            idinquilino = reader.GetInt32(nameof(Inquilino.idinquilino)),
                            nombre = reader.GetString(nameof(Inquilino.nombre)),
                            apellido = reader.GetString(nameof(Inquilino.apellido)),
                            dni = reader.GetInt32(nameof(Inquilino.dni)),

                        };
                    }
                }

                connection.Close();

            }

            return c;

        }

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


    //final

}