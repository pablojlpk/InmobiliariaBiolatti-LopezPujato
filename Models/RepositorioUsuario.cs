
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
                            AvatarUrl = reader["AvatarUrl"] != DBNull.Value ? reader.GetString("AvatarUrl") : "",
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
        Usuario usu = new Usuario();
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
                            AvatarUrl = reader["AvatarURL"] != DBNull.Value ? reader.GetString("AvatarURL") : "",
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
  public int AltaUsuario(Usuario usuario)
{
    var res = -1;
    using (var conn = new MySqlConnection(ConnectionString))
    {
        var sql =@$"INSERT INTO usuarios({nameof(Usuario.Nombre)},{nameof(Usuario.Apellido)},{nameof(Usuario.Email)},{nameof(Usuario.Clave)},{nameof(Usuario.Permiso)},{nameof(Usuario.AvatarUrl)},{nameof(Usuario.Borrado)}
            ) VALUES (@Nombre, @Apellido, @Email, @Clave,@Permiso,@AvatarUrl,0);SELECT LAST_INSERT_ID()";
        using (MySqlCommand cmd = new MySqlCommand(sql, conn))
        {
            cmd.Parameters.AddWithValue("@Nombre", usuario.Nombre);
            cmd.Parameters.AddWithValue("@Apellido", usuario.Apellido);
            cmd.Parameters.AddWithValue("@Email", usuario.Email);
            cmd.Parameters.AddWithValue("@Clave", usuario.Clave);
            cmd.Parameters.AddWithValue("@Permiso", usuario.Permiso);
            cmd.Parameters.AddWithValue("@AvatarUrl", string.IsNullOrEmpty(usuario.AvatarUrl) ? (object)DBNull.Value : usuario.AvatarUrl);
            conn.Open();
            res = Convert.ToInt32(cmd.ExecuteScalar());
            usuario.IdUsuario = res;
            conn.Close();
        }
    }
    return res;
}



    public int Modificacion(Usuario usuario)
    {
        int res;
        using (MySqlConnection conn = new MySqlConnection(ConnectionString))
        {
            var sql = @$"UPDATE {nameof(Usuario)} SET {nameof(Usuario.Nombre)} = @Nombre, {nameof(Usuario.Apellido)} = @Apellido, {nameof(Usuario.Email)} = @Email, {nameof(Usuario.Clave)} = @Clave,{nameof(Usuario.Permiso)} = @Permiso,{nameof(Usuario.AvatarUrl)} = @AvatarURLWHERE {nameof(Usuario.IdUsuario)} = @IdUsuario";
            using (MySqlCommand cmd = new MySqlCommand(sql, conn))
            {
                cmd.Parameters.AddWithValue("@IdUsuario", usuario.IdUsuario);
                cmd.Parameters.AddWithValue("@Nombre", usuario.Nombre);
                cmd.Parameters.AddWithValue("@Apellido", usuario.Apellido);
                cmd.Parameters.AddWithValue("@Email", usuario.Email);
                cmd.Parameters.AddWithValue("@Clave", usuario.Clave);
                cmd.Parameters.AddWithValue("@Permiso", usuario.Permiso);
                cmd.Parameters.AddWithValue("@AvatarURL", string.IsNullOrEmpty(usuario.AvatarUrl) ? (object)DBNull.Value : usuario.AvatarUrl);
                conn.Open();
                res = cmd.ExecuteNonQuery();
                Console.WriteLine(usuario.IdUsuario);
                conn.Close();
            }
            return res;
        }
    }

   public Usuario? ObtenerUsuarioPorEmail(string Email)
{
    using var conn = new MySqlConnection(ConnectionString);
    var sql = @$"SELECT {nameof(Usuario.IdUsuario)},{nameof(Usuario.Nombre)},{nameof(Usuario.Apellido)},
    {nameof(Usuario.Email)},{nameof(Usuario.Clave)},{nameof(Usuario.Permiso)},{nameof(Usuario.AvatarUrl)}
     FROM usuarios WHERE {nameof(Usuario.Email)} = @Email";
    Usuario? usuario = null;
    using (MySqlCommand cmd = new MySqlCommand(sql, conn))
    {
        cmd.Parameters.AddWithValue("@Email", Email);
        conn.Open();
        using (MySqlDataReader reader = cmd.ExecuteReader())
        {
            if (reader.Read())
            {
                usuario = new Usuario
                {
                    IdUsuario = reader.GetInt32(nameof(Usuario.IdUsuario)),
                    Nombre = reader.GetString(nameof(Usuario.Nombre)),
                    Apellido = reader.GetString(nameof(Usuario.Apellido)),
                    Email = reader.GetString(nameof(Usuario.Email)),
                    Clave = reader.GetString(nameof(Usuario.Clave)),
                    Permiso = reader.GetInt32(nameof(Usuario.Permiso)),
                    AvatarUrl = reader[nameof(Usuario.AvatarUrl)] != DBNull.Value ? reader.GetString(nameof(Usuario.AvatarUrl)) : ""
                };
            }
        }
        conn.Close();
    }
    return usuario;
}


public Usuario? ObtenerUsuarioLogin(string Email, string Clave)
{
    using var conn = new MySqlConnection(ConnectionString);
    var sql = @$"SELECT {nameof(Usuario.IdUsuario)},{nameof(Usuario.Nombre)},{nameof(Usuario.Apellido)},
    {nameof(Usuario.Email)},{nameof(Usuario.Clave)},{nameof(Usuario.Permiso)},{nameof(Usuario.AvatarUrl)}
     FROM usuarios WHERE {nameof(Usuario.Email)} = @Email and {nameof(Usuario.Clave)} = @Clave;";
    Usuario? usuario = null;
    using (MySqlCommand cmd = new MySqlCommand(sql, conn))
    {
        cmd.Parameters.AddWithValue("@Email", Email);
        cmd.Parameters.AddWithValue("@Clave", Clave);
        conn.Open();
        using (MySqlDataReader reader = cmd.ExecuteReader())
        {
            if (reader.Read())
            {
                usuario = new Usuario
                {
                    IdUsuario = reader.GetInt32(nameof(Usuario.IdUsuario)),
                    Nombre = reader.GetString(nameof(Usuario.Nombre)),
                    Apellido = reader.GetString(nameof(Usuario.Apellido)),
                    Email = reader.GetString(nameof(Usuario.Email)),
                    Clave = reader.GetString(nameof(Usuario.Clave)),
                    Permiso = reader.GetInt32(nameof(Usuario.Permiso)),
                    AvatarUrl = reader[nameof(Usuario.AvatarUrl)] != DBNull.Value ? reader.GetString(nameof(Usuario.AvatarUrl)) : ""
                };
            }
        }
        conn.Close();
    }
    return usuario;
}



}