<%-- 
    Document   : procesardepartamento
    Created on : 10-nov-2017, 0:31:27
    Author     : SORALUZ
--%>

<%@ page import="biblioteca.ofelia.procesos.*,biblioteca.ofelia.entidad.*"%>
<%@ page import= "java.util.ArrayList"%> 

<%
    String id=(String) request.getParameter("id");
    String sub=(String) request.getParameter("sub");if(sub==null){sub="x";}
    
    departamento de=new departamento();
        n_departamento nde=new n_departamento();
        nde.setDep(de);
        
   ArrayList ldepa=nde.Mostrar_departamento(id);
   for(int s=0;s<ldepa.size();s++){
    departamento depa=(departamento) ldepa.get(s);
   System.out.println(depa.getNombre());
%>
    
<option value='<%=depa.getIddepartamento()%>' <%if(depa.getIddepartamento().equals(sub)){%>selected<%}%>><%=depa.getNombre()%></option>
    
<%}%>