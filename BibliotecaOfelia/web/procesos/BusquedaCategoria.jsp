<%@ page import="biblioteca.ofelia.procesos.*,biblioteca.ofelia.entidad.*"%>
<%@ page import= "java.util.ArrayList"%> 
<option value='0'>Selecciona una opcion</option>
<%
    String id=(String) request.getParameter("id");
    
    subcategoria sc=new subcategoria();
        n_subcategoria nsc=new n_subcategoria();
        nsc.setSc(sc);
        
   ArrayList lsc=nsc.Subcategorias_Especifica(id);
   for(int s=0;s<lsc.size();s++){
    subcategoria scat=(subcategoria) lsc.get(s);
   System.out.println(scat.getNombre());
%>
    
        <option value='<%=scat.getIdsubcategoria()%>'><%=scat.getNombre()%></option>
    
<%}%>