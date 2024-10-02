package br.inatel.DAO;

public boolean insertUser(User user){
    connect();
    boolean success = false;
    try {
        String sql = "INSERT INTO users(name, cpf) VALUES (?, ?)";
        PreparedStatement pst = con.prepareStatement(sql);
        pst.setString(1, user.getName());
        pst.setString(2, user.getCpf());
        pst.execute();
        success = true;
    } catch (SQLException ex) {
        System.out.println("Error: " + ex.getMessage());
        success = false;
    } finally {
        try {
            if(con != null){
                con.close();
            }
        } catch (SQLException xc) {
            System.out.println("Error: " + xc.getMessage());
        }
    }
    return success;
}

