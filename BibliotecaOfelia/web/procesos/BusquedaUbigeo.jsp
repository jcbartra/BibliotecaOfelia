<%-- 
    Document   : BusquedaUbigeo
    Created on : 09-nov-2017, 20:56:38
    Author     : SORALUZ
--%>
<%@ page import="biblioteca.ofelia.procesos.*,biblioteca.ofelia.entidad.*"%>
<%@ page import= "java.util.ArrayList"%> 

<option value='0'>Selecciona una opcion</option>
<%
    String id=(String) request.getParameter("id");
    
    ubigeo ub=new ubigeo();
    n_ubigeo nub=new n_ubigeo();
    nub.setUb(ub);

   ArrayList lub=nub.Ubigeos_Especifica(id);
   for(int s=0;s<lub.size();s++){
    ubigeo subi=(ubigeo) lub.get(s);
   System.out.println(subi.getNombre());
%>
    
        <option value='<%=subi.getIdubigeo()%>'><%=subi.getNombre()%></option>
    
<%}%>