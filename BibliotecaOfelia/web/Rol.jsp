
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="include/head.jsp" %>
    <%@include file="include/mensaje.jsp" %>
    <%
    
        rol r = new rol();
        n_rol nr=new n_rol();
        nr.setR(r);
    %>
  
    <style>
    .ions {
        font-size: 30px;
    }
    </style>

    <body class="hold-transition skin-blue sidebar-mini">

       <div class="wrapper">
        <%@include file="include/header.jsp" %>

         <%@include file="include/aside.jsp" %>
         
         <div class="content-wrapper">
                <section class="content-header">
                    <h1 class="epic-nav-item-heading " aria-selected="true">
                        REGISTRO DE ROLES
                        <small>Rol</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="inicio.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Sistema</li>
                        <li class="active">Rol</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">

                        <div class="col-md-12">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#addRol">
                                <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Rol
                            </button>

                            <a href="ListarRol" class="btn btn-primary">
                                <i class="glyphicon glyphicon-refresh"></i> Actualizar</a>
                                &nbsp;&nbsp;&nbsp;
                            <label class="<%=style%>"><%=mensaje%></label>

                            <br><br>
                        </div>

                    </div>

                    

                    <section class="content">
                        <div class="row">
                            <div class="col-md-4 col-md-offset-4">
                                <div class="box collapsed-box">
                                    <div class="box-header with-border">
                                        <center><h3 class="box-title">Registro de Roles</h3></center>
                                        <div class="box-tools pull-right">
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="container-fluid">
                                            <div class="col-lg-12">
                                                <div class="table-responsive">
                                                    <table id="tablaRol" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                        <thead>
                                                            <tr role="row">
                                                            <th><center>N°</center></th>
                                                            <th><center>Rol</center></th>
                                                            <th><center>Acción</center></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                int cont = 0;
                                                                    ArrayList ro= nr.Roles();
                                                                    for(int i=0; i<ro.size(); i++){
                                                                       rol rl=(rol) ro.get(i); 
                                                                       cont++;
                                                            %>
                                                            <tr role="row" class="odd">
                                                                    <td class="sorting_1"><%= cont%></td>
                                                                    <td><%= rl.getRol()%></td>
                                                                                                                                   
                                                                <td>
                                                            <center>
                                                                <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar<%=cont%>"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
                                                                <a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#eliminar<%=cont%>" role="button"><i class="fa fa-trash" aria-hidden="true"></i> </a>
                                                             
                                                                <div class="modal fade modal-banco-first" id="eliminar<%=cont%>">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                                <h4 class="modal-title"><i class="fa fa-trash" aria-hidden="true"></i> Confirmar Eliminación</h4>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <div class="row">

                                                                                    <img src="Recursos/img/Eliminar.png" class="col-md-3">

                                                                                    <div class="col-md-7">
                                                                                        <br>
                                                                                        <p>Esta apunto de borrar un registro, este procedimiento es irreversible.</p>
                                                                                        <p>¿Desea Proceder?</p>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <form  action="ControlRol" method="post">
                                                                                    <input type="hidden" name="op" value="delete_Rol">
                                                                                    <input type="hidden" name="idrol" value="<%=rl.getIdrol()%>">
                                                                                    <button type="submit" class="btn btn-danger danger"><i class="fa fa-trash" aria-hidden="true"></i> Eliminar</button>
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>  
                                                                                </form>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>

                                                            </center>
                                                            </td>
                                                    </tr>
                                                       
                                                        <%}%>
                                                        </tbody>

                                                    </table>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <br>
                                </div>
                            </div>
                        </div>
                    </section>
                </section>
            </div>
                                                        
            <%@include file="include/footer.jsp" %>
            </div>
            
            <!-- Registro Roles-->
        <div class="modal fade" id="addRol" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Agregar Rol</h4>
                    </div>

                    <div class="modal-body">
                       
                        <form action="ControlRol" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="add_Rol">

                            <div class="form-group">
                                <label for="nombreRol" class="col-sm-2 control-label">*Rol: </label>
                                <div class="col-sm-3">
                                    <input name="rol" type="text" autocomplete="off" class="form-control" placeholder="Nombre de Rol" title="Nombre de Rol">
                                </div>
                            </div>
 
                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i> Registrar</button>
                                <a class="btn btn-default" data-dismiss="modal"><i class="fa fa-close" aria-hidden="true"></i> Cerrar</a>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>

<script>
            $(function () {
                $("#tablaRol").DataTable({
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
        <%@include file="include/recursos.jsp" %>
    </body>
</html>