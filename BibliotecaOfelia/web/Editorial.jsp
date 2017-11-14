<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="include/head.jsp" %>
    <%@include file="include/mensaje.jsp" %>
    <%
        String idcategoria="";
        int cont = 0;
        int cont1 = 0;
        int cont3 = 0;
        
        categoria c=new categoria();
        n_categoria nc=new n_categoria();
        nc.setC(c);
        
        subcategoria sc=new subcategoria();
        n_subcategoria nsc=new n_subcategoria();
        nsc.setSc(sc);
        
        color cl=new color();
        n_atributos na=new n_atributos();
        na.setCl(cl);
        
        icono ic=new icono();
        na.setIc(ic);
        
        //colores
        String[] color=new String[100];
        int contc;
        ArrayList lc=na.Listar_Colores();
        for(contc=0; contc<lc.size(); contc++){
        color clrs=(color) lc.get(contc); 
        color[contc]=clrs.getColor();
        }
        //iconos
        String[] icono=new String[100];
        int conti;
        ArrayList li=na.Listar_Iconos();
        for(conti=0; conti<li.size(); conti++){
        icono icon=(icono) li.get(conti);
        icono[conti]=icon.getIcono();
        }
        //categorias
        String[][] categoria=new String[100][3];
        int contct;
        ArrayList lct=nc.Categorias_Generales();
        for(contct=0;contct<lct.size();contct++){
        categoria cat=(categoria) lct.get(contct);
        categoria[contct][1]=cat.getIdcategoria();
        categoria[contct][2]=cat.getNombre();
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
                        MÓDULO CATEGORIA
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="Inicio.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Mantenimiento</li>
                        <li class="active">Registrar Categoria</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="col-md-12">
                          <button class="btn btn-primary" data-toggle="modal" data-target="#addCategoria"> <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Categoria </button>
                          <button class="btn btn-primary" data-toggle="modal" data-target="#addSubCategoria"> <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Sub Categoria </button>
                          <a href="Categoria.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-refresh"></i> Actualizar</a> &nbsp;&nbsp;&nbsp;
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
                                                                <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar<%=ct.getIdcategoria()%>"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
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
                                    <input name="nro" type="text" autocomplete="off" class="form-control" placeholder="Numero de la Categoria" title="Numero de Categoria" onkeypress="return validaN(event);">
                                </div>

                                <label for="nombreCategoria" class="col-sm-2 control-label">*Nombre: </label>
                                <div class="col-sm-5">
                                    <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Nombre de la Categoria" title="Nombre de la Categoria" onkeypress="return validaL(event);">
                                </div>
                            </div>

                            <div class="form-group">

                                <label for="descripcionCategoria" class="col-sm-2 control-label">*Descripcion: </label>
                                <div class="col-sm-9">
                                    <textarea name="descripcion" type="text" autocomplete="off" class="form-control" placeholder="Descripcion de la Categoria" title="Descripcion de la Categoria" onkeypress="return validaD(event);"></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Color" class="col-sm-2 control-label">*Color: </label>
                                <div class="col-sm-5">
                                    <select name="colores" id="colores" class="form-control" onchange="cambiar_color()" title="Color">
                                        <option value="">Selecione su Color</option>
                                        <%
                                            for(int l=0; l<contc; l++){
                                            
                                        %>
                                        <option value="<%=color[l]%>"><%=color[l]%></option>
                                        <%}%>
                                    </select>
                                    
                                    </div>
                                <div class="col-sm-2">
                                    <div class="btn small-box bg- btn-xs" id="colorBox" data-toggle="modal">&nbsp;<br/>&nbsp;</div>
                                </div>
                            </div>
                                    
                            <div class="form-group">
                                <label for="Icono" class="col-sm-2 control-label">*Icono: </label>
                                <div class="col-sm-5">
                                    <select name="iconos" id="iconos" class="form-control" onchange="cambiar_icono()" title="Icono">
                                        <option value="">Selecione su Icono</option>
                                        <%
                                          for(int o=0; o<conti; o++){
                                            %>
                                        <option value="<%=icono[o]%>"><%=icono[o]%></option>
                                        <%}%>
                                    </select>
                                    </div>
                                <div class="col-sm-2">
                                    <span class="" id="iconoBox" with="20px"></span>
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
                                    <input name="nro" type="text" autocomplete="off" class="form-control" placeholder="Numero de la Categoria" title="Numero de Sub Categoria" onkeypress="return validan(event);">
                                </div>

                                <label for="nombreSubCategoria" class="col-sm-2 control-label">*Nombre: </label>
                                <div class="col-sm-5">
                                    <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Nombre de la Categoria" title="Nombre de la Sub Categoria" onkeypress="return validaL(event);">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="CategoriaSuperior" class="col-sm-2 control-label">*Categoria Superior: </label>
                                <div class="col-sm-8">
                                    <select name="idcategoria" class="form-control" title="Categoria Superior">
                                        <option value="0">Selecione su la Categoria</option>
                                        <% for(int i=0; i<contct; i++){
                                        %>
                                        <option value="<%=categoria[i][1]%>"><%=categoria[i][2]%>
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
                                                                <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar2<%=sct.getIdsubcategoria()%>"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
                                                                <a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#eliminar2<%=sct.getIdsubcategoria()%>" role="button"><i class="fa fa-trash" aria-hidden="true"></i> </a>
                                                                
                                                                <!-- Eliminar Sub Cateroria-->
                                                                <div class="modal fade modal-banco-first" id="eliminar2<%=sct.getIdsubcategoria()%>">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" id="close1<%=sct.getIdsubcategoria()%>" aria-hidden="true">&times;</button>
                                                                                <h4 class="modal-title"><i class="fa fa-trash" aria-hidden="true"></i> Confirmar Eliminación Sub Categoría</h4>
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
                                                                                <form  action="ControlSubCategoria" method="post">
                                                                                    <input type="hidden" name="op" value="delete_SubCategoria">
                                                                                    <input type="hidden" name="idsubcategoria" value="<%= sct.getIdsubcategoria()%>">
                                                                                    <button type="submit" class="btn btn-danger danger"><i class="fa fa-trash" aria-hidden="true"></i> Eliminar</button>
                                                                                    <button type="button" class="btn btn-default" id="closemodal1<%=sct.getIdsubcategoria()%>">Cancelar</button>  
                                                                                </form>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <script type="text/javascript">
                                                                    $('#close1<%=sct.getIdsubcategoria()%>').click(function() {
                                                                    $('#eliminar2<%=sct.getIdsubcategoria()%>').modal('hide');
                                                                });
                                                                    $('#closemodal1<%=sct.getIdsubcategoria()%>').click(function() {
                                                                    $('#eliminar2<%=sct.getIdsubcategoria()%>').modal('hide');
                                                                });
                                                                </script>                    
                                                                
                                                                <!-- Actualizar Sub Cateroria-->
                                                                <div class="modal fade" id="editar2<%=sct.getIdsubcategoria()%>" tabindex="-1" role="dialog">
                                                                    <div class="modal-dialog" role="document">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header left">
                                                                                <button type="button" class="close" id="close2<%=sct.getIdsubcategoria()%>" aria-hidden="true">&times;</button>
                                                                                <h4 class="modal-title"><i class="ion-android-sync"></i> Actualizar Sub Categoria <%=sct.getIdsubcategoria()%></h4>
                                                                            </div>

                                                                            <div class="modal-body">

                                                                                <form action="ControlSubCategoria" method="post" class="form-horizontal">
                                                                                    <input type="hidden" name="op" value="update_SubCategoria">
                                                                                    <input type="hidden" name="idsubcategoria" value="<%=sct.getIdsubcategoria()%>">
                                                                                    <div class="form-group col-md-12">
                                                                                        <label for="numeroSubCategoria" class="col-sm-4 control-label">*Número: </label>
                                                                                        <div class="col-sm-8">
                                                                                            <input name="nro" type="text" autocomplete="off" class="form-control" placeholder="Numero de la Categoria" title="Numero de Sub Categoria" value="<%= sct.getNro()%>" onkeypress="return validaN(event);">
                                                                                        </div>
                                                                                    </div>
                                                                                    <p style="color: #ffffff; font-size: 5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                                                                    <div class="form-group col-md-12">
                                                                                        <label for="nombreSubCategoria" class="col-sm-4 control-label">*Nombre: </label>
                                                                                        <div class="col-sm-8">
                                                                                            <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Nombre de la Categoria" title="Nombre de la Sub Categoria" value="<%= sct.getNombre()%>" onkeypress="return validaL(event);">
                                                                                        </div>
                                                                                    </div>
                                                                                    <p style="color: #ffffff; font-size: 5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                                                                    <div class="form-group col-md-12">
                                                                                        <label for="CategoriaSuperior" class="col-sm-4 control-label">*Categoria Superior: </label>
                                                                                        <div class="col-sm-8">
                                                                                            <select name="idcategoria" autocomplete="off" class="form-control" title="Categoria Superior">
                                                                                                <option value="0">Selecione su la Categoria</option>
                                                                                                <% for(int i=0; i<contct; i++){
                                                                                                %>
                                                                                                <option value="<%=categoria[i][1]%>" <%if(sct.getIdcategoria().equals(categoria[i][2])){%> selected <%}%>><%=categoria[i][2]%>
                                                                                                </option>
                                                                                                <%}%>

                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                    <p style="color: #ffffff; font-size: 5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
                                                                                    <div class="modal-footer">
                                                                                        
                                                                                        <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i> Actualizar</button>
                                                                                        <a class="btn btn-default" id="closemodal2<%=sct.getIdsubcategoria()%>"><i class="fa fa-close" aria-hidden="true"></i> Cerrar</a>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <script type="text/javascript">
                                                                    $('#close2<%=sct.getIdsubcategoria()%>').click(function() {
                                                                    $('#editar2<%=sct.getIdsubcategoria()%>').modal('hide');
                                                                });
                                                                    $('#closemodal2<%=sct.getIdsubcategoria()%>').click(function() {
                                                                    $('#editar2<%=sct.getIdsubcategoria()%>').modal('hide');
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
        
        <!-- Actualizar Categoría-->
        <%
            for(int d=0; d<rc.size(); d++){
                categoria ct=(categoria) rc.get(d); 
                idcategoria=ct.getIdcategoria();
                cont3++;
                
        %>
        <div class="modal fade" id="editar<%=idcategoria%>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Actualizar Categoria</h4>
                    </div>
                    <div class="modal-body">

                        <form action="ControlCategoria" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="update_Categoria">
                            <input type="hidden" name="idcategoria" value="<%=idcategoria%>">

                            <div class="form-group">
                                <label for="numeroCategoria" class="col-sm-2 control-label">*Número: </label>
                                <div class="col-sm-3">
                                    <input name="nro" type="text" autocomplete="off" class="form-control" placeholder="Numero de la Categoria" title="Numero de Categoria" value="<%=ct.getNroini()%>" onkeypress="return validaN(event);">
                                </div>

                                <label for="nombreCategoria" class="col-sm-2 control-label">*Nombre: </label>
                                <div class="col-sm-5">
                                    <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Nombre de la Categoria" title="Nombre de la Categoria" value="<%=ct.getNombre()%>" onkeypress="return validaL(event);">
                                </div>
                            </div>

                            <div class="form-group">

                                <label for="descripcionCategoria" class="col-sm-2 control-label">*Descripcion: </label>
                                <div class="col-sm-9">
                                    <textarea name="descripcion" type="text" autocomplete="off" class="form-control" placeholder="Descripcion de la Categoria" title="Descripcion de la Categoria" onkeypress="return validaD(event);"><%=ct.getDescripcion()%></textarea>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Color" class="col-sm-2 control-label">*Color: </label>
                                <div class="col-sm-5">
                                    <select name="colores" id="colores<%=cont3%>" class="form-control" onchange="cambiar_color<%=cont3%>()" title="Color">
                                        <option value="">Selecione su Color</option>
                                        <%
                                            for(int s=0; s<contc; s++){
                                        %>
                                        <option value="<%=color[s]%>" <%if(ct.getColor().toUpperCase().equals(color[s])){%> selected <%}%>><%=color[s]%></option>
                                        <%}%>
                                    </select>
                                    
                                    </div>
                                <div class="col-sm-2">
                                    <span class="btn small-box bg-<%=ct.getColor()%> btn-xs" id="colorBox<%=cont3%>" data-toggle="modal">&nbsp;<br/>&nbsp;</span>
                                </div>
                            </div>
                                    
                            <div class="form-group">
                                <label for="Icono" class="col-sm-2 control-label">*Icono: </label>
                                <div class="col-sm-5">
                                    <select name="iconos" id="iconos<%=cont3%>" class="form-control" onchange="cambiar_icono<%=cont3%>()" title="Icono">
                                        <option value="">Selecione su Icono</option>
                                        <%
                                          for(int b=0; b<conti; b++){
                                            %>
                                        <option value="<%=icono[b]%>" <%if(ct.getIcono().toUpperCase().equals(icono[b])){%> selected <%}%>><%=icono[b]%></option>
                                        <%}%>
                                    </select>
                                    </div>
                                <div class="col-sm-2">
                                    <span class="ions <%=ct.getIcono()%>" id="iconoBox<%=cont3%>" with="20px"></span>
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
        <%}%>

        
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
        <script>
            function cambiar_color()
            {
                var color = document.getElementById("colores").value;
                color=color.toLowerCase();
                var cadena="btn small-box bg-"+color+" btn-xs";
                //alert(cadena);
                document.getElementById("colorBox").className = cadena;
            };
            function cambiar_icono()
            {
                var icono = document.getElementById("iconos").value;
                icono=icono.toLowerCase();
                var cadena="ions "+icono;
                //alert(cadena);
                document.getElementById("iconoBox").className = cadena;
            };
            <%for(int q=1;q<=cont3;q++){%>
            function cambiar_color<%=q%>()
            {
                var color;
                color = document.getElementById("colores<%=q%>").value;
                color=color.toLowerCase();
                var cadena="btn small-box bg-"+color+" btn-xs";
                //alert(cadena);
                document.getElementById("colorBox<%=q%>").className = cadena;
            };
            <%}%>
            <%for(int p=1;p<=cont3;p++){%>
            function cambiar_icono<%=p%>()
            {
                var icono = document.getElementById("iconos<%=p%>").value;
                icono=icono.toLowerCase();
                var cadena="ions "+icono;
                //alert(cadena);
                document.getElementById("iconoBox<%=p%>").className= cadena;
            };
            <%}%>
        </script>
        <%@include file="include/recursos.jsp" %>
    </body>
</html>
