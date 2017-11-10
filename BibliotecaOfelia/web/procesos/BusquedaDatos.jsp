<%@ page import="biblioteca.ofelia.procesos.*,biblioteca.ofelia.entidad.*"%>
<%@ page import= "java.util.ArrayList"%> 
<%
    String nom=(String) request.getParameter("nom");if(nom==null){nom="";}
    String pat=(String) request.getParameter("pat");if(pat==null){pat="";}
    String mat=(String) request.getParameter("mat");if(mat==null){mat="";}
%>


        <h1>Hello World! <%=nom%> <%=pat%> <%=mat%></h1>
