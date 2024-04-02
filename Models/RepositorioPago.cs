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
            var sql = $"SELECT {nameof(Pago.idpago)}, {nameof(Pago.idcontrato)}, {nameof(Pago.Monto)}, {nameof(Pago.Afecha)} FROM pago where borrado=0 ORDER by Afecha ASC";

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
                            Monto = reader.GetDecimal(nameof(Pago.Monto)),
                            Afecha = reader.GetDateTime(nameof(Pago.Afecha))
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
            var sql = $"INSERT INTO pago (idcontrato, Monto, Afecha) VALUES ({p.idcontrato},{p.Monto},'{p.Afecha}')";
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
            var sql = $"UPDATE pago SET idcontrato = {nameof(p.idcontrato)}, Monto = {nameof(p.Monto)}, Afecha = '{nameof(p.Afecha)}' WHERE {nameof(Pago.idpago)} = {nameof(p.idpago)}";
            using (var command = new MySqlCommand(sql, connection))
            {
                command.Parameters.AddWithValue($"@{nameof(Pago.idpago)}", p.idpago);
                command.Parameters.AddWithValue($"@{nameof(Pago.idcontrato)}", p.idcontrato);
                command.Parameters.AddWithValue($"@{nameof(Pago.Monto)}", p.Monto);
                command.Parameters.AddWithValue($"@{nameof(Pago.Afecha)}", p.Afecha);
                connection.Open();
                res = command.ExecuteNonQuery();
                connection.Close();
            }
        }
        return res;     
    }

    }
