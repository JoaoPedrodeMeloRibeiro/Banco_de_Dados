package br.inatel.DAO;

public ArrayList<User> selectAllUsers() {
    Connection con = newConnection();
    ArrayList<User> users = new ArrayList<User>();

    try {
        Statement st = con.createStatement();
        String sql = "SELECT * FROM usuario";
        ResultSet rs = st.executeQuery(sql);

        while (rs.next()) {
            System.out.println("Nome: " + rs.getString("nome") + "; CPF: " + rs.getString("cpf") + "; ID: " + rs.getInt("id"));
        }
    } catch (SQLException aux) {
        System.out.println("Error: " + aux.getMessage());
    } finally {
        try {
            con.close();
            st.close();
            rs.close();
        } catch (Exception exc) {
            System.out.println("Error: " + exc.getMessage());
        }
    }

    return users;
}
