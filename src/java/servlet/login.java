/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package servlet;


import entidades.Utilizador;
import factory.FactoryUtilizador;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Mohamed Ivaz
 */
@WebServlet(name = "login", urlPatterns = {"/login"})
public class login extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String email = request.getParameter("email");
            String password = request.getParameter("password");

            HttpSession session = request.getSession(true);
            
            FactoryUtilizador fu = new FactoryUtilizador();
            List utilizadores = new ArrayList<Utilizador>();
            
            utilizadores = fu.loginUser(email, password);
            
            ArrayList<Utilizador> utilizadores1 = new ArrayList<Utilizador>();
            utilizadores1 = (ArrayList<Utilizador>) utilizadores;
            
           // int nivel=2;
            
            for(Utilizador u: utilizadores1){               
                out.println("Bem vindo: "+u.getNome()+" "+ u.getApelido());
                
                out.println(2);
                //if(nivel==2){
                //session.setAttribute("admin", nivel);
                session.setAttribute("nome", u.getNome());
                }
            
            
     
            
            if(utilizadores.isEmpty()){
                response.sendRedirect(request.getContextPath() +"/erro.jsp");
            }
            else{
                session.setAttribute("email", email);
                response.sendRedirect(request.getContextPath() +"/index.jsp");
            }
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
