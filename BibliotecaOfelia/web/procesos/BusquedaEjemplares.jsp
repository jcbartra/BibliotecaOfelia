<%@ page import="biblioteca.ofelia.procesos.*,biblioteca.ofelia.entidad.*"%>
<%@ page import= "java.util.ArrayList"%> 

<table id="tablaRegPrestamo" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
    <thead>
        <tr role="row">
            <th><center>N°</center></th>
<th><center>Ejemplar</center></th>
<th><center>Autor</center></th>
<th><center>Estado</center></th>
<th><center>Acción</center></th>
</tr>
</thead>

<tbody>

    <%
        String tit = (String) request.getParameter("tit");
        if (tit == null) {
            tit = "%";
        }
        String idusuario = (String) session.getAttribute("idusuario");
        if (idusuario == null) {
            idusuario = "";
        }
        int cont1 = 0;
        ejemplar ej = new ejemplar();
        n_ejemplar nej = new n_ejemplar();

        ej.setTitulo(tit.toUpperCase());

        nej.setE(ej);

        ArrayList rej = nej.ejemplar_prestamo_titulo();
        for (int h = 0; h < rej.size(); h++) {
            ejemplar pej = (ejemplar) rej.get(h);
            cont1++;

    %>
<td><%=pej.getIdejemplar()%></td>
<td><%= pej.getTitulo()%></td>
<td><%= pej.getAutor()%></td>
<td align="center"><%= pej.getEstado_libro()%></td>

<td>
<center>
    <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#addPrestamoPersona" onclick="MostrarP(<%=pej.getIdejemplar()%>);"><i class="fa fa-book" aria-hidden="true"></i> </a>
</center>
</td>
</tr>
<%}%>
</tbody>
</table>