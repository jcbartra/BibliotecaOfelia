
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="include/head.jsp" %>
    <%@include file="include/mensaje.jsp" %>
    <%
        int cont = 0;
        ubigeo ub = new ubigeo();
        n_ubigeo nub = new n_ubigeo();
        nub.setUb(ub);
    %>
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">
            <%@include file="include/header.jsp" %>
            <%@include file="include/aside.jsp" %>
            <div class="content-wrapper">
                <section class="content-header">
                    <h1 class="epic-nav-item-heading " aria-selected="true">
                        MÓDULO REGISTRO
                        <small>Registrar Ubigeo</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="inicio.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Registro</li>
                        <li class="active">Registrar Ubigeo</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#addUbigeo">
                                <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Ubigeo</button>
                            <a class="btn btn-primary" href="Ubigeo.jsp"><i class="glyphicon glyphicon-refresh"></i> Actualizar</a>
                        </div>

                    </div>

                    <section class="content">
                        <div class="row">
                            <div class="col-md-8 col-md-offset-2">
                                <div class="box collapsed-box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title">Registro de Ubigeo</h3>
                                        <div class="box-tools pull-right">
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="container-fluid">
                                            <div class="col-lg-12">
                                                <div class="table-responsive">
                                                    <table id="tablaUbigeo" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                        <thead>
                                                            <tr role="row">

                                                                <th> <center>N°</center> </th>                                                
                                                        <th><center>Ubigeo</center></th>
                                                        <th><center>Codigo</center></th>
                                                        <th><center>Departamento</center></th>
                                                        <th><center>Pais</center></th>
                                                        <th><center>Accion</center></th>
                                                        </tr>

                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                    ArrayList rc= nub.Listar_Ubigeo();
                                                                    for(int i=0; i<rc.size(); i++){
                                                                       ubigeo ubi=(ubigeo) rc.get(i); 
                                                                       
                                                                       cont++;
                                                                               
                                                                %>
                                                            <tr role="row" class="odd">
                                                                <td class="sorting_1"><%=cont%></td>
                                                                <td><%= ubi.getNombre()%></td>
                                                                <td><%= ubi.getCod()%></td>
                                                                <td><%= ubi.getIddepartamento()%></td>
                                                                <td><%= ubi.getIdpais()%></td>
                                                                <td>
                                                                <td>
                                                        <center>
                                                            <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#ver<%=cont%>" ><i class="fa fa-pencil" aria-hidden="true"></i> </a>
                                                            <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar<%=cont%>" ><i class="fa fa-pencil" aria-hidden="true"></i> </a>
                                                            <a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#eliminar<%=cont%>" role="button"><i class="fa fa-trash" aria-hidden="true"></i> </a>
                                                            <!---------------------------------------------------------VER PAIS----------------------->
                                                                <div class="modal fade" id="ver<%=cont%>" tabindex="-1" role="dialog">
                                                                    <div class="modal-dialog" role="document">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                                <!---------------------------------MODIFICAR-------------------------------->
                                                                                <h4 class="modal-title"><i class="fa fa-pencil" aria-hidden="true"></i> Ver caracteristicas del pais <%=ubi.getNombre()%></h4>
                                                                            </div>

                                                                            <div class="modal-body">

                                                                                <form action="ControlUbigeo" method="post" class="form-horizontal">
                                                                                    <input type="hidden" name="op" value="update">
                                                                                    <input type="hidden" name="idubigeo" value="<%=ubi.getIdubigeo()%>">
                                                                                                                                                                     
                                                                                    <div class="form-group">
                                                                                        <label for="" class="col-sm-5 control-label ">Ciudades de <%=ubi.getNombre()%></label>
                                                                                        <center> <div class="col-sm-5 ">
                                                                                            <select name="idtipo_incidencia" class="form-control">
                                                                                                <option>Seleccione</option>                                                                                               
                                                                                                <option value="<%=ubi.getIdubigeo()%>"><%= ubi.getNombre()%></option>
                                                                                                
                                                                                            </select>
                                                                                        </div></center>                                                                                        
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
                                                            <!----------------------------------termino---------------------------------> 

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
                                                                                    <p>Esa apunto de borrar un registro, este procedimiento es irreversible.</p>
                                                                                    <p>¿Desea Proceder?</p>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="modal-footer">
                                                                            <form  action="ControlUbigeo" method="post">
                                                                                <input type="hidden" name="op" value="delete">
                                                                                <input type="hidden" name="idubigeo" value="<%=ubi.getIdubigeo()%>">
                                                                                <button type="submit" class="btn btn-danger danger"><i class="fa fa-trash" aria-hidden="true"></i> Eliminar</button>
                                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>  
                                                                            </form>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="modal fade" id="editar<%=cont%>" tabindex="-1" role="dialog">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">

                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                            <h4 class="modal-title"><i class="fa fa-pencil" aria-hidden="true"></i> Actualizar Ubigeo</h4>
                                                                        </div>

                                                                        <div class="modal-body">
                                                                            <form action="ControlUbigeo" method="post" class="form-horizontal">
                                                                                <input type="hidden" name="op" value="update">
                                                                                <input type="hidden" name="idubigeo" value="<%=ubi.getIdubigeo()%>">

                                                                                <div class="form-group">
                                                                                    <label for="ubigeo" class="col-sm-5 control-label">* Nombre:</label>
                                                                                    <div class="col-sm-4">
                                                                                        <input name="ubigeo" type="text" autocomplete="off" class="form-control" value="<%=ubi.getNombre()%>">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="modal-footer">
                                                                                    <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i> Actualizar</button>
                                                                                    <a class="btn btn-default" data-dismiss="modal"><i class="fa fa-close" aria-hidden="true"></i> Cerrar</a>
                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </center>
                                                        </td>

                                                        </tr>  
                                                        <% }%>
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
            <div class="modal fade" id="addUbigeo" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><i class="fa fa-plus-circle" aria-hidden="true"></i> Agregar Ubigeo</h4>
                        </div>

                        <div class="modal-body">
                            <form action="ControlUbigeo" method="post" class="form-horizontal">
                                <input type="hidden" name="op" value="add">
                                <div class="form-group">
                                    <label for="ubigeo" class="col-sm-2 control-label">*Nombre:</label>
                                    <div class="col-sm-4">
                                        <input name="ubigeo" type="text" autocomplete="off" class="form-control" placeholder="Nombre del Ubigeo">
                                    </div>
                                    <label for="ubigeo" class="col-sm-2 control-label">*Codigo:</label>
                                    <div class="col-sm-4">
                                        <input name="ubigeo" type="text" autocomplete="off" class="form-control" placeholder="Ingrese Codigo">
                                    </div>
                                </div>
                                <div class="form-group">
                                <label for="ubigeo" class="col-sm-2 control-label">*Departamento:</label>
                                    <div class="col-sm-4">
                                        <input name="ubigeo" type="text" autocomplete="off" class="form-control" placeholder="Seleccione Departamento">
                                    </div>
                                <label for="ubigeo" class="col-sm-2 control-label">*Pais:</label>
                                    <div class="col-sm-4">
                                        <input name="ubigeo" type="text" autocomplete="off" class="form-control" placeholder="Seleccione Pais">
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
            <%@include file="include/footer.jsp" %>                                 
        </div>



        <script>
            $(function () {
                $("#tablaUbigeo").DataTable({
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

