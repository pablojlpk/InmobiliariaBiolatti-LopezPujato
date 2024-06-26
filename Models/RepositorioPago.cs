using MySql.Data.MySqlClient;
using System.Collections.Generic;

namespace InmobiliariaBiolatti_LopezPujato.Models
{
    public class RepositorioPago
    {
        readonly string ConnectionString = "Server=localhost;Database=inmodotnet;User=root;Password=;";

        public RepositorioPago()
        {

        }

        public IList<Pago> GetPagos()
        {
            var pagos = new List<Pago>();
            using (var connection = new MySqlConnection(ConnectionString))
            {
                var sql = $@"SELECT {nameof(Pago.idpago)}, {nameof(Pago.idcontrato)},
                 {nameof(Pago.importe)}, {nameof(Pago.fpago)},
                  {nameof(Pago.anulado)}, {nameof(Pago.detalle)}
                   FROM PAGOS WHERE borrado = 0 ORDER BY idpago desc";
                using var command = new MySqlCommand(sql, connection);
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var pago = new Pago
                        {
                            idpago = reader.GetInt32(nameof(Pago.idpago)),
                            idcontrato = reader.GetInt32(nameof(Pago.idcontrato)),
                            importe = reader.GetDecimal(nameof(Pago.importe)),
                            fpago = reader.GetDateTime(nameof(Pago.fpago)),
                            anulado = reader.GetBoolean(nameof(Pago.anulado)),
                            detalle = reader.GetString(nameof(Pago.detalle))
                        };
                        pago.datosContrato = ObtenerDetallesContrato(pago.idcontrato);
                        pagos.Add(pago);
                    }
                }
                connection.Close();
            }
            return pagos;
        }


        private Contrato ObtenerDetallesContrato(int idContrato)
        {    // Lógica para obtener los detalles del contrato según su ID
            RepositorioContrato repositorioContrato = new RepositorioContrato();
            return repositorioContrato.GetContrato(idContrato);
        }
        public Pago GetPago(int id)
        {
            Pago? pago = null;
            using (var connection = new MySqlConnection(ConnectionString))
            {
                var sql = $"SELECT {nameof(Pago.idpago)}, {nameof(Pago.idcontrato)}, {nameof(Pago.importe)}, {nameof(Pago.fpago)}, {nameof(Pago.anulado)}, {nameof(Pago.detalle)} FROM PAGOS WHERE idpago = @idpago";
                using (var command = new MySqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@idpago", id);
                    connection.Open();
                    using (var reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            pago = new Pago
                            {
                                idpago = reader.GetInt32(nameof(Pago.idpago)),
                                idcontrato = reader.GetInt32(nameof(Pago.idcontrato)),
                                importe = reader.GetDecimal(nameof(Pago.importe)),
                                fpago = reader.GetDateTime(nameof(Pago.fpago)),
                                anulado= reader.GetBoolean(nameof(Pago.anulado)),
                                detalle = reader.GetString(nameof(Pago.detalle)),
                            };
                        }
                    }
                    connection.Close();
                }
            }
            return pago;
        }

        public int Anular(int idpago)
        {
            int res = -1;
            using (var connection = new MySqlConnection(ConnectionString))
            {
                var sql = $"UPDATE PAGOS SET anulado = 1 WHERE {nameof(Pago.idpago)} = @idpago";
                using (var command = new MySqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@idpago", idpago);

                    connection.Open();
                    res = command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            return res;
        }


        public int altaPago(Pago p)
        {
            int res = -1;
            using (var connection = new MySqlConnection(ConnectionString))
            {
                var sql = $"INSERT INTO PAGOS (idcontrato,fpago, importe, detalle) VALUES (@idcontrato, @fpago, @importe,@detalle)";
                using (var command = new MySqlCommand(sql, connection))
                {
                    //command.CommandType = CommandType.Text;
                    command.Parameters.AddWithValue("@idcontrato", p.idcontrato);
                    command.Parameters.AddWithValue("@importe", p.importe);
                    command.Parameters.AddWithValue("@fpago", p.fpago);
                    command.Parameters.AddWithValue("@detalle", p.detalle);
                    connection.Open();
                    res = command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            return res;
        }

        public int altaMulta(Pago p)
        {
            p.detalle=p.detalle+"Multa";

            int res = -1;
            using (var connection = new MySqlConnection(ConnectionString))
            {
                var sql = $"INSERT INTO PAGOS (idcontrato,fpago, importe, detalle) VALUES (@idcontrato, @fpago, @importe, @detalle);";
                using (var command = new MySqlCommand(sql, connection))
                {
                    //command.CommandType = CommandType.Text;
                    command.Parameters.AddWithValue("@idcontrato", p.idcontrato);
                    command.Parameters.AddWithValue("@importe", p.importe);
                    command.Parameters.AddWithValue("@fpago", p.fpago);
                    command.Parameters.AddWithValue("@detalle", p.detalle);
                    connection.Open();
                    res = command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            return res;
        }


        public int ModificaPago(Pago p)
        {
            int res = -1;
            using (var connection = new MySqlConnection(ConnectionString))
            {
                var sql = $"UPDATE PAGOS SET idcontrato = @idcontrato, importe = @importe, fpago = @fpago WHERE {nameof(Pago.idpago)} = @idpago";
                using (var command = new MySqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@idpago", p.idpago);
                    command.Parameters.AddWithValue("@idcontrato", p.idcontrato);
                    command.Parameters.AddWithValue("@importe", p.importe);
                    command.Parameters.AddWithValue("@fpago", p.fpago);

                    connection.Open();
                    res = command.ExecuteNonQuery();
                    connection.Close();
                }
            }
            return res;
        }

   public IList<Pago> ListarPagosPorContrato(int idcon)
        {
            var pagos = new List<Pago>();
            using (var connection = new MySqlConnection(ConnectionString))
            {
                var sql = $@"SELECT {nameof(Pago.idpago)}, {nameof(Pago.idcontrato)},
                 {nameof(Pago.importe)}, {nameof(Pago.fpago)},
                  {nameof(Pago.anulado)}, {nameof(Pago.detalle)}
                   FROM PAGOS WHERE borrado = 0 and idcontrato = {idcon} ORDER BY idpago desc";
                using var command = new MySqlCommand(sql, connection);
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        var pago = new Pago
                        {
                            idpago = reader.GetInt32(nameof(Pago.idpago)),
                            idcontrato = reader.GetInt32(nameof(Pago.idcontrato)),
                            importe = reader.GetDecimal(nameof(Pago.importe)),
                            fpago = reader.GetDateTime(nameof(Pago.fpago)),
                            anulado = reader.GetBoolean(nameof(Pago.anulado)),
                            detalle = reader.GetString(nameof(Pago.detalle))
                        };
                        pago.datosContrato = ObtenerDetallesContrato(pago.idcontrato);
                        pagos.Add(pago);
                    }
                }
                connection.Close();
            }
            return pagos;
        }



        //final
    }
}


