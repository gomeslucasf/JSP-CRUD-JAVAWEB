package br.unoeste.fipp.lp3.dal;
import br.unoeste.fipp.lp3.entidade.Usuario;
import br.unoeste.fipp.lp3.persistencia.Conexao;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class usuarioDal {

    public ArrayList<Usuario> getAll()
    {
        ArrayList<Usuario> users = new ArrayList();
        Connection con = Conexao.abre();
        try{
            String query = "SELECT id, usu_nome, usu_login,"
                    + "usu_senha FROM usuario";
            PreparedStatement sql = con.prepareStatement(query); 
            ResultSet result = sql.executeQuery();
            while(result.next())
            {
                Usuario user = new Usuario();
                user.setCodigo(result.getInt("id"));
                user.setNome(result.getString("usu_nome"));
                user.setLogin(result.getString("usu_login"));
                user.setSenha(result.getString("usu_senha"));
                
                users.add(user);
            }
            sql.close();
            con.close();
        } catch (Exception e)
        {
            
        }
        
        return users;
    }
    
    public Usuario getById(int id)
    {
        Connection con = Conexao.abre();
        Usuario user = null;
        try{
            String query = "SELECT id, usu_nome, usu_login,"
                    + "usu_senha FROM usuario WHERE id = ?";
            PreparedStatement sql = con.prepareStatement(query); 
            sql.setInt(1, id);
            ResultSet result = sql.executeQuery();
            while(result.next())
            {
                user = new Usuario();
                user.setCodigo(result.getInt("id"));
                user.setNome(result.getString("usu_nome"));
                user.setLogin(result.getString("usu_login"));
                user.setSenha(result.getString("usu_senha"));
            }
            sql.close();
            con.close();
        } catch (Exception e)
        {
            
        }
        
        return user;
    }
    
    public ArrayList<Usuario> getByName(String name)
    {
        ArrayList<Usuario> users = new ArrayList();
        Connection con = Conexao.abre();
        try{
            String query = "SELECT id, usu_nome, usu_login,"
                    + "usu_senha FROM usuario WHERE usu_nome LIKE ?";
            PreparedStatement sql = con.prepareStatement(query); 
            sql.setString(1, "%"+ name +"%");
            ResultSet result = sql.executeQuery();
            while(result.next())
            {
                Usuario user = new Usuario();
                user.setCodigo(result.getInt("id"));
                user.setNome(result.getString("usu_nome"));
                user.setLogin(result.getString("usu_login"));
                user.setSenha(result.getString("usu_senha"));
                
                users.add(user);
            }
            sql.close();
            con.close();
        } catch (Exception e)
        {
            
        }
        
        return users;
    }
    
    public ArrayList<Usuario> getByLogin(String login)
    {
        ArrayList<Usuario> users = new ArrayList();
        Connection con = Conexao.abre();
        try{
            String query = "SELECT id, usu_nome, usu_login,"
                    + "usu_senha FROM usuario WHERE usu_login LIKE ?";
            PreparedStatement sql = con.prepareStatement(query); 
            sql.setString(1, "%"+ login +"%");
            ResultSet result = sql.executeQuery();
            while(result.next())
            {
                Usuario user = new Usuario();
                user.setCodigo(result.getInt("id"));
                user.setNome(result.getString("usu_nome"));
                user.setLogin(result.getString("usu_login"));
                user.setSenha(result.getString("usu_senha"));
                
                users.add(user);
            }
            sql.close();
            con.close();
        } catch (Exception e)
        {
            
        }
        
        return users;
    }
    
    public void insert(Usuario new_user)
    {
        Connection con = Conexao.abre();
        try{
            String query = "INSERT INTO usuario(usu_nome, usu_login, usu_senha) VALUES("
                    + "?, ?, ?"
                    + ")";
            PreparedStatement sql = con.prepareStatement(query);
            sql.setString(1, new_user.getNome());
            sql.setString(2, new_user.getLogin());
            sql.setString(3, new_user.getSenha());
            sql.execute();
            sql.close();
            con.close();
        } catch (Exception e)
        {
            
        }
    }
    
    public void removeById(int id)
    {
        Connection con = Conexao.abre();
        try{
            String query = "DELETE FROM usuario WHERE id = ?";
            PreparedStatement sql = con.prepareStatement(query);
            sql.setInt(1, id);
            sql.execute();
            sql.close();
            con.close();
        }catch (Exception e)
        {
            
        }
    }
    
    public void update(Usuario user)
    {
        Connection con = Conexao.abre();
        try{
            String query = "UPDATE usuario SET usu_nome = ?, usu_login = ?, usu_senha = ?"
                    + "WHERE id = ?";
            PreparedStatement sql = con.prepareStatement(query);
            sql.setString(1, user.getNome());
            sql.setString(2, user.getLogin());
            sql.setString(3, user.getSenha());
            sql.setInt(4, user.getCodigo());
            sql.execute();
            sql.close();
            con.close();
        } catch (Exception e)
        {
            
        }
    }
    
    public void removeAll()
    {
        Connection con = Conexao.abre();
        try{
            String query = "TRUNCATE TABLE usuario";
            PreparedStatement sql = con.prepareStatement(query);
            sql.execute();
            sql.close();
            con.close();
        }catch (Exception e)
        {
            
        }
    }
}
