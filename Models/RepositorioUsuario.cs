
using MySql.Data.MySqlClient;
namespace InmobiliariaBiolatti_LopezPujato.Models;
public class RepositorioUsuario
{
    readonly string ConnectionString = "Server=localhost;Database=inmodotnet;User=root;Password=;";
    public RepositorioUsuario()
    {

    }
    public IList<Usuario> GetUsuarios()// funciona ok
    {
        var usuarios = new List<Usuario>();

        using (var connection = new MySqlConnection(ConnectionString))
        { 
            var sql=@"SELECT idusuario,nombre,apellido,email,clave,avatarurl,permiso FROM usuarios where borrado=0 ORDER by apellido ASC";

            using (var command = new MySqlCommand(sql, connection))
            {
                connection.Open();
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {

                        usuarios.Add(new Usuario
                        {
                            IdUsuario = reader.GetInt32(nameof(Usuario.IdUsuario)),
                            Nombre = reader.GetString(nameof(Usuario.Nombre)),
                            Apellido = reader.GetString(nameof(Usuario.Apellido)),
                            Email = reader.GetString(nameof(Usuario.Email)),
                            Clave = reader.GetString(nameof(Usuario.Clave)),
                            AvatarUrl = reader.GetString(nameof(Usuario.AvatarUrl)),
                            Permiso = reader.GetInt32(nameof(Usuario.Permiso))
                        });
                    }
                    connection.Close();
                }
            }
        }
        return usuarios;
    }

public Usuario GetUsuario(int id)
{
    var sql = $"SELECT idusuario,nombre,apellido,email,clave,avatarurl,permiso FROM usuarios where idusuario={id} and borrado=0";
    using (var connection = new MySqlConnection(ConnectionString))
    {
        using (var command = new MySqlCommand(sql, connection))
        {
            connection.Open();
            using (var reader = command.ExecuteReader())
            {
                if (reader.Read())
                {
                    return new Usuario
                    {
                        IdUsuario = reader.GetInt32(nameof(Usuario.IdUsuario)),
                        Nombre = reader.GetString(nameof(Usuario.Nombre)),
                        Apellido = reader.GetString(nameof(Usuario.Apellido)),
                        Email = reader.GetString(nameof(Usuario.Email)),
                        Clave = reader.GetString(nameof(Usuario.Clave)),
                        AvatarUrl = reader.GetString(nameof(Usuario.AvatarUrl)),
                        Permiso = reader.GetInt32(nameof(Usuario.Permiso))
                    };
                }
            }
            connection.Close();
    }
}


//final
}
