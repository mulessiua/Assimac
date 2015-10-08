<%-- 
    Document   : index
    Created on : Sep 2, 2015, 12:07:15 PM
    Author     : ab
--%>


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
        <div ><h2 class="nomeIniciar">Iniciar Sessao</h2></div>
  <form action="login" name="loginForm" method="post">
<table  border="0" align="center" id="form">
  <tbody>
    <tr>
      
        <td align="left" class="insertText" style="padding-left: 40px;">  Email: </td>
  
      <td >
        <input type="email" name="email" class="insert" required="true" autofocus placeholder="xyz@email.com"/></td>
    </tr>
    <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
    <tr>
      <td align="right" class="insertText" style="padding-left: 40px; padding-right: 10px;">Password:</td>
      <td>
          <input type="password" name="password" required="true" autofocus class="insert" placeholder="••••••••••••"/></td>
    </tr>
   
     <tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>
    <tr>
      <td><input  class="btn"type="reset"></td>
      
      <td><input class="btn" type="submit" name="submit" value="Entrar"></td>
    </tr>
  </tbody>
</table>
</form>
        <img src="img/email_icon.png" width="25px" height="15px" class="insertText" style="position: absolute; top:372px; left: 510px;"/>
         <img src="img/password_icon.png" width="18px" height="25px" class="insertText" style="position: absolute; top:423px; left: 515px;"/>
</body>
</html>

