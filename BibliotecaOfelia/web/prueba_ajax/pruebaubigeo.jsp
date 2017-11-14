<%-- 
    Document   : pruebaubigeo
    Created on : 09-nov-2017, 21:58:58
    Author     : SORALUZ
--%>
<%@ page import="biblioteca.ofelia.procesos.*,biblioteca.ofelia.entidad.*"%>
<%@ page import= "java.util.ArrayList"%> 
<%
    departamento dep=new departamento();
    n_departamento ndep=new n_departamento();
    ndep.setDep(dep);
    //departamentos
 
    String[][] departamento=new String[100][3];
    int contde;
    ArrayList lde=ndep.Listar_departamento();
    for(contde=0;contde<lde.size();contde++){
    departamento depa=(departamento) lde.get(contde);
    departamento[contde][1]=depa.getIddepartamento();
    departamento[contde][2]=depa.getNombre();
    //out.println(dep.getNombre()+"<br />");
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
            xhttp.open("GET", "procesarubigeo.jsp?id="+id, true);
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
            xhttp.open("GET", "procesarubigeo.jsp?id="+id, true);
            xhttp.send();
          }
        </script>
    </head>
    <body onload="recargarPrimero()">
        <form >
            Departamento <select onChange="recargar(this.value)" name="s1" id="s1">
            <option value='0'>Selecciona una opcion</option>
            <%for(int x=0; x<contde; x++){%>
            <option value='<%=departamento[x][1]%>'><%=departamento[x][2]%></option>
            <%}%>
        </select>
        <br />
        Ubigeo: <select id="destino">
            
        </select>
        </form>
    </body>
</html>
