<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//jsp:useBean id="ListarCategorias" scope="request" type="java.util.List<VistaCategorias>"/%>

<!DOCTYPE html>
<html>
    <%@include file="include/head.jsp" %>
    <%
        categoria c=new categoria();
        n_categoria nc=new n_categoria();
        nc.setC(c);
        
        subcategoria sc=new subcategoria();
        n_subcategoria nsc=new n_subcategoria();
        nsc.setSc(sc);
    %>

    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <%@include file="include/header.jsp" %>

            <%@include file="include/aside.jsp" %>


            <div class="content-wrapper">
                <section class="content-header">
                    <h1 class="epic-nav-item-heading " aria-selected="true">
                        MÓDULO CATEGORIA
                        <small>Registrar Categoria</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="inicio.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Mantenimiento</li>
                        <li class="active">Registrar Categoria</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">

                        <div class="col-md-12">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#addCategoria">
                                <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Categoria
                            </button>
                            <button class="btn btn-primary" data-toggle="modal" data-target="#addSubCategoria">
                                <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Sub Categoria
                            </button>
                            <a href="ListarCategoria" class="btn btn-primary">
                                <i class="glyphicon glyphicon-refresh"></i> Actualizar</a>

                            <br><br>
                        </div>

                    </div>

                    <section class="content">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box collapsed-box">
                                    <div class="box-header with-border">
                                        <h3 class="box-title"> Registro de Categorias</h3>
                                        <div class="box-tools pull-right"></div>
                                    </div>

                                    <div class="">

                                        <div class="container-fluid">

                                            <div class="col-lg-12">
                                                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                                    <div class="table-responsive">
                                                        <table id="tablaCategoria" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th><center>N°</center></th>
                                                            <th><center>Nro°</center></th>
                                                            <th><center>Nombre</center></th>
                                                            <th><center>Descripcion</center></th>
                                                            <th><center>Sub Cat.</center></th>
                                                            <th><center>Acción</center></th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%
                                                                    int cont = 0;
                                                                    ArrayList rc= nc.Categorias_Generales();
                                                                    for(int i=0; i<rc.size(); i++){
                                                                       categoria ct=(categoria) rc.get(i); 
                                                                       cont++;
                                                                               
                                                                %>
                                                                <tr role="row" class="odd">
                                                                    <td class="sorting_1"><%= cont%></td>
                                                                    <td><%= ct.getNroini()%></td>
                                                                    <td><%= ct.getNombre()%></td>
                                                                    <td><%= ct.getDescripcion()%></td>
                                                                    <td align="center"><a class="btn btn-default btn-xs" data-toggle="modal" data-target="#ver<%=ct.getNroini()%>"><i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i> </a>
                                                                </td>
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
                                                                                <form  action="ControlCategoria" method="post">
                                                                                    <input type="hidden" name="op" value="delete_Categoria">
                                                                                    <input type="hidden" name="idcategoria" value="<%=ct.getIdcategoria()%>">
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
        <!-- Registro Categoría-->
        <div class="modal fade" id="addCategoria" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Agregar Categoria</h4>
                    </div>

                    <div class="modal-body">

                        <form action="ControlCategoria" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="add_Categoria">

                            <div class="form-group">
                                <label for="numeroCategoria" class="col-sm-2 control-label">*Número: </label>
                                <div class="col-sm-3">
                                    <input name="nro" type="text" autocomplete="off" class="form-control" placeholder="Numero de la Categoria" title="Numero de Categoria">
                                </div>

                                <label for="nombreCategoria" class="col-sm-2 control-label">*Nombre: </label>
                                <div class="col-sm-5">
                                    <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Nombre de la Categoria" title="Nombre de la Categoria">
                                </div>
                            </div>

                            <div class="form-group">

                                <label for="descripcionCategoria" class="col-sm-2 control-label">*Descripcion: </label>
                                <div class="col-sm-9">
                                    <input name="descripcion" type="text" autocomplete="off" class="form-control" placeholder="Descripcion de la Categoria" title="Descripcion de la Categoria">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="CategoriaSuperior" class="col-sm-2 control-label">*Categoria Superior: </label>
                                <div class="col-sm-5">
                                    <select name="idcategoria" class="form-control" title="Categoria Superior">
                                        <option value="0">Selecione su Color</option>
                                        <option value="red">RED</option>
                                        <option value="blue">BLUE</option>
                                        <option value="green">GREEN</option>
                                    </select>
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
        <!-- Registro Sub Cateroria-->
        <div class="modal fade" id="addSubCategoria" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Agregar Sub Categoria</h4>
                    </div>

                    <div class="modal-body">

                        <form action="ControlSubCategoria" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="add_SubCategoria">

                            <div class="form-group">
                                <label for="numeroSubCategoria" class="col-sm-2 control-label">*Número: </label>
                                <div class="col-sm-3">
                                    <input name="nro" type="text" autocomplete="off" class="form-control" placeholder="Numero de la Categoria" title="Numero de Sub Categoria">
                                </div>

                                <label for="nombreSubCategoria" class="col-sm-2 control-label">*Nombre: </label>
                                <div class="col-sm-5">
                                    <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Nombre de la Categoria" title="Nombre de la Sub Categoria">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="CategoriaSuperior" class="col-sm-2 control-label">*Categoria Superior: </label>
                                <div class="col-sm-8">
                                    <select name="idcategoria" class="form-control" title="Categoria Superior">
                                        <option value="0">Selecione su la Categoria</option>
                                        <% for(int i=0; i<rc.size(); i++){
                                           categoria ct=(categoria) rc.get(i);
                                        %>
                                        <option value="<%=ct.getIdcategoria()%>"><%=ct.getNombre()%>
                                        </option>
                                        <%}%>

                                    </select>
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
        <!-- ver Sub Cateroria-->
        <%
            int cont1 = 0;
            String nroc,cat;
            for(int e=0; e<rc.size(); e++){
                categoria ct=(categoria) rc.get(e); 
                nroc=ct.getNroini();
                cat=ct.getIdcategoria();
               cont1++;
               
                %>
        <div class="modal fade" id="ver<%=nroc%>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="glyphicon glyphicon-eye-open"></i> Ver Sub Categoria</h4>
                    </div>
                        <div class="modal-body">
                            <section class="content">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box collapsed-box">

                                    <div class="">

                                        <div class="container-fluid">

                                            <div class="col-lg-12">
                                                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                                    <div class="table-responsive">
                                                        <table id="tablaSubCategoria<%=nroc%>" name="tablaSubCategoria" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th><center>N°</center></th>
                                                            <th><center>Nro°</center></th>
                                                            <th><center>Nombre</center></th>
                                                            <th><center>Categoría Superior</center></th>
                                                            <th><center>Acción</center></th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                               
                                                                <%
                                                                    int cont2 = 0;
                                                                    ArrayList rsc= nsc.Subcategorias_Especifica(cat);
                                                                    for(int j=0; j<rsc.size(); j++){
                                                                       subcategoria sct=(subcategoria) rsc.get(j); 
                                                                       cont2++;
                                                                               
                                                                %>
                                                                <tr role="row" class="odd" align="center">
                                                                    <td class="sorting_1"><%= cont2%></td>
                                                                    <td><%= sct.getNro()%></td>
                                                                    <td><%= sct.getNombre()%></td>
                                                                    <td><%= sct.getIdcategoria()%></td>
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
                                                                                <form  action="ControlCategoria" method="post">
                                                                                    <input type="hidden" name="op" value="delete_Categoria">
                                                                                    <input type="hidden" name="idcategoria" value="<%=sct.getIdsubcategoria()%>">
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
                        </div>
                    </div>
            </div>
        </div>
        <script>
            $(function () {
                $("#tablaSubCategoria<%=nroc%>").DataTable({
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
        <%}%>
        
                              
        <%/*
            int contador2 = 0;
            for (VistaCategorias a : ListarCategorias) {
                contador2++;
        %/>
        <div class="modal fade" id="editar<%=contador2%/>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Actualizar Categoria</h4>
                    </div>

                    <div class="modal-body">

                        <form action="ControlCategoria" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="update_Categoria">
                            <input type="hidden" name="idcategoria" value="<%= a.getIdcategoria_v()%/>">

                            <div class="form-group">
                                <label for="numeroCategoria" class="col-sm-2 control-label">*Número: </label>
                                <div class="col-sm-3">
                                    <input name="nro" type="text" autocomplete="off" class="form-control" value="<%= a.getNro_v()%/>">
                                </div>

                                <label for="nombreCategoria" class="col-sm-2 control-label">*Nombre: </label>
                                <div class="col-sm-5">
                                    <input name="nombre" type="text" autocomplete="off" class="form-control" value="<%= a.getNombre_v()%/>">
                                </div>
                            </div>

                            <div class="form-group">

                                <label for="descripcionCategoria" class="col-sm-2 control-label">*Descripcion: </label>
                                <div class="col-sm-9">
                                    <input name="descripcion" type="text" autocomplete="off" class="form-control" value="<%= a.getDescripcion_v()%/>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="CategoriaSuperior" class="col-sm-2 control-label">*Categoria Superior: </label>
                                <div class="col-sm-8">
                                    <select name="idcategoria_sup" class="form-control" value="<%//=a.getCat_sup_v()%/>">
                                        <% for(int i=0; i<rc.size(); i++){
                                           categoria ct=(categoria) rc.get(i);
                                        %/>
                                        <option value="<%=ct.getIdcategoria()%/>"><%=ct.getNombre()%/>
                                        </option>
                                        <%}%/>
                                    </select>
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
        <% }*/%>
        
        <script>
            $(function () {
                $("#tablaCategoria").DataTable({
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
