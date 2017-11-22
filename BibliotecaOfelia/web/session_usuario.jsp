<%@ page import="biblioteca.ofelia.procesos.n_login,biblioteca.ofelia.entidad.usuario"%>
<%

String usuario=(String)request.getParameter("usuario");
String foto="";
usuario us=new usuario();
n_login nl=new n_login();

nl.setUs(us);

us.setUsuario(usuario);

nl.Buscar_datos__usuario();

if(nl.val==1)
{
    if(us.getFoto().equals("Recursos/img/personas/")){
        if(us.getN_sexo().equals("M")){foto=us.getFoto()+"SF-M.jpg";}
        if(us.getN_sexo().equals("F")){foto=us.getFoto()+"SF-F.jpg";}
    }
    else{foto=us.getFoto();}
    
    session.setAttribute("nombre", us.getIdpersona());
    session.setAttribute("rol", us.getRol());
    session.setAttribute("idrol", us.getIdrol());
    session.setAttribute("usuario", us.getUsuario());
    session.setAttribute("idusuario", us.getIdusuario());
    session.setAttribute("foto", foto);
    response.sendRedirect("Inicio.jsp");
}

%>
