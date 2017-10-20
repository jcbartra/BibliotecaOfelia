<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="include/head.jsp" %>
    <%@include file="include/mensaje.jsp" %>
    <%
        String idmenu="";
        String idsubmenu="";
        int cont = 0;
        int cont1 = 0;
        int cont2 = 0;
        int cont3 = 0;
        
        menu mu=new menu();
        n_menu nmnu=new n_menu();
        nmnu.setM(mu);
        
        submenu smnu=new submenu();
        n_submenu nsmnu=new n_submenu();
        nsmnu.setSm(smnu);
        
        icono ic=new icono();
        n_atributos na=new n_atributos();
        na.setIc(ic);
        
        //iconos
        String[] icono=new String[100];
        int conti;
        ArrayList li=na.Listar_Iconos();
        for(conti=0; conti<li.size(); conti++){
        icono icon=(icono) li.get(conti);
        icono[conti]=icon.getIcono();
        }
        //menu
        String[][] menu=new String[100][3];
        int contm;
        ArrayList lmnu=nmnu.Menu_General();
        for(contm=0;contm<lmnu.size();contm++){
        menu men=(menu) lmnu.get(contm);
        menu[contm][1]=men.getIdmenu();
        menu[contm][2]=men.getNombre();
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
                        MÓDULO MENU
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="Inicio.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Sistema</li>
                        <li class="active">Menu</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="col-md-12">
                          <button class="btn btn-primary" data-toggle="modal" data-target="#addMenu"> <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Menu </button>
                          <button class="btn btn-primary" data-toggle="modal" data-target="#addSubMenu"> <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Sub Menu </button>
                          <a href="Menu.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-refresh"></i> Actualizar</a> &nbsp;&nbsp;&nbsp;
                          <label class="<%=style%>"><%=mensaje%></label>
                          <br>
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
                                        <h3 class="box-title"> Registro de Menu</h3>
                                        <div class="box-tools pull-right"></div>
                                    </div>

                                    <div class="">

                                        <div class="container-fluid">

                                            <div class="col-lg-12">
                                                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                                    <div class="table-responsive">
                                                        <table id="tablaMenu" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th><center>N°</center></th>
                                                            <th><center>Nombre</center></th>
                                                            <th><center>Link</center></th>
                                                            <th><center>Sub Menu.</center></th>
                                                            <th><center>Acción</center></th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%
                                                                    
                                                                    for(int s=0;s<lmnu.size();s++){
                                                                    menu men=(menu) lmnu.get(s); 
                                                                    cont++;
                                                                               
                                                                %>
                                                                <tr role="row" class="odd">
                                                                    <td class="sorting_1"><%= cont%></td>
                                                                    <td><%= men.getNombre()%></td>
                                                                    <td><%= men.getLink()%></td>
                                                                    <td align="center">
                                                                        <%if(!men.getEstado().equals("2")){%>
                                                                        <a class="btn btn-default btn-xs" data-toggle="modal" data-target="#ver<%=men.getIdmenu()%>"><i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i> </a>
                                                                        <%}%>
                                                                </td>
                                                                    <td>
                                                            <center>
                                                                <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar<%=men.getIdmenu()%>"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
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
                                                                                <form  action="ControlMenu" method="get">
                                                                                    <input type="hidden" name="op" value="delete_Menu">
                                                                                    <input type="hidden" name="idmenu" value="<%=men.getIdmenu()%>">
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
        
        
        <!-- Registro Menu-->
        <div class="modal fade" id="addMenu" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Agregar Menu</h4>
                    </div>

                    <div class="modal-body">

                        <form action="ControlMenu" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="add_Menu">

                            <div class="form-group">
                                <label for="nombreMenu" class="col-sm-2 control-label">*Nombre: </label>
                                <div class="col-sm-9">
                                    <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Nombre del Menu" title="Nombre del Menu" onkeypress="return validaL(event);">
                                </div>
                            </div>

                            <div class="form-group">

                                <label for="linkMenu" class="col-sm-2 control-label">*Link: </label>
                                <div class="col-sm-9">
                                    <input name="link" type="text" autocomplete="off" class="form-control" placeholder="Link del Menu" title="Link del Menu">
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
        
        <!-- Registro SubMenu-->
        <div class="modal fade" id="addSubMenu" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Agregar SubMenu</h4>
                    </div>

                    <div class="modal-body">

                        <form action="ControlSubMenu" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="add_SubMenu">

                            <div class="form-group">
                                <label for="nombreSubMenu" class="col-sm-2 control-label">*Nombre: </label>
                                <div class="col-sm-9">
                                    <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Nombre del Menu" title="Nombre del Menu" onkeypress="return validaL(event);">
                                </div>
                            </div>

                            <div class="form-group">

                                <label for="linkSubMenu" class="col-sm-2 control-label">*Link: </label>
                                <div class="col-sm-9">
                                    <input name="link" type="text" autocomplete="off" class="form-control" placeholder="Link del Menu" title="Link del Menu">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Icono" class="col-sm-2 control-label">*Menu Superior: </label>
                                <div class="col-sm-5">
                                    <select name="idmenu" id="idmenu" class="form-control" title="IdMenu">
                                        <option value="">Selecione su Menu</option>
                                        <%
                                          for(int k=0; k<contm; k++){
                                            %>
                                        <option value="<%=menu[k][1]%>"><%=menu[k][2]%></option>
                                        <%}%>
                                    </select>
                                    </div>
                                <div class="col-sm-2">
                                    <span class="" id="iconosBox" with="20px"></span>
                                </div>
                            </div> 
                                    
                            <div class="form-group">
                                <label for="Icono" class="col-sm-2 control-label">*Icono: </label>
                                <div class="col-sm-5">
                                    <select name="iconos" id="iconoss" class="form-control" onchange="cambiar_iconos()" title="Icono">
                                        <option value="">Selecione su Icono</option>
                                        <%
                                          for(int o=0; o<conti; o++){
                                            %>
                                        <option value="<%=icono[o]%>"><%=icono[o]%></option>
                                        <%}%>
                                    </select>
                                    </div>
                                <div class="col-sm-2">
                                    <span class="" id="iconosBox" with="20px"></span>
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
                                    
        <!-- ver Sub Menu-->
        <%
            
            String idmen;
            for(int s=0;s<lmnu.size();s++){
               menu men=(menu) lmnu.get(s); 
               cont1++;
               idmen=men.getIdmenu();
                %>
        <div class="modal fade" id="ver<%=idmen%>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="glyphicon glyphicon-eye-open"></i> Ver Sub Menu</h4>
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
                                                        <table id="tablaSubCategoria<%=idmen%>" name="tablaSubCategoria" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th><center>N°</center></th>
                                                            <th><center>Nombre</center></th>
                                                            <th><center>Link</center></th>
                                                            <th><center>Menu Superior</center></th>
                                                            <th><center>Acción</center></th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                               
                                                                <%
                                                                    
                                                                    ArrayList rsm= nsmnu.Submenus_Especificos(idmen);
                                                                    for(int j=0; j<rsm.size(); j++){
                                                                       submenu sme=(submenu) rsm.get(j); 
                                                                       cont2++;
                                                                       
                                                                               
                                                                %>
                                                                <tr role="row" class="odd" align="center">
                                                                    <td class="sorting_1"><%= cont2%></td>
                                                                    <td><%= sme.getNombre()%></td>
                                                                    <td><%= sme.getLink()%></td>
                                                                    <td><%= sme.getNombre_menu()%></td>
                                                                    <td>
                                                            <center>
                                                                <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar2<%=sme.getIdsubmenu()%>"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
                                                                <a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#eliminar2<%=sme.getIdsubmenu()%>" role="button"><i class="fa fa-trash" aria-hidden="true"></i> </a>
                                                                
                                                                <!-- Eliminar Sub Cateroria-->
                                                                <div class="modal fade modal-banco-first" id="eliminar2<%=sme.getIdsubmenu()%>">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" id="close1<%=sme.getIdsubmenu()%>" aria-hidden="true">&times;</button>
                                                                                <h4 class="modal-title"><i class="fa fa-trash" aria-hidden="true"></i> Confirmar Eliminación Sub Menu</h4>
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
                                                                                <form  action="ControlSubMenu" method="post">
                                                                                    <input type="hidden" name="op" value="delete_SubMenu">
                                                                                    <input type="hidden" name="idsubmenu" value="<%= sme.getIdsubmenu()%>">
                                                                                    <button type="submit" class="btn btn-danger danger"><i class="fa fa-trash" aria-hidden="true"></i> Eliminar</button>
                                                                                    <button type="button" class="btn btn-default" id="closemodal1<%=sme.getIdsubmenu()%>">Cancelar</button>  
                                                                                </form>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <script type="text/javascript">
                                                                    $('#close1<%=sme.getIdsubmenu()%>').click(function() {
                                                                    $('#eliminar2<%=sme.getIdsubmenu()%>').modal('hide');
                                                                });
                                                                    $('#closemodal1<%=sme.getIdsubmenu()%>').click(function() {
                                                                    $('#eliminar2<%=sme.getIdsubmenu()%>').modal('hide');
                                                                });
                                                                </script>    
                                                                
                                                                <!-- Actualizar Sub MEnu-->
                                                                <div class="modal fade" id="editar2<%=sme.getIdsubmenu()%>" tabindex="-1" role="dialog">
                                                                    <div class="modal-dialog" role="document">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" id="close2<%=sme.getIdsubmenu()%>" aria-hidden="true">&times;</button>
                                                                                <h4 class="modal-title"><i class="ion-android-sync"></i> Actualizar SubMenu</h4>
                                                                            </div>

                                                                            <div class="modal-body">

                                                                                <form action="ControlSubMenu" method="post" class="form-horizontal">
                                                                                    <input type="hidden" name="op" value="update_SubMenu">
                                                                                    <input type="hidden" name="idsubmenu" value="<%= sme.getIdsubmenu()%>">
                                                                                    <div class="form-group">
                                                                                        <label for="nombreSubMenu" class="col-sm-2 control-label">*Nombre: <%= sme.getIdsubmenu()%></label>
                                                                                        <div class="col-sm-9">
                                                                                            <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Nombre del Menu" title="Nombre del Menu" onkeypress="return validaL(event);" value="<%=sme.getNombre()%>">
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="form-group">

                                                                                        <label for="linkSubMenu" class="col-sm-2 control-label">*Link: </label>
                                                                                        <div class="col-sm-9">
                                                                                            <input name="link" type="text" autocomplete="off" class="form-control" placeholder="Link del Menu" title="Link del Menu" value="<%=sme.getLink()%>">
                                                                                        </div>
                                                                                    </div>
                                                                                    <p style="color: #ffffff; font-size: 5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>                                                    
                                                                                    <div class="form-group  col-sm-12">
                                                                                        <label for="Icono" class="col-sm-3 control-label">*Menu Superior: </label>
                                                                                        <div class="col-sm-5">
                                                                                            <select name="idmenu" id="idmenu" class="form-control" title="IdMenu">
                                                                                                <option value="">Selecione su Menu</option>
                                                                                                <%
                                                                                                  for(int k=0; k<contm; k++){
                                                                                                    %>
                                                                                                    <option value="<%=menu[k][1]%>" <%if(sme.getIdmenu().equals(menu[k][1])){%>selected<%}%>><%=menu[k][2]%></option>
                                                                                                <%}%>
                                                                                            </select>
                                                                                            </div>
                                                                                        <div class="col-sm-2">
                                                                                            <span class="" id="iconosBox" with="20px"></span>
                                                                                        </div>
                                                                                    </div> 
                                                                                    <p style="color: #ffffff; font-size: 5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>                                                    
                                                                                    <div class="form-group col-sm-12">
                                                                                        <label for="Icono" class="col-sm-3 control-label">*Icono: </label>
                                                                                        <div class="col-sm-5">
                                                                                            <select name="iconos" id="iconoss<%=cont2%>" class="form-control" onchange="cambiar_iconos<%=cont2%>()" title="Icono">
                                                                                                <option value="">Selecione su Icono</option>
                                                                                                <%
                                                                                                  for(int o=0; o<conti; o++){
                                                                                                    %>
                                                                                                <option value="<%=icono[o]%>" <%if(sme.getIcono().toUpperCase().equals(icono[o])){%>selected<%}%>><%=icono[o]%></option>
                                                                                                <%}%>
                                                                                            </select>
                                                                                            </div>
                                                                                        <div class="col-sm-2">
                                                                                            <span class="<%=sme.getIcono()%>" id="iconosBox<%=cont2%>" with="20px"></span>
                                                                                        </div>
                                                                                    </div>        



                                                                                    <div class="modal-footer">
                                                                                        <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i> Actualizar</button>
                                                                                        <a class="btn btn-default" id="closemodal2<%=sme.getIdsubmenu()%>"><i class="fa fa-close" aria-hidden="true"></i> Cerrar</a>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <script type="text/javascript">
                                                                    $('#close2<%=sme.getIdsubmenu()%>').click(function() {
                                                                    $('#editar2<%=sme.getIdsubmenu()%>').modal('hide');
                                                                });
                                                                    $('#closemodal2<%=sme.getIdsubmenu()%>').click(function() {
                                                                    $('#editar2<%=sme.getIdsubmenu()%>').modal('hide');
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
                $("#tablaSubCategoria<%=idmen%>").DataTable({
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
        
        
        <!-- Actualizar Menu-->
        
        <%
            for(int s=0;s<lmnu.size();s++){
            menu men=(menu) lmnu.get(s);
            idmenu=men.getIdmenu();
            cont3++;
        %>
        <div class="modal fade" id="editar<%=idmenu%>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Actualizar Menu <%=idmenu%></h4>
                    </div>

                    <div class="modal-body">

                        <form action="ControlMenu" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="update_Menu">
                            <input type="hidden" name="idmenu" value="<%=idmenu%>">
                            <div class="form-group">
                                <label for="nombreMenu" class="col-sm-2 control-label">*Nombre: </label>
                                <div class="col-sm-9">
                                    <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Nombre del Menu" title="Nombre del Menu" onkeypress="return validaL(event);" value="<%=men.getNombre()%>">
                                </div>
                            </div>

                            <div class="form-group">

                                <label for="linkMenu" class="col-sm-2 control-label">*Link: </label>
                                <div class="col-sm-9">
                                    <input name="link" type="text" autocomplete="off" class="form-control" placeholder="Link del Menu" title="Link del Menu" value="<%=men.getLink()%>">
                                </div>
                            </div>
                                                                
                            <div class="form-group">
                                <label for="Icono" class="col-sm-2 control-label">*Icono: </label>
                                <div class="col-sm-5">
                                    <select name="iconos" id="iconos<%=cont3%>" class="form-control" onchange="cambiar_icono<%=cont3%>()" title="Icono">
                                        <option value="">Selecione su Icono</option>
                                        <%
                                          for(int o=0; o<conti; o++){
                                            %>
                                            <option value="<%=icono[o]%>" <%if(men.getIcono().toUpperCase().equals(icono[o])){%>selected<%}%>><%=icono[o]%></option>
                                        <%}%>
                                    </select>
                                    </div>
                                <div class="col-sm-2">
                                    <span class="<%=men.getIcono()%>" id="iconoBox<%=cont3%>" with="20px"></span>
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
                $("#tablaMenu").DataTable({
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
            function cambiar_icono()
            {
                var icono = document.getElementById("iconos").value;
                icono=icono.toLowerCase();
                var cadena="ions "+icono;
                //alert(cadena);
                document.getElementById("iconoBox").className = cadena;
            };
            function cambiar_iconos()
            {
                var icono = document.getElementById("iconoss").value;
                icono=icono.toLowerCase();
                var cadena="ions "+icono;
                //alert(cadena);
                document.getElementById("iconosBox").className = cadena;
            };
            
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
            
            <%for(int q=1;q<=cont2;q++){%>
            function cambiar_iconos<%=q%>()
            {
                var icono = document.getElementById("iconoss<%=q%>").value;
                icono=icono.toLowerCase();
                var cadena="ions "+icono;
                //alert(cadena);
                document.getElementById("iconosBox<%=q%>").className= cadena;
            };
            <%}%>
        </script>
        <%@include file="include/recursos.jsp" %>
    </body>
</html>
