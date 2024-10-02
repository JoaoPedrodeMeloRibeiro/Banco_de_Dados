package br.inatel.DAO;

public boolean updateUser(int id, User user){
    connectToDb();
    boolean sucesso;
    String sql = "UPDATE usuario SET nome = ?, cpf = ? WHERE id = ?";
    try {
        pst = con.prepareStatement(sql);
        pst.setString(1, user.getNome());
        pst.setString(2, user.getCpf());
        pst.setInt(3, id);
        pst.execute();
        sucesso = true;
    } catch (SQLException exc) {
        System.out.println("Erro: " + exc.getMessage());
        sucesso = false;
    } finally {
        try {
            con.close();
            pst.close();
        } catch (SQLException exc) {
            System.out.println("Erro: " + exc.getMessage());
        }
    }
    return sucesso;
}
