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





    
    
    
    
    
    
    
    }
