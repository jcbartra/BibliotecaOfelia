<%-- 
    Document   : BusquedaDepartamento
    Created on : 09-nov-2017, 21:42:36
    Author     : SORALUZ
--%>
<%@ page import="biblioteca.ofelia.procesos.*,biblioteca.ofelia.entidad.*"%>
<%@ page import= "java.util.ArrayList"%> 

<option value='0'>Selecciona una opcion</option>
<%
    String id=(String) request.getParameter("id");
    
    departamento de=new departamento();
        n_departamento nde=new n_departamento();
        nde.setDep(de);
        
   ArrayList lde=nde.Departamentos_Especifica(id);
   for(int s=0;s<lde.size();s++){
    departamento depa=(departamento) lde.get(s);
   System.out.println(depa.getNombre());
%>
    
        <option value='<%=depa.getIddepartamento()%>'><%=depa.getNombre()%></option>
    
<%}%>