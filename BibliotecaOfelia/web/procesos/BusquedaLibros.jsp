<%@ page import="biblioteca.ofelia.procesos.*,biblioteca.ofelia.entidad.*"%>
<%@ page import= "java.util.ArrayList"%> 
<!-- Bootstrap 3.3.6 -->
    <link rel="stylesheet" href="../Recursos/css/bootstrap.min.css">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../Recursos/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="../Recursos/css/ionicons.min.css">
    <!-- Theme style ADMINLTE -->
    <link rel="stylesheet" href="../Recursos/css/AdminLTE.min.css">
    <!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
    <link rel="stylesheet" href="../Recursos/css/skin-blue.min.css">
    <!-- Datatable CSS-->
    <link rel="stylesheet" href="../Recursos/DataTables/media/css/jquery.dataTables.min.css">
    <!-- jQuery Datatable -->
    <script type="text/javascript" language="javascript" src="../Recursos/DataTables/media/js/jquery.js"></script>
    <!-- Datatable -->
    <script type="text/javascript" language="javascript" src="../Recursos/DataTables/media/js/jquery.dataTables.min.js"></script>
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
    <tbody >
<%
    int cont1=0;
    ejemplar ej = new ejemplar();
        n_ejemplar nej = new n_ejemplar();
        nej.setE(ej);
        ArrayList rej = nej.ejemplar_prestamo();
    for (int h = 0; h < rej.size(); h++) {
        ejemplar pej = (ejemplar) rej.get(h);
        cont1++;

%>
<tr role="row" class="odd">
    <td class="sorting_1"><%=pej.getIdejemplar()%></td>
    <td><%= pej.getTitulo()%></td>
    <td><%= pej.getAutor()%></td>
    <td align="center"><%= pej.getEstado_libro()%></td>

    <td>
        <center>
        <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar<%=pej.getIdejemplar()%>"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
        </center>
    </td>
</tr>
<% }%>
   </tbody>
</table>                                     
                                    
        <script>
            $(function () {
                $("#tablaRegPrestamo").DataTable({
                    "language": {
                        "sProcessing": "Procesando...",
                        "sLengthMenu": "Mostrar _MENU_ registros",
                        "sZeroRecords": "No se encontraron resultados",
                        "sEmptyTable": "Ningún dato disponible en esta tabla",
                        "sInfo": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
                        "sInfoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
                        "sInfoFiltered": "(filtrado de un total de _MAX_ registros)",
                        "sInfoPostFix": "",
                        "sSearch": "Buscar:",
                        "sUrl": "",
                        "sInfoThousands": ",",
                        "sLoadingRecords": "Cargando...",
                        "oPaginate": {
                            "sFirst": "Primero",
                            "sLast": "Último",
                            "sNext": "Siguiente",
                            "sPrevious": "Anterior"
                        },
                        "oAria": {
                            "sSortAscending": ": Activar para ordenar la columna de manera ascendente",
                            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
                        }
                    }
                });

            });
        </script>
