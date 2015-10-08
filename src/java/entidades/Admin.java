/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package entidades;

/**
 *
 * @author Mohamed Ivaz
 */
public class Admin {
    private int adminID;
    private String nome;
    private String apelido;
    private String email;
    private String password;
    private String rep_password;
    
    

    public Admin(){}
    
    public Admin(String nome, String apelido){
        this.nome=nome;
        this.apelido=apelido;
        
    }

    public int getAdminID() {
        return adminID;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getApelido() {
        return apelido;
    }

    public void setApelido(String apelido) {
        this.apelido = apelido;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRep_password() {
        return rep_password;
    }

    public void setRep_password(String rep_password) {
        this.rep_password = rep_password;
    }
    
    
}


