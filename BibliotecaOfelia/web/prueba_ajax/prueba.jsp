<%@ page import="biblioteca.ofelia.procesos.*,biblioteca.ofelia.entidad.*"%>
<%@ page import= "java.util.ArrayList"%> 
<%
    categoria c=new categoria();
    n_categoria nc=new n_categoria();
    nc.setC(c);
    //categorias
    String[][] categoria=new String[100][3];
    int contct;
    ArrayList lct=nc.Categorias_Generales();
    for(contct=0;contct<lct.size();contct++){
    categoria cat=(categoria) lct.get(contct);
    categoria[contct][1]=cat.getIdcategoria();
    categoria[contct][2]=cat.getNombre();
    //out.println(cat.getNombre()+"<br />");
    }
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="http://www.google.com/jsapi"></script>
        <script src="../Recursos/js/jquery-2.2.3.min.js" type="text/javascript"></script>
        
        <script src="../Recursos/js/jquery.min.js" type="text/javascript"></script>
        <script src="../Recursos/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="../Recursos/js/bootstrap-select.min.js" type="text/javascript"></script>
        
        <link href="../Recursos/css/bootstrap.min.css" rel="stylesheet">
        <link href="../Recursos/css/bootstrap-select.min.css" rel="stylesheet">
                       
        
        <script language="javascript">
           function recargarPrimero() {
               
               var id=document.getElementById("s1").value;
            var xhttp; 
            if (id == "") {
              document.getElementById("destino").innerHTML = "";
              return;
            }
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
              if (this.readyState == 4 && this.status == 200) {
              document.getElementById("destino").innerHTML = this.responseText;
              }
            };
            xhttp.open("GET", "procesar.jsp?id="+id, true);
            xhttp.send();
          }
          function recargar(id) {
              
            var xhttp; 
            if (id == "") {
              document.getElementById("destino").innerHTML = "";
              return;
            }
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
              if (this.readyState == 4 && this.status == 200) {
              document.getElementById("destino").innerHTML = this.responseText;
              }
            };
            xhttp.open("GET", "procesar.jsp?id="+id, true);
            xhttp.send();
          }
        </script>
    </head>
    <body onload="recargarPrimero()">
        <form >
            Categoría <select onChange="recargar(this.value)" name="s1" id="s1">
            <option value='0'>Selecciona una opcion</option>
            <%for(int x=0; x<contct; x++){%>
            <option value='<%=categoria[x][1]%>'><%=categoria[x][2]%></option>
            <%}%>
        </select>
        <br />
        SubCategoría: <select id="destino">
            
        </select>
        </form>
        
        <div class="btn-group bootstrap-select">
            <select class="selectpicker" data-live-search="true" tabindex="-98">
                <option>Hot Dog, Fries and a Soda</option>
                <option>Burger, Shake and a Smile</option>
                <option>Sugar, Spice and all things nice</option>
            </select>
        </div>


        
    </body>
</html>
