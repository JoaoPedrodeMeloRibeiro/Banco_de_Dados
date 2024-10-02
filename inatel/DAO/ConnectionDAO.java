package br.inatel.DAO;

import java.sql.*;

public abstract class ConnectionDao {
    Connection con; // conexão
    PreparedStatement pst; // declaração (query) preparada - código em SQL
    Statement st; // declaração (query) - código em SQL
    ResultSet rs; // resposta do banco

    String database = "RPG"; // nome do BD
    String user = "root";
    String password = "bolagatobolagatobolagatoanel";
    String url = "jdbc:mysql://localhost:3300/" + database + "?useTimezone=true&serverTimezone=UTC&useSSL=false&allowPublicKeyRetrieval=true";

    public void connectToDB() {
        try {
            con = DriverManager.getConnection(url, user, password);
            System.out.println("Conectado com sucesso!");
        } catch (SQLException exc) {
            System.out.println("Erro: " + exc.getMessage());
        }
    }
}
