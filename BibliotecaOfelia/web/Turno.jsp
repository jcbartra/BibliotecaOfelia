<%-- 
    Document   : Turno
    Created on : 13/11/2017, 11:27:48 PM
    Author     : GADEA-JADE
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <%@include file="include/head.jsp" %>
    <%@include file="include/mensaje.jsp" %>
    <%        String idturno = "";
        int cont = 0;
        int cont1 = 0;
        int cont3 = 0;

        turno t = new turno();
        n_turnos nt = new n_turnos();
        nt.setT(t);
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
                        MÓDULO TURNO
                        <small>Registrar Turno</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="inicio.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Mantenimiento</li>
                        <li class="active">Registrar Turno</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#addTurno"> <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Turno </button>
                                <a href="Turno.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-refresh"></i> Actualizar</a> &nbsp;&nbsp;&nbsp;
                                <label class="<%=style%>"><%=mensaje%></label>
                                <br>
                                <br>
                            </div>
                        </div>
                    </div>

                    <section class="content">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box collapsed-box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title"> Registro de Turno</h3>
                                        <div class="box-tools pull-right"></div>
                                    </div>

                                    <div class="">

                                        <div class="container-fluid">

                                            <div class="col-lg-12">
                                                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                                    <div class="table-responsive">
                                                        <table id="tablaTurno" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th><center>N°</center></th>
                                                            <th><center>Turno</center></th>
                                                            <th><center>Acción</center></th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%
                                                                    ArrayList rc = nt.turnos();
                                                                    for (int i = 0; i < rc.size(); i++) {
                                                                        turno tur = (turno) rc.get(i);
                                                                        cont++;

                                                                %>
                                                                <tr role="row" class="odd">
                                                                    <td><%= cont%></td>
                                                                    <td><%= tur.getTurno()%></td>

                                                                    <td>
                                                            <center>
                                                                <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar2<%=tur.getIdturno()%>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                                                <a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#eliminar<%=cont%>" role="button"><i class="fa fa-trash" aria-hidden="true"></i> </a>
                                                                <!--Modal Eliminar-->
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
                                                                                <form  action="ControlTurno" method="post">
                                                                                    <input type="hidden" name="op" value="delete_Turno">
                                                                                    <input type="hidden" name="idturno" value="<%=tur.getIdturno()%>">
                                                                                    <button type="submit" class="btn btn-danger danger"><i class="fa fa-trash" aria-hidden="true"></i> Eliminar</button>
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>  
                                                                                </form>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--fin de Modal Eliminar-->

                                                                <!--  Modal Actualizar-->

                                                                <div class="modal fade" id="editar2<%=tur.getIdturno()%>" tabindex="-1" role="dialog">
                                                                    <div class="modal-dialog" role="document">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header left">
                                                                                <button type="button" class="close" id="close2" aria-hidden="true">&times;</button>
                                                                                <h4 class="modal-title"><i class="ion-android-sync"></i> Actualizar Turno <%=tur.getIdturno()%></h4>
                                                                            </div>

                                                                            <div class="modal-body">

                                                                                <form action="ControlTurno" method="post" class="form-horizontal">
                                                                                    <input type="hidden" name="op" value="update_Turno">
                                                                                    <input type="hidden" name="idturno" value="<%=tur.getIdturno()%>">
                                                                                    <div class="form-group col-md-12">       
                                                                                        <label for="Turno" class="col-sm-2 control-label">*Nombre: </label>
                                                                                        <div class="col-sm-5">
                                                                                            <input name="turno" type="text" autocomplete="off" class="form-control" placeholder="Turno" title="Turno" value="<%=tur.getTurno()%>" onkeypress="return validaL(event);">
                                                                                        </div>
                                                                                    </div>

                                                                                    <p style="color: #ffffff; font-size: 5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>

                                                                                    <div class="modal-footer">
                                                                                        <button type="submit" class="btn btn-primary"><i class="ion-android-sync" aria-hidden="true"></i> Actualizar</button>
                                                                                        <a class="btn btn-default" id="closemodal2" data-dismiss="modal" ><i class="fa fa-close" aria-hidden="true"></i> Cerrar</a>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <script type="text/javascript">
                                                                    $('#close2').click(function () {
                                                                        $('#editar2<%=tur.getIdturno()%>').modal('hide');
                                                                    });
                                                                    $('#closemodal2').click(function () {
                                                                        $('#editar2<%=tur.getIdturno()%>').modal('hide');
                                                                    });
                                                                </script>    
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

        <!-- Registro Turno-->
        <div class="modal fade" id="addTurno" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Agregar Turno</h4>
                    </div>

                    <div class="modal-body">

                        <form action="ControlTurno" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="add_Turno">

                            <div class="form-group">

                                <label for="turnoTurno" class="col-sm-2 control-label">*Turno: </label>
                                <div class="col-sm-5">
                                    <input name="turno" type="text" autocomplete="off" class="form-control" placeholder="Turno" title="Turno" onkeypress="return validaL(event);">
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i> Registrar</button>
                                <a class="btn btn-default"  data-dismiss="modal"><i class="fa fa-close" aria-hidden="true"></i> Cerrar</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script>
            $(function () {
                $("#tablaTurno").DataTable({
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
