
using System.Data;
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
            var sql = @"SELECT idusuario,nombre,apellido,email,clave,avatarurl,permiso FROM usuarios where borrado=0 ORDER by apellido ASC";

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
        Usuario usu= new Usuario();
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
                        usu = new Usuario
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
        return usu;
    }
    //final
public Usuario AltaUsuario(Usuario usu) 
{

    using (var connection = new MySqlConnection(ConnectionString))
    {
        var sql = @$"INSERT INTO usuarios (nombre,apellido,email,clave,avatarurl,permiso) VALUES (@nombre, @apellido, @email, @clave, @avatarurl, @permiso)";
        using (var command = new MySqlCommand(sql, connection))
        {
            command.CommandType = CommandType.Text;
            command.Parameters.AddWithValue("@nombre", usu.Nombre);
            command.Parameters.AddWithValue("@apellido", usu.Apellido);
            command.Parameters.AddWithValue("@email", usu.Email);
            command.Parameters.AddWithValue("@clave", usu.Clave);
            command.Parameters.AddWithValue("@avatarurl", usu.AvatarUrl);
            command.Parameters.AddWithValue("@permiso", usu.Permiso);
            connection.Open();
            command.ExecuteNonQuery();
            connection.Close();
        }

    }
    return usu;
}

}