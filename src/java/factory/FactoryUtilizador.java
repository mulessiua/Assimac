/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package factory;

import dao.Conexao;
import entidades.Utilizador;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Mohamed Ivaz
 */
public class FactoryUtilizador extends Factory{
    
    
    @Override
    public  Object newElement() {
        return new Utilizador();
    }

    @Override
    public  Object read(Object primaryKey){
       Utilizador p;
       // Criar um livro
       p = (Utilizador) this.newElement();
       String query = "SELECT * FROM utilizador WHERE utilizadorId = ?";
      try {
        Connection conn = Conexao.getInstance();
        PreparedStatement pt = conn.prepareStatement(query);
        pt.setString(1,(String) primaryKey);
        ResultSet rs = pt.executeQuery();
        if (rs.next()){
                //Inizializar um livro
                p.setUtilizadorId(rs.getInt("utilizadorId"));
                p.setNome(rs.getString("nome"));
                p.setApelido(rs.getString("apelido"));
                p.setEmail(rs.getString("email"));
                p.setPassword(rs.getString("password"));
                p.setRep_password(rs.getString("rep_password"));
                p.setEndereco(rs.getString("endereco"));
                p.setTelefone(rs.getString("telefone"));
                p.setPais(rs.getString("pais"));
             }
             pt.close();
             conn.close();
        }catch(Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE,ex.toString(),ex);
        }
       return p;
    }

    @Override
    public  int delete(Object primaryKey){
       int ris = 0;
       String query = "DELETE FROM utilizador WHERE utilizadorId = ?";
       try {
            Connection conn = Conexao.getInstance();
            PreparedStatement pt = conn.prepareStatement(query);
            pt.setString(1,(String) primaryKey);
            ris = pt.executeUpdate();
            pt.close();
            conn.close();
        }catch(Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE,ex.toString(),ex);
        }
       return ris;
    }

    @Override
    public int update(Object o){
        int ris = 0;
        try {
            Connection conn = Conexao.getInstance();
            String sqlInsert = "UPDATE utilizador SET"
                    + " utilizadorId =?, nome = ?, apelido = ?,"
                    + " email = ?, password = ?, rep_password = ?,"
                    + " endereco = ?, telefone = ?, pais = ?"
                    + " WHERE utilizadorId = ?";
            PreparedStatement pt = conn.prepareStatement(sqlInsert);
            pt.setInt(1,((Utilizador) o).getUtilizadorId());
            pt.setString(2,((Utilizador) o).getNome());
            pt.setString(3,((Utilizador) o).getApelido());
            pt.setString(4,((Utilizador) o).getEmail());
            pt.setString(5,((Utilizador) o).getPassword());
            pt.setString(6,((Utilizador) o).getRep_password());
            pt.setString(7,((Utilizador) o).getEndereco());
            pt.setString(8,((Utilizador) o).getTelefone());
            pt.setString(9,((Utilizador) o).getPais());
            pt.setInt(10,((Utilizador) o).getUtilizadorId());

            ris = pt.executeUpdate();
            pt.close();
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE,ex.toString(),ex);
        }

        //Se insert OK return object se nao null
        return ris;
    }

    @Override
    public Object insert(Object o){
        boolean ris = false;
        try {
            Connection conn = Conexao.getInstance();
            String sqlInsert = "INSERT INTO utilizador VALUES(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement pt = conn.prepareStatement(sqlInsert);
            pt.setInt(1,((Utilizador) o).getUtilizadorId());
            pt.setString(2,((Utilizador) o).getNome());
            pt.setString(3,((Utilizador) o).getApelido());
            pt.setString(4,((Utilizador) o).getEmail());
            pt.setString(5,((Utilizador) o).getPassword());
            pt.setString(6,((Utilizador) o).getRep_password());
            pt.setString(7,((Utilizador) o).getEndereco());
            pt.setString(8,((Utilizador) o).getTelefone());
            pt.setString(9,((Utilizador) o).getPais());
            pt.setString(10,"user");

            ris = pt.execute();
            pt.close();
            conn.close();
        } catch (Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE,ex.toString(),ex);
        }

        //Se insert OK return object se nao null
        if (ris) {
        return o;
        }
        return null;
    }

    @Override
    public java.util.ArrayList<Object> selectAll() {
        String query = "SELECT * FROM Utilizador";
        Utilizador p;
        ArrayList utilizadores = new ArrayList<Utilizador>();
        try {
             Connection conn = Conexao.getInstance();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(query);
             while(rs.next()){
                // Criar um livro
                p = (Utilizador) this.newElement();

                //Inizializar um livro
                p.setUtilizadorId(rs.getInt("utilizadorId"));
                p.setNome(rs.getString("nome"));
                p.setApelido(rs.getString("apelido"));
                p.setEmail(rs.getString("email"));
                p.setPassword(rs.getString("password"));
                p.setRep_password(rs.getString("rep_password"));
                p.setEndereco(rs.getString("endereco"));
                p.setTelefone(rs.getString("telefone"));
                p.setPais(rs.getString("pais"));

                //juntar um livro
                utilizadores.add(p);
             }
             st.close();
             conn.close();
        }catch(Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE,ex.toString(),ex);
        }
        return utilizadores;
    }


   public java.util.ArrayList<Object> loginUser(String email, String password) {
        String query = "SELECT * FROM utilizador WHERE email = ? and password =? and nivel='user'";
        Utilizador p;
        ArrayList utilizadores = new ArrayList<Utilizador>();
        try {
             Connection conn = Conexao.getInstance();
             PreparedStatement ps = conn.prepareStatement(query);
             ps.setString(1, email);
             ps.setString(2, password);
             ResultSet rs = ps.executeQuery();
             while(rs.next()){
                // Criar um livro
                p = (Utilizador) this.newElement();

                //Inizializar um livro
                p.setUtilizadorId(rs.getInt("utilizadorId"));
                p.setNome(rs.getString("nome"));
                p.setApelido(rs.getString("apelido"));
                p.setEmail(rs.getString("email"));
                p.setPassword(rs.getString("password"));
                p.setRep_password(rs.getString("rep_password"));
                p.setEndereco(rs.getString("endereco"));
                p.setTelefone(rs.getString("telefone"));
                p.setPais(rs.getString("pais"));
                p.setNivel(rs.getString("nivel"));

                //juntar um livro
                utilizadores.add(p);
             }
             ps.close();
             conn.close();
        }catch(Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE,ex.toString(),ex);
        }
        return utilizadores;

    }
   public java.util.ArrayList<Object> loginAdmin(String email, String password) {
        String query = "SELECT * FROM utilizador WHERE email = ?  and password = ? and nivel='admin'";
        Utilizador p;
        ArrayList utilizadores = new ArrayList<Utilizador>();
        try {
             Connection conn = Conexao.getInstance();
             PreparedStatement ps = conn.prepareStatement(query);
             ps.setString(1, email);
             ps.setString(2, password);
             ResultSet rs = ps.executeQuery();
             while(rs.next()){
                // Criar um cadastro
                 p = (Utilizador) this.newElement();

                //Inizializar um cadastro
                p.setUtilizadorId(rs.getInt("utilizadorId"));
                p.setNome(rs.getString("nome"));
                p.setApelido(rs.getString("apelido"));
                p.setEmail(rs.getString("email"));
                p.setPassword(rs.getString("password"));
                p.setRep_password(rs.getString("rep_password"));
                p.setEndereco(rs.getString("endereco"));
                p.setTelefone(rs.getString("telefone"));
                p.setPais(rs.getString("pais"));
                p.setNivel(rs.getString("nivel"));

                //juntar um cadastro
                utilizadores.add(p);
             }
             ps.close();
             conn.close();
        }catch(Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE,ex.toString(),ex);
        }
        return utilizadores;

    }
    
   public java.util.ArrayList<Object> SelectUtilizadorByemail(String email) {
        String query = "SELECT * FROM admin WHERE email = ?";
        Utilizador p;
        ArrayList utilizadores = new ArrayList<Utilizador>();
        try {
             Connection conn = Conexao.getInstance();
             PreparedStatement ps = conn.prepareStatement(query);
             ps.setString(1, email);
             ResultSet rs = ps.executeQuery();
             while(rs.next()){
                // Criar um cadastro
                 p = (Utilizador) this.newElement();

                //Inizializar um cadastro
                p.setUtilizadorId(rs.getInt("utilizadorId"));
                p.setNome(rs.getString("nome"));
                p.setApelido(rs.getString("apelido"));
                p.setEmail(rs.getString("email"));
                p.setPassword(rs.getString("password"));
                p.setRep_password(rs.getString("rep_password"));
                p.setEndereco(rs.getString("endereco"));
                p.setTelefone(rs.getString("telefone"));
                p.setPais(rs.getString("pais"));


                //juntar um cadastro
                utilizadores.add(p);
             }
             ps.close();
             conn.close();
        }catch(Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE,ex.toString(),ex);
        }
        return utilizadores;

    }
    
}
