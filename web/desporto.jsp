<%@page import="carrinho.Carrinho"%>
<%@page import="entidades.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
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

            if((cm!=null)&&(cm.getNumeroItems()==1)){we="Item";}
            if((cm!=null)&&(cm.getNumeroItems()>=2)){we="Itens";}

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
             <a href="fatura.jsp" > <img src="img/shoppingcart.png" height="20" width="20" id="cart"/>&nbsp;Cart: <%=numItemCarr%></a>
         </div>
       
     <div class="cabecalho"> 
         <h1> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             A S S I M  A C &nbsp  E N T E R P R I S E S</h1>
         <h3> &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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

        
            <%!ArrayList<Produto> produtos = new ArrayList<Produto>();%>
        <% produtos = (ArrayList<Produto>) request.getAttribute("produtos");%>

     
        
        
          
            <%
         out.println("<table  border='0'   class='teste' background='img/symphony.png'>");
             int i =3 ;
            for(Produto p: produtos){
                int qtd=p.getQuantidade();
             String x ="";
             if(qtd==0 ){
                 x ="<p align=center><a id='adcart' href='#'>Indisponivel</a></p>";
             }else{
                x=" <p align=center><a id='adcart' href=fatura?codigo="+p.getProdutoId()+">Add to cart</a></p>";
             }
                if(i>=0){
                out.println("<td id ='grid' width='200' height='290'bgcolor='white' >"
                        + "<p align=center><img width='100' height='100' src='img/"+p.getImagem()+"'/></p>"
                        + "<h4 align=center>"+p.getNome()+"</h4>"
                         + "<h5 align=center>"+p.getDescricao()+"</h5>"
                        + "<p align=center><b id='preco'>"+p.getPreco()+"0 MZN/Item</b></p>"
                        + "<p align=center> Stock: "+p.getQuantidade()+"</p><br>"
                        +x
                        + "</td>"
                        + "<td ></td><td></td><td></td><td></td>"
                        + "");
                        i--;
                }else{
                     out.println("<td id ='grid' width='200' height='190' bgcolor=white>"
                        + "<p align=center><img width='100' height='100' src='img/"+p.getImagem()+"'/></p>"
                        + "<h4 align=center>"+p.getNome()+"</h4>"
                         + "<h5 align=center>"+p.getDescricao()+"</h5>"
                        + "<p align=center><b id='preco'>"+p.getPreco()+"0 MZN/Item</b></p>"
                        + "<p align=center> Stock: "+p.getQuantidade()+"</p><br>"
                        +x
                        + "</td>"
                        + "");
                out.println("<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                        + "<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>");
                i=3;
                }
      
            }
            out.println("  </table>");
     %>
    
      
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

    </body>
</html>