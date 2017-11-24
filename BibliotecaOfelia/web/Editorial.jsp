<%@page import="biblioteca.ofelia.entidad.editorial"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%@include file="include/head.jsp" %>
    <%@include file="include/mensaje.jsp" %>
    <%        String ideditorial = "";
        int cont = 0;
        int cont1 = 0;
        int cont3 = 0;

        editorial edit = new editorial();
        n_editorial ed = new n_editorial();
        ed.setE(edit);

        ubigeo ubi = new ubigeo();
        n_ubigeo nubi = new n_ubigeo();
        n_atributos ubig = new n_atributos();

        //editorial
        String[][] editorial = new String[100][3];
        int contc;
        ArrayList lct = ed.editoriales();
        for (contc = 0; contc < lct.size(); contc++) {
            editorial edito = (editorial) lct.get(contc);
            editorial[contc][1] = edito.getIdeditorial();
            editorial[contc][2] = edito.getNombre();
        }


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
                        MÓDULO EDITORIAL
                        <small>Registrar Editorial</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="inicio.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Mantenimiento</li>
                        <li class="active">Registrar Editorial</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#addEditorial"> <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Editorial </button>
                                <a href="Editorial.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-refresh"></i> Actualizar</a> &nbsp;&nbsp;&nbsp;
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
                                        <h3 class="box-title"> Registro de Editoriales</h3>
                                        <div class="box-tools pull-right"></div>
                                    </div>

                                    <div class="">

                                        <div class="container-fluid">

                                            <div class="col-lg-12">
                                                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                                    <div class="table-responsive">
                                                        <table id="tablaEditorial" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th><center>N°</center></th>
                                                            <th><center>Ubigeo</center></th>
                                                            <th><center>Nombre</center></th>
                                                            <th><center>Acción</center></th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%

                                                                    ArrayList rc = ed.editoriales();
                                                                    for (int i = 0; i < rc.size(); i++) {
                                                                        editorial edi = (editorial) rc.get(i);
                                                                        cont++;

                                                                %>
                                                                <tr role="row" class="odd">
                                                                    <td><%= cont%></td>
                                                                    <td><%= edi.getIdubigeo()%></td>
                                                                    <td><%= edi.getNombre()%></td>
                                                                    </td>
                                                                    <td>


                                                            <center>
                                                                <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar<%=edi.getIdeditorial()%>"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
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
                                                                                <form  action="ControlEditorial" method="post">
                                                                                    <input type="hidden" name="op" value="delete_Editorial">
                                                                                    <input type="hidden" name="ideditorial" value="<%=edi.getIdeditorial()%>">

                                                                                    <button type="submit" class="btn btn-danger danger"><i class="fa fa-trash" aria-hidden="true"></i> Eliminar</button>
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>  
                                                                                </form>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--fin de Modal Eliminar-->


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

        <!-- Registro editorial-->
        <div class="modal fade" id="addEditorial" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Agregar Editorial</h4>
                    </div>
                    <div class="modal-body">
                        <form action="ControlEditorial" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="add_Editorial">
                            <div class="form-group">
                                <label for="nombreEditorial" class="col-sm-2 control-label">*Nombre: </label>
                                <div class="col-sm-5">
                                    <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Nombre del autor" title="Nombre del autor" onkeypress="return validaL(event);">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for=Ubigeo" class="col-sm-2 control-label">*Ubigeo: </label>
                                <div class="col-sm-5">
                                    <select name="idubigeo" id="ubigeo" class="form-control" title="ubigeo">
                                        <option value="" hidden="hidden"<%if (ubi.getIdubigeo()
                                                        == null) {%>selected="selected"<%}%>>Selecione Ubigeo</option>
                                        <%
                                            nubi.setUb(ubi);
                                            ArrayList bc = nubi.Buscar_ubigeo();
                                            for (int x = 0; x < bc.size(); x++) {
                                                ubigeo au = (ubigeo) bc.get(x);
                                        %>
                                        <option value="<%=au.getIdubigeo()%>"<%if (au.getIdubigeo().equals(edit.getIdubigeo())) {%>selected="selected"<%}%>><%=au.getNombre()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
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


        <!--  Modal Actualizar-->
        <%        int cont2 = 0;
            String idedt;
            ArrayList rcs = ed.editoriales_update();
            for (int e = 0; e < rcs.size(); e++) {
                editorial ce2 = (editorial) rcs.get(e);
                idedt = ce2.getIdeditorial();
                cont2++;
        %>
        <div class="modal fade" id="editar<%=idedt%>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header left">
                        <button type="button" class="close" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-android-sync"></i> Actualizar Editorial <%=idedt%></h4>
                    </div>

                    <div class="modal-body">

                        <form action="ControlEditorial" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="update_Editorial">
                            <input type="hidden" name="ideditorial" value="<%=idedt%>">

                            <div class="form-group">
                                <label for="nombreEdiorial" class="col-sm-4 control-label">*Nombre: </label>
                                <div class="col-sm-5">
                                    <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Nombre del autor" title="Nombre del autor" value="<%=ce2.getNombre()%>" onkeypress="return validaL(event);">
                                </div>
                            </div>
                            <p style="color: #ffffff; font-size: 5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>

                            <div class="form-group">

                                <label for="Ubigeo" class="col-sm-4 control-label">*Ubigeo: </label>
                                <div class="col-sm-5">
                                    <select name="idubigeo" id="ubigeo" class="form-control" title="ubigeo">
                                    <option value="" hidden="hidden"<%if (ubi.getIdubigeo()
                                                        == null) {%>selected="selected"<%}%>>Selecione Ubigeo</option>
                                            <%
                                                nubi.setUb(ubi);
                                                for (int x = 0; x < bc.size(); x++) {
                                                    ubigeo au = (ubigeo) bc.get(x);
                                            %>
                                            <option value="<%=au.getIdubigeo()%>"<%if (au.getIdubigeo().equals(ce2.getIdubigeo())) {%>selected="selected"<%}%>><%=au.getNombre()%></option>
                                            <%
                                                }
                                            %>
                                    </select>

                                </div>
                            </div>
                            <p style="color: #ffffff; font-size: 5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary"><i class="ion-android-sync" aria-hidden="true"></i> Actualizar</button>
                                <a class="btn btn-default"  data-dismiss="modal" id="closemodal<%=idedt%>"><i class="fa fa-close" aria-hidden="true"></i> Cerrar</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
       
 <% }%>       


        <script>
            $(function () {
                $("#tablaEditorial").DataTable({
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