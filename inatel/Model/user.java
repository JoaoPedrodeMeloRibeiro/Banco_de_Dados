package br.inatel.Model;

public class User {
    String nome; // 1 usage
    String cpf; // 1 usage
    int id; // 1 usage

    public User(String nome, String cpf, int id) { // no usages
        this.nome = nome;
        this.cpf = cpf;
        this.id = id;
    }
}