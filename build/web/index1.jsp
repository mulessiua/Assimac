<%@page import="java.util.List"%>
<%@page import="entidades.Produto"%>
<%@page import="entidades.Produto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="factory.FactoryProduto"%>
<html>
    <head>
        <style type='text/css'>
            span {
                text-decoration:underline;
                color:blue;
                cursor:pointer;
            }
        </style>
        <script>
            // show the given page, hide the rest
            function show(elementID) {
                // try to find the requested page and alert if it's not found
                var ele = document.getElementById(elementID);
                if (!ele) {
                    alert("no such element");
                    return;
                }

                // get all pages, loop through them and hide them
                var pages = document.getElementsByClassName('page');
                for(var i = 0; i < pages.length; i++) {
                    pages[i].style.display = 'none';
                }

                // then show the requested page
                ele.style.display = 'block';
            }
        </script>
    </head>
    <body>
      <p>
        Show page 
            <span onclick="show('Page1');">1</span>, 
            <span onclick="show('Page2');">2</span>, 
            <span onclick="show('Page3');">3</span>.
        </p>

    <div id="Page1" class="page" style="">
        <%
            FactoryProduto fp = new FactoryProduto();
            List produtos1 = new ArrayList<Produto>();
            produtos1 = fp.selectAll();

            request.setAttribute("produtos",produtos1);
            %>
        
        
            <%!ArrayList<Produto> produtos = new ArrayList<Produto>();%>
        <% produtos = (ArrayList<Produto>) request.getAttribute("produtos");%>

     
        
        
          
            <%
         out.println("<table  border='0'   class='teste' background='img/symphony.png'>");
             int i =3 ;
            for(Produto p: produtos){
               
                if(i>=0){
                out.println("<td id ='grid' width='200' height='290'bgcolor='white' >"
                        + "<p align=center><img width='100' height='100' src='img/"+p.getImagem()+"'/></p>"
                        + "<h4 align=center>"+p.getNome()+"</h4>"
                         + "<h5 align=center>"+p.getDescricao()+"</h5>"
                        + "<p align=center><b id='preco'>"+p.getPreco()+"0 MZN/Item</b></p>"
                        + "<p align=center> Stock: "+p.getQuantidade()+"</p><br>"
                        + "<p align=center><a id='adcart' href=fatura?codigo="+p.getProdutoId()+">Add to cart</a></p>"
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
                             + "<p align=center><a id='adcart' href=fatura?codigo="+p.getProdutoId()+">Add to cart</a></p>"
                        + "</td>"
                        + "");
                out.println("<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>"
                        + "<tr></tr><tr></tr><tr></tr><tr></tr><tr></tr>");
                i=3;
                }
      
            }
            out.println("  </table>");
     %>
    </div>
    <div id="Page2" class="page" style="display:none">
        Content of page 2
    </div>
    <div id="Page3" class="page" style="display:none">
        Content of page 3
    </div>

    </body>
</html>