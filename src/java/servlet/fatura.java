package servlet;



import carrinho.Carrinho;
import entidades.Produto;
//////import entidades.FaturaOrdem;
import factory.FactoryProduto;
//import factory.FactoryFaturaOrdem;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name="fatura", urlPatterns={"/fatura"})
public class fatura extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
        String codigo = request.getParameter("codigo");
        
    

            FactoryProduto fp = new FactoryProduto();
            Produto p = (Produto) fp.read(codigo);

            HttpSession session = request.getSession(true);
           if(session.getAttribute("email")==null) {
           response.sendRedirect(request.getContextPath() +"/login.jsp");
           }else{
            Carrinho c = (Carrinho) session.getAttribute("carrinho");
            if (c == null) {
                c = new Carrinho();
            }
            c.adicionaItem(p);
            session.setAttribute("carrinho",c);
            response.sendRedirect(request.getContextPath() +"/fatura.jsp");
           }
/*          
            
//adicionar a ordem de base de dados
            
              //out.println(session.getAttribute("email"));
            Object a = session.getAttribute("email");
            String b = (String) a;

            int codigo1 = Integer.parseInt(request.getParameter("codigo"));

            FactoryFaturaOrdem fco = new FactoryFaturaOrdem();
            FaturaOrdem co = (FaturaOrdem) fco.newElement();

             out.println(codigo1);

            co.setProdutoId(codigo1);

            fco.insert(co);

    */
        } finally { 
            out.close();
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
