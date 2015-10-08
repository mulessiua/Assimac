/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package factory;

import dao.Conexao;
import entidades.Produto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author ab
 */
public class FactoryProduto extends Factory {
    
     @Override
    public  Object newElement() {
        return new Produto();
    }

    @Override
    public  Object read(Object primaryKey){
       Produto p;
       // Criar um Produto
       p = (Produto) this.newElement();
       String query = "SELECT * FROM produto WHERE produtoId = ?";
      try {
        Connection conn = Conexao.getInstance();
        PreparedStatement pt = conn.prepareStatement(query);
        pt.setString(1,(String) primaryKey);
        ResultSet rs = pt.executeQuery();
        if (rs.next()){
                //Inizializar um Produto
                p.setProdutoId(rs.getInt("produtoId"));
                p.setNome(rs.getString("nome"));
                p.setCategoria(rs.getString("categoria"));
                p.setDescricao(rs.getString("descricao"));
                p.setPreco(rs.getDouble("preco"));
                p.setQuantidade(rs.getInt("quantidade"));
                p.setImagem(rs.getString("imagem"));

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
       String query = "DELETE FROM produto WHERE produtoId = ?";
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
            String sqlInsert = "UPDATE produto SET"
                    + " produtoId =?, nome = ?, categoria = ?,"
                    + " descricao = ?, preco = ?, quantidade = ?,"
                    + " imagem = ?"
                    + " WHERE produtoId = ?";
            PreparedStatement pt = conn.prepareStatement(sqlInsert);
            pt.setInt(1,((Produto) o).getProdutoId());
            pt.setString(2,((Produto) o).getNome());
            pt.setString(3,((Produto) o).getCategoria());
            pt.setString(4,((Produto) o).getDescricao());
            pt.setDouble(5,((Produto) o).getPreco());
            pt.setInt(6,((Produto) o).getQuantidade());
            pt.setString(7,((Produto) o).getImagem());
            pt.setInt(8,((Produto) o).getProdutoId());

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
            String sqlInsert = "INSERT INTO produto VALUES(?,?,?,?,?,?,?)";
            PreparedStatement pt = conn.prepareStatement(sqlInsert);
            pt.setInt(1,((Produto) o).getProdutoId());
            pt.setString(2,((Produto) o).getNome());
            pt.setString(3,((Produto) o).getCategoria());
            pt.setString(4,((Produto) o).getDescricao());
            pt.setDouble(5,((Produto) o).getPreco());
            pt.setInt(6,((Produto) o).getQuantidade());
            pt.setString(7,((Produto)o).getImagem());
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
        String query = "SELECT * FROM produto ORDER BY nome ASC";
        Produto p;
        ArrayList produtos = new ArrayList<Produto>();
        try {
             Connection conn = Conexao.getInstance();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(query);
             while(rs.next()){
                // Criar um Produto
                p = (Produto) this.newElement();

                //Inizializar um Produto
                p.setProdutoId(rs.getInt("produtoId"));
                p.setNome(rs.getString("nome"));
                p.setCategoria(rs.getString("categoria"));
                p.setDescricao(rs.getString("descricao"));
                p.setPreco(rs.getDouble("preco"));
                p.setQuantidade(rs.getInt("quantidade"));
                p.setImagem(rs.getString("imagem"));
                //juntar um Produto
                produtos.add(p);
             }
             st.close();
             conn.close();
        }catch(Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE,ex.toString(),ex);
        }
        
        return produtos;
    }
      public java.util.ArrayList<Object> selectAll10() {
        String query = "SELECT * FROM produto limit 10";
        Produto p;
        ArrayList produtos = new ArrayList<Produto>();
        try {
             Connection conn = Conexao.getInstance();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(query);
             while(rs.next()){
                // Criar um Produto
                p = (Produto) this.newElement();

                //Inizializar um Produto
                p.setProdutoId(rs.getInt("produtoId"));
                p.setNome(rs.getString("nome"));
                p.setCategoria(rs.getString("categoria"));
                p.setDescricao(rs.getString("descricao"));
                p.setPreco(rs.getDouble("preco"));
                p.setQuantidade(rs.getInt("quantidade"));
                p.setImagem(rs.getString("imagem"));
                //juntar um Produto
                produtos.add(p);
             }
             st.close();
             conn.close();
        }catch(Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE,ex.toString(),ex);
        }
        return produtos;
    }


     public java.util.ArrayList<Object> selectProdutoByNome(String nome) {
        String query = "SELECT * FROM produto WHERE nome like ? ";
        Produto p;
        ArrayList produtos = new ArrayList<Produto>();
        try {
             Connection conn = Conexao.getInstance();
             PreparedStatement ps = conn.prepareStatement(query);
             ps.setString(1, "%"+nome+"%");
             ResultSet rs = ps.executeQuery();
             while(rs.next()){
                // Criar um Produto
                p = (Produto) this.newElement();

                //Inizializar um Produto
                p.setProdutoId(rs.getInt("produtoId"));
                p.setNome(rs.getString("nome"));
                p.setCategoria(rs.getString("categoria"));
                p.setDescricao(rs.getString("descricao"));
                p.setPreco(rs.getDouble("preco"));
                p.setQuantidade(rs.getInt("quantidade"));
                p.setImagem(rs.getString("imagem"));

                //juntar um Produto
                produtos.add(p);
             }
             ps.close();
             conn.close();
        }catch(Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE,ex.toString(),ex);
        }
        return produtos;

    }

  

   public java.util.ArrayList<Object> selectProdutosByPrimaryKey(String primaryKey) {
        String query = "SELECT * FROM produto WHERE produtoId = ? ";
        Produto p;
        ArrayList produtos = new ArrayList<Produto>();
        try {
             Connection conn = Conexao.getInstance();
             PreparedStatement ps = conn.prepareStatement(query);
             
             ps.setString(1, primaryKey);
             ResultSet rs = ps.executeQuery();
             while(rs.next()){
                // Criar um Produto
                p = (Produto) this.newElement();

                //Inizializar um Produto
                p.setProdutoId(rs.getInt("produtoId"));
                p.setNome(rs.getString("nome"));
                p.setCategoria(rs.getString("categoria"));
                p.setDescricao(rs.getString("descricao"));
                p.setPreco(rs.getDouble("preco"));
                p.setQuantidade(rs.getInt("quantidade"));
                p.setImagem(rs.getString("imagem"));


                //juntar um Produto
                produtos.add(p);
             }
             ps.close();
             conn.close();
        }catch(Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE,ex.toString(),ex);
        }
        return produtos;

    }
  
   public java.util.ArrayList<Object> selectProdutoByCategoria(String categoria) {
        String query = "SELECT * FROM produto WHERE categoria like ? ";
        Produto p;
        ArrayList produtos = new ArrayList<Produto>();
        try {
             Connection conn = Conexao.getInstance();
             PreparedStatement ps = conn.prepareStatement(query);
             ps.setString(1, "%"+categoria+"%");
             ResultSet rs = ps.executeQuery();
             while(rs.next()){
                // Criar um Produto
                p = (Produto) this.newElement();

                //Inizializar um Produto
                p.setProdutoId(rs.getInt("produtoId"));
                p.setNome(rs.getString("nome"));
                p.setCategoria(rs.getString("categoria"));
                p.setDescricao(rs.getString("descricao"));
                p.setPreco(rs.getDouble("preco"));
                p.setQuantidade(rs.getInt("quantidade"));
                p.setImagem(rs.getString("imagem"));

                //juntar um Produto
                produtos.add(p);
             }
             ps.close();
             conn.close();
        }catch(Exception ex) {
            Logger.getLogger(this.getClass().getName()).log(Level.SEVERE,ex.toString(),ex);
        }
        return produtos;

    }
    
    
}
