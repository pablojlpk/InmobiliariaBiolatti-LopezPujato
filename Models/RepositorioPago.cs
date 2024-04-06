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
                var sql = $"SELECT {nameof(Pago.idpago)}, {nameof(Pago.idcontrato)}, {nameof(Pago.importe)}, {nameof(Pago.fpago)} FROM PAGOS WHERE borrado = 0 ORDER BY fpago ASC";

                using var command = new MySqlCommand(sql, connection);
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        pagos.Add(new Pago
                        {
                            idpago = reader.GetInt32(nameof(Pago.idpago)),
                            idcontrato = reader.GetInt32(nameof(Pago.idcontrato)),
                            importe = reader.GetDecimal(nameof(Pago.importe)),
                            fpago = reader.GetDateTime(nameof(Pago.fpago))
                        });
                    }
                }
                connection.Close();
            }
            return pagos;
        }

        public Pago GetPago(int id)
        {
            Pago? pago = null;

            using (var connection = new MySqlConnection(ConnectionString))
            {
                var sql = $"SELECT {nameof(Pago.idpago)}, {nameof(Pago.idcontrato)}, {nameof(Pago.importe)}, {nameof(Pago.fpago)} FROM PAGOS WHERE idpago = @idpago";

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
                                fpago = reader.GetDateTime(nameof(Pago.fpago))
                            };
                        }
                    }
                    connection.Close();
                }
            }
            return pago;
        }

                    public int eliminar(int idpago)
            {
                int res = -1;
                using (var connection = new MySqlConnection(ConnectionString))
                {
                    var sql = $"UPDATE PAGOS SET borrado = 1 WHERE {nameof(Pago.idpago)} = @idpago";
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
                var sql = $"INSERT INTO PAGOS (idcontrato, Monto, Afecha) VALUES (@idcontrato, @importe, @fpago)";
                using (var command = new MySqlCommand(sql, connection))
                {
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

        public int ModificaPago(Pago p)
        {
            int res = -1;
            using (var connection = new MySqlConnection(ConnectionString))
            {
                var sql = $"UPDATE PAGOS SET idcontrato = @idcontrato, Monto = @importe, Afecha = @fpago WHERE {nameof(Pago.idpago)} = @idpago";
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
    }
}


