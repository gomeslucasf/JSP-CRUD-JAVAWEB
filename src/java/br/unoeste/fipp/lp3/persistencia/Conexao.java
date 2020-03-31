package br.unoeste.fipp.lp3.persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Conexao {

    private static final String URL = "jdbc:postgresql://localhost:5432/login";
    private static final String USUARIO = "postgres";
    private static final String SENHA = "senha";

    public static Connection abre() {
        try {
            Class.forName("org.postgresql.Driver");
            return DriverManager.getConnection(Conexao.URL, Conexao.USUARIO, Conexao.SENHA);
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(Conexao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
