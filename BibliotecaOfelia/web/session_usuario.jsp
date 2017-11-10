<%@ page import="biblioteca.ofelia.procesos.n_login,biblioteca.ofelia.entidad.usuario"%>
<%

String usuario=(String)request.getParameter("usuario");

usuario us=new usuario();
n_login nl=new n_login();

nl.setUs(us);

us.setUsuario(usuario);

nl.Buscar_datos__usuario();

if(nl.val==1)
{
    session.setAttribute("nombre", us.getIdpersona());
    session.setAttribute("rol", us.getRol());
    session.setAttribute("idrol", us.getIdrol());
    session.setAttribute("usuario", us.getUsuario());
    session.setAttribute("idusuario", us.getIdusuario());
    session.setAttribute("foto", us.getFoto());
    response.sendRedirect("Inicio.jsp");
}

%>
