using MySql.Data.MySqlClient;

namespace InmobiliariaBiolatti_LopezPujato.Models;
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
            var sql = $"SELECT {nameof(Pago.idpago)}, {nameof(Pago.idcontrato)}, {nameof(Pago.importe)}, {nameof(Pago.fpago)} FROM pagos where borrado=0 ORDER by fpago ASC";

            using (var command = new MySqlCommand(sql, connection))
            {
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
                    connection.Close();
                }
            }
        }
        return pagos;
    }
    public int Baja(int idpago)
    {
        int res = -1;
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = @$"DELETE FROM pagos WHERE {nameof(Pago.idpago)} = @id";
            using (var command = new MySqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue($"@{nameof(Pago.idpago)}", idpago);

                connection.Open();
                res = command.ExecuteNonQuery();
                connection.Close();
            }
        }
        return res;

    }
    public int altaPago (Pago p)
    {
        int res = -1;
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = $"INSERT INTO pago (idcontrato, Monto, Afecha) VALUES ({p.idcontrato},{p.importe},'{p.fpago}')";
            using (var command = new MySqlCommand(sql, connection))
            {
                connection.Open();
                res = command.ExecuteNonQuery();
                connection.Close();
            }
        }
        return res;
    }


    public int ModificaPago (Pago p)
    {
        int res = -1;
        using (var connection = new MySqlConnection(ConnectionString))
        {
            var sql = $"UPDATE pago SET idcontrato = {nameof(p.idcontrato)}, Monto = {nameof(p.importe)}, Afecha = '{nameof(p.fpago)}' WHERE {nameof(Pago.idpago)} = {nameof(p.idpago)}";
            using (var command = new MySqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue($"@{nameof(Pago.idpago)}", p.idpago);
                command.Parameters.AddWithValue($"@{nameof(Pago.idcontrato)}", p.idcontrato);
                command.Parameters.AddWithValue($"@{nameof(Pago.importe)}", p.importe);
                command.Parameters.AddWithValue($"@{nameof(Pago.fpago)}", p.fpago);
                connection.Open();
                res = command.ExecuteNonQuery();
                connection.Close();
            }
        }
        return res;     
    }

    }
