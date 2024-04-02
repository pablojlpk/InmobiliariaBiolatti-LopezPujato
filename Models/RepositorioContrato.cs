
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
 

    //final
}
