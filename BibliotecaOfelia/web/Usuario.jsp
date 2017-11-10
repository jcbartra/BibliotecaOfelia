
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <%@include file="include/mensaje.jsp" %>
    <%@include file="include/head.jsp" %>

    <%        usuario us = new usuario();
        n_usuario nus = new n_usuario();
        nus.setUs(us);

        rol r = new rol();
        n_rol nrl = new n_rol();
        nrl.setR(r);

        persona p = new persona();
        n_persona np = new n_persona();
        np.setP(p);

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
                        MÓDULO USUARIOS
                        <small>Registrar Usuarios</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="inicio.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Registro</li>
                        <li class="active">Registrar Persona</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">

                        <div class="col-md-12">
                            <div class="col-md-12">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#addUsuario"> <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Usuario </button>

                                <a href="Usuario.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-refresh"></i> Actualizar</a> &nbsp;&nbsp;&nbsp;
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
                                        <h3 class="box-title"> Registro de Usuarios</h3>
                                        <div class="box-tools pull-right"></div>
                                    </div>

                                    <div class="">

                                        <div class="container-fluid">

                                            <div class="col-lg-12">
                                                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                                    <div class="table-responsive">
                                                        <table id="tablaUsuarios" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th><center>N°</center></th>
                                                            <th><center>Rol</center></th>
                                                            <th><center>Persona</center></th>
                                                            <th><center>Usuario</center></th>
                                                            <th><center>Ver</center></th>
                                                            <th><center>Acción</center></th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%                                                                    int cont = 0;
                                                                    ArrayList ru = nus.MostrarUsuarios();
                                                                    for (int i = 0; i < ru.size(); i++) {
                                                                        usuario cu = (usuario) ru.get(i);
                                                                        cont++;

                                                                %>
                                                                <tr role="row" class="odd">
                                                                    <td class="sorting_1"><%= cont%></td>            

                                                                    <td><%= cu.getIdrol()%></td>
                                                                    <td><%= cu.getIdpersona()%></td>
                                                                    <td><%= cu.getUsuario()%></td>





                                                                    <td align="center"><a class="btn btn-default btn-xs" data-toggle="modal" data-target="#ver<%=cu.getIdusuario()%>"><i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i> </a>
                                                                    </td>
                                                                    <td>
                                                            <center>
                                                                <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#update<%=cu.getIdusuario()%>"><i class="fa fa-pencil" aria-hidden="true"></i> </a>

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
                                                                                <form  action="ControlUsuario" method="post">
                                                                                    <input type="hidden" name="ops" value="eliminar">
                                                                                    <input type="hidden" name="ids" value="<%=cu.getIdusuario()%>">
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
        <!-- Registro Usuario-->
        <div class="modal fade" id="addUsuario" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Agregar Usuarios</h4>
                    </div>

                    <div class="modal-body">

                        <form action="ControlUsuario" method="post" class="form-horizontal">
                            <input type="hidden" name="ops" value="add_usuario">


                            <div class="form-group">
                                <label for="Rol" class="col-sm-2 control-label">*Rol </label>
                                <div class="col-sm-5">
                                    <select name="rol" id="rol" class="form-control"  title="Rol">
                                        <option value="" hidden="" <%if (r.getIdrol()
                                                    == null) {%>selected="selected"<%}%>>Selecionar...</option>
                                        <%
                                            nrl.setR(r);
                                            ArrayList br = nrl.Roles();
                                            for (int x = 0;
                                                    x < br.size();
                                                    x++) {
                                                rol ar = (rol) br.get(x);
                                        %>
                                        <option value="<%=ar.getIdrol()%>"<%if (ar.getRol().equals(us.getIdrol())) {%>selected="selected"<%}%>><%=ar.getRol()%></option>
                                        <%
                                            }
                                        %>
                                    </select>

                                </div>
                                <div class="col-sm-2">
                                    <div class="btn small-box bg- btn-xs" id="colorBox" data-toggle="modal">&nbsp;<br/>&nbsp;</div>
                                </div>
                            </div>




                            <div class="form-group">
                                <label for="Persona" class="col-sm-2 control-label">*Persona: </label>
                                <div class="col-sm-5">
                                    <select name="persona" id="persona" class="form-control" title="persona">
                                        <option value="" hidden="" <%if (p.getIdpersona() == null) {%>selected="selected"<%}%>>Selecionar...</option>
                                        <%
                                            np.setP(p);
                                            ArrayList bp = np.Buscar_Persona();
                                            for (int x = 0;
                                                    x < bp.size();
                                                    x++) {
                                                persona up = (persona) bp.get(x);
                                        %>
                                        <option value="<%=up.getIdpersona()%>"<%if (up.getIdpersona().equals(us.getIdpersona())) {%>selected="selected"<%}%>><%=up.getNombres() + " " + up.getApe_paterno() + " " + up.getApe_materno()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="col-sm-2">
                                    <span class="" id="iconoBox" with="20px"></span>
                                </div>
                            </div>  

                            <div class="form-group">
                                <label for="Usuario" class="col-sm-2 control-label">*Usuario: </label>
                                <div class="col-sm-3">
                                    <input name="usuario" type="text" autocomplete="off" class="form-control" placeholder="Usuario de la persona" title="usuario  de la persona">
                                </div>

                                <label for="F-Clave" class="col-sm-2 control-label">*Clave: </label>
                                <div class="col-sm-5">
                                    <input name="clave" type="password" autocomplete="off" class="form-control" placeholder="calve de la persona" title="clave de la persona">
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




        <!--  VER  USUARIOS-->

        <%        int cont1 = 0;
            String idus;

            for (int e = 0;
                    e < ru.size();
                    e++) {
                usuario cu = (usuario) ru.get(e);
                idus = cu.getIdusuario();
                cont1++;
        %>
        <div class="modal fade" id="ver<%=idus%>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="glyphicon glyphicon-eye-open"></i> Ver Usuario </h4>
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
                                                            <body >
                                                                <table width="308" align="center" >
                                                                    <tr>
                                                                        <td colspan="3" align="center" bgcolor="#00FF99"><em><strong>DATOS PERSONALES</strong></em></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="143"><img src="<%=p.getFoto()%>"  class="img-thumbnail"width="142" height="114" /></td>
                                                                        <td><%=cu.getIdpersona()%></td>
                                                                    </tr>
                                                                    <tr>

                                                                    </tr>

                                                                    <tr>
                                                                        <td height="33" colspan="2"><strong>Date User</strong></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Ubigeo:</td>
                                                                        <td ><%=cu.getN_ubigeo()%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Tipo Documento:</td>
                                                                        <td><%=cu.getN_tipodoc()%></td>

                                                                    </tr>
                                                                    
                                                                    <tr>
                                                                        <td>N° Documento:</td>
                                                                        <td><%=cu.getN_nro()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Género:</td>
                                                                        <td><%=cu.getN_sexo()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Dirección:</td>
                                                                        <td><%=cu.getDireccion()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Teléfono:</td>
                                                                        <td><%=cu.getTelefono()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Rol:</td>
                                                                        <td><%=cu.getIdrol()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Usuario</td>
                                                                        <td><%=cu.getUsuario()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>&nbsp;</td>
                                                                        <td>&nbsp;</td>

                                                                    </tr>


                                                                </table>
                                                            </body>
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
        <%}%>
        <!-- Actualizar Usuario--> 
        <%
            int cont2 = 0;
            String idus2;
            ArrayList cus = nus.MostrarUsuarioUpdate();
            for (int i = 0; i < cus.size(); i++) {
                usuario cu2 = (usuario) cus.get(i);
                idus2 = cu2.getIdusuario();
                cont2++;

        %>
        <div class="modal fade" id="update<%=idus2%>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Actualizar Usuario</h4>
                    </div>
                    <div class="modal-body">

                        <form action="ControlUsuario" method="post" class="form-horizontal">
                            <input type="hidden" name="ops" value="update_usuario">
                            <input type="hidden" name="ids" value="<%=idus2%>">

                            <div class="form-group">
                                <label for="Rol" class="col-sm-2 control-label">*Rol </label>
                                <div class="col-sm-5">
                                    <select name="rol" id="rol" class="form-control"  title="Rol">
                                        <option value="" hidden="" <%if (r.getIdrol()
                                                    == null) {%>selected="selected"<%}%>>Selecionar...</option>
                                        <%
                                         

                                            for (int x = 0;
                                                    x < br.size();
                                                    x++) {
                                                rol ar = (rol) br.get(x);
                                        %>
                                        <option value="<%=ar.getIdrol()%>"<%if (ar.getIdrol().equals(cu2.getIdrol())) {%>selected="selected"<%}%>><%=ar.getRol()%></option>
                                        <%
                                            }
                                        %>
                                    </select>

                                </div>
                                <div class="col-sm-2">
                                    <div class="btn small-box bg- btn-xs" id="colorBox" data-toggle="modal">&nbsp;<br/>&nbsp;</div>
                                </div>
                            </div>




                            <div class="form-group">
                                <label for="Persona" class="col-sm-2 control-label">*Persona: </label>
                                <div class="col-sm-5">
                                    <select name="persona" id="persona" class="form-control" title="persona">
                                        <option value="" hidden="" <%if (p.getIdpersona() == null) {%>selected="selected"<%}%>>Selecionar...</option>
                                        <%
                                            

                                            for (int x = 0;
                                                    x < bp.size();
                                                    x++) {
                                                persona up = (persona) bp.get(x);
                                        %>
                                        <option value="<%=up.getIdpersona()%>"<%if (up.getIdpersona().equals(cu2.getIdpersona())) {%>selected="selected"<%}%>><%=up.getNombres() + " " + up.getApe_paterno() + " " + up.getApe_materno()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                                <div class="col-sm-2">
                                    <span class="" id="iconoBox" with="20px"></span>
                                </div>
                            </div>  
                                    
                            <div class="form-group">
                                <label for="Usuario" class="col-sm-2 control-label">*Usuario: </label>
                                <div class="col-sm-3">
                                    <input name="usuario" type="text" autocomplete="off" class="form-control" placeholder="Usuario de la persona" title="usuario  de la persona" value="<%=cu2.getUsuario()%>">
                                </div>

                                <label for="F-Clave" class="col-sm-2 control-label">*Clave: </label>
                                <div class="col-sm-5">
                                    <input name="clave" type="password" autocomplete="off" class="form-control" placeholder="calve de la persona" title="clave de la persona" value="<%=cu2.getClave()%>">
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i> Actualizar</button>
                                <a class="btn btn-default" data-dismiss="modal"id="closemodal2<%=idus2%>"><i class="fa fa-close" aria-hidden="true"></i> cerrar</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
<% }%>

        <script>
            $(function () {
                $("#tablaUsuarios").DataTable({
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
