<%-- 
    Document   : index
    Created on : Sep 2, 2015, 12:07:15 PM
    Author     : ab
--%>


<%@page import="carrinho.CarrinhoItem"%>
<%@page import="carrinho.Carrinho"%>
<%@page import="factory.FactoryProduto"%>
<%@page import="entidades.Produto,java.util.List,java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%
String numItemCarr = new String();
HttpSession htm = request.getSession(true);
Carrinho cm = (Carrinho) htm.getAttribute("carrinho");
if ((cm != null) && (cm.getNumeroItems() > 0)) {
    numItemCarr = "("+cm.getNumeroItems()+")";
}else{
numItemCarr = "(0)";
}
%>
<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/style.css" rel="stylesheet" type="text/css">
        <title>Assimac Enterprises</title>
        
    </head>
    <body background="img/symphony.png">
        
     <% HttpSession sessao = request.getSession(true);  
      
     
     Object a = sessao.getAttribute("email");
     Object b = sessao.getAttribute("nome");
     String ver = "";
     String se = "";
     String bem = (String) a;
     String ji = "";
     String cadastro ="";
     String nome =(String) b;
  
    
     
     String we ="";

            if((cm!=null)&&(cm.getNumeroItems()==1)){we=" Item";}
            if((cm!=null)&&(cm.getNumeroItems()>=2)){we=" Itens";}

     if(sessao.getAttribute("email")==null){
         ji = ""
                 + "<a id='linklogin' href='login.jsp'>Entre</a> / "
                 + "<a id='linklogin' href='cadastro.jsp'> Inscreva-se</a>"
                 + "<a id='linkAdmin' href='loginAdmin.jsp'>Administrador</a>"; 
     
     }else{
        se="Bem Vindo: "+nome;
         ji = "<a href='logout' id='logout' ><b>-Terminar Sessao</b> </a>";
          
     }
     
     String link1 = "";
     String link2 = "";
     
     if(sessao.getAttribute("admin")==null){
       link1="";
       link2="";
     }
    else{
    link1 = " <a href='inserir.jsp' style='text-decoration: none' ><li>Inserir </li></a>";
    link2 = "<a href='operacoesProdutos'><li>Operacoes</li></a>";
    }
     %>

     <div class="login"> 
            
         <div><h4> <%=se%> <%=ji%><%=cadastro%></h4></div>
     
     </div>
         <div class="carrinho">
             <a href="fatura.jsp" legend="Carrinho"> <img  src="img/shoppingcart.png" height="20" width="20" id="cart"/>&nbsp;Cart: <%=numItemCarr%></a>
         </div>
       
     <div class="cabecalho"> 
         <h1> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             A S S I M  A C &nbsp  E N T E R P R I S E S</h1>
         <h3> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            O n l i  n e &nbsp S h o p p  i n g &nbsp</h3>
        
     </div>
         <div class="home">
         <a href="index.jsp"><img src="img/home.png"  height="40" width="40" alt="HOME" id="home"/></a>
         </div>
         
        <div class="corpo">
            <div id="categorias">
            <table border="0">
                <thead>
                    <tr>
                        <th>CATEGORIAS</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td align="center"><a href="modaMasculina">Moda Masculina</a></td>
                    </tr>
                    <tr>
                        <td align="center"><a href="modaFemenina">Moda Femenina</a></td>
                    </tr>
                    <tr>
                        <td align="center"><a href="desporto">Desporto e Lazer<a/></td>
                    </tr>
                    <tr>
                        <td align="center"><a href="electronicos">Electronicos<a/></td>
                    </tr>
                    <tr>
                        <td align="center"><a href="computadores">Computadores e Telefones<a/></td>
                    </tr>
                </tbody>
            </table>

        </div>
           
     </div>
        </div>
                         
         
    
      
       <div id="menu">
           <ul class="menu"><a href="index.jsp"><li>Pagina Inicial</li></a>
             
             <li>
                 Produtos
                 <ul>
                     <a href="mostrarProdutos" style="text-decoration: none"> <li>Mostrar</li></a>
                     <%=link1%>
                    
                 </ul>
             </li>
             <%=link2%>
             <a href="sobre.jsp"><li>Sobre</li></a>
             <a href="contacto.jsp"><li>Contacte-nos</li></a>
         </ul>
         </div>
     <div class="box">
         <div class="container-4">
             <form action="procurar" method="get"> 
             <input type="search" id="search" name="procurar" placeholder="Search..." />
             <button class="icon" type="submit"><h6 id="procurar1">Procurar</h6> </button>
             </form>
         </div>
     </div>
        <%
HttpSession ht = request.getSession(true);
Carrinho c = (Carrinho) ht.getAttribute("carrinho");
if ((c == null) || (c.getNumeroItems() == 0)) {
  out.println("<h3 align=center id='carrinhoVazio'>Carrinho Vazio</h3>");

}
else {
    double taxa = 0.05*c.getTotale();
    int shipping = 250;
    double total = taxa+shipping+c.getTotale();
    
%>
        
        
    
<%
  
            
    Produto p;
    for(CarrinhoItem cItem: c.getItems()){
        p = cItem.getProduto();
        String y="";
        String x="";
        if(cItem.getQuantidade()>=p.getQuantidade()){
            y ="<td><a id='MM' title='Aumentar Quantidade' href='#'><b>+</b><a/>";
            
        }else{
             y ="<td><a id='MM' title='Aumentar Quantidade' href=fatura?codigo="+p.getProdutoId()+"><b>+</b><a/>";
        }
        
        if(cItem.getQuantidade()<=0){
            x="<a id='MM' title='Diminuir Quantidade' href='#'><b>–</b><a/>";
        }else{
            x="<a id='MM' title='Diminuir Quantidade' href=dQuantidade?codigo="+p.getProdutoId()+"><b>–</b><a/>";
        }
        out.println("<div class='carrinhoTable'><table border='0'bgcolor='white' id='tabelaFatura'>"
                + "<tr>");
        out.println("<td id='imagem'><img src=img/"+p.getImagem()+" width='100' height='100'></td>");
        out.println("<td width='310' id='nomeDesc'><b><h3>"+p.getNome()+"</b><p align=left></h3><br>"+p.getDescricao()+"</p></td>");
        
        out.println("<td bgcolor=#FFFFFF id='precoFatura'> <p align=center>"+(p.getPreco()*cItem.getQuantidade())+"0 MZN</p></td>");
        
        out.println("</tr>");
        out.println("<tr>");
    out.println(""+y+"&nbsp;&nbsp;&nbsp;"+x+"</td><td bgcolor=#FFFFFF><b>"+(cItem.getQuantidade()+we)+"</b>/"+p.getPreco()+"0 MZN</td><td><b><p align=center><a href=\"removeItemCarrinho?codigo="+p.getProdutoId()+"\"><img title='Remover Produto' width='30' height='30' src='img/remove_icon.png'/></a></p></b></td>");
    out.println("</tr>"
            + "</table>");
     out.println("<br>");
    }
  
    out.println("<div><table bgcolor='white' id='total'>"
        + "<tr><td width='130'><h2><b>Total</b></h2></td><td><h2 id='x1'><b>"+total+"0 MZN</b></h2></td></tr>"
        + "</table></div></div>");
    
    out.println("<div><table bgcolor='white' id='subtotal'>"
            + "<tr>"
            + "<td width='130'><b>Subtotal: </b></td><td align='right'>"+c.getTotale()+"0 MZN</td>"
            + "</tr>"
              + "<tr><td width='130' ><b>Taxa(5%): </b></td><td align='right'>"+taxa+"0 MZN</td></tr>"
            + "<tr><td width='130'><b>Envio: </b></td><td align='right'>"+shipping+".00 MZN</td></tr>"
            + "</table></div>");
    
   
    
    }
%>

    </body>
</html>

