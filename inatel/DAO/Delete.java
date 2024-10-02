package br.inatel.DAO;

public boolean deleteUser(int id){
    connectToDB();
    boolean success = false;
    try {
        String sql = "DELETE FROM usuario WHERE id = ?";
        pst = con.prepareStatement(sql);
        pst.setInt(1, id);
        pst.execute();
        success = true;
    } catch (SQLException ex) {
        System.out.println("Erro: " + ex.getMessage());
    } finally {
        try {
            con.close();
            pst.close();
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
        }
    }
    return success;
}
