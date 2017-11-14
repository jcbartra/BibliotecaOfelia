<%-- 
    Document   : pruebadepartamento
    Created on : 10-nov-2017, 0:31:13
    Author     : SORALUZ
--%>

<%@ page import="biblioteca.ofelia.procesos.*,biblioteca.ofelia.entidad.*"%>
<%@ page import= "java.util.ArrayList"%> 
<%
    pais pa=new pais();
    n_pais npa=new n_pais();
    npa.setPa(pa);
    //pais
 
    String[][] pais=new String[100][3];
    int contpa;
    ArrayList lpa=npa.Listar_pais();
    for(contpa=0;contpa<lpa.size();contpa++){
    pais pai=(pais) lpa.get(contpa);
    pais[contpa][1]=pai.getIdpais();
    pais[contpa][2]=pai.getNombre();
    //out.println(pa.getNombre()+"<br />");
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
            xhttp.open("GET", "procesardepartamento.jsp?id="+id, true);
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
            xhttp.open("GET", "procesardepartamento.jsp?id="+id, true);
            xhttp.send();
          }
        </script>
    </head>
    <body onload="recargarPrimero()">
        <form >
            Pais <select onChange="recargar(this.value)" name="s1" id="s1">
            <option value='0'>Selecciona una opcion</option>
            <%for(int x=0; x<contpa; x++){%>
            <option value='<%=pais[x][1]%>'><%=pais[x][2]%></option>
            <%}%>
        </select>
        <br />
        Departamento: <select id="destino">
            
        </select>
        </form>
    </body>
</html>
