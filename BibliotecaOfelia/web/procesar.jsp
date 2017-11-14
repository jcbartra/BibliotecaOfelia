<%@ page import="biblioteca.ofelia.procesos.*,biblioteca.ofelia.entidad.*"%>
<%@ page import= "java.util.ArrayList"%> 

<%
    String id=(String) request.getParameter("id");
    String idsub=(String) request.getParameter("idsub");if(idsub==null){idsub="";}
    
    subcategoria sc=new subcategoria();
        n_subcategoria nsc=new n_subcategoria();
        nsc.setSc(sc);
        
   ArrayList lsc=nsc.Subcategorias_Especifica(id);
   for(int s=0;s<lsc.size();s++){
    subcategoria scat=(subcategoria) lsc.get(s);
   System.out.println(scat.getNombre());
%>
    
        <option value='<%=scat.getIdsubcategoria()%>'<%if (scat.getIdsubcategoria().equals(idsub)) {%>selected="selected"<%}%>><%=scat.getNombre()%></option>
    
<%}%>