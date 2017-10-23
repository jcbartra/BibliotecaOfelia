
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
    <%@include file="include/mensaje.jsp" %>
    <%@include file="include/head.jsp" %>
    <%        persona p = new persona();
        n_persona np = new n_persona();
        np.setP(p);

        tipo_doc td = new tipo_doc();
        n_tipo_doc ntd = new n_tipo_doc();
        ntd.setTd(td);

        ubigeo ub = new ubigeo();
        n_ubigeo nub = new n_ubigeo();
        nub.setUb(ub);
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
                        MÓDULO PERSONA
                        <small>Registrar Persona</small>
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
                          <button class="btn btn-primary" data-toggle="modal" data-target="#addCategoria"> <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Persona </button>
      
                          <a href="Persona.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-refresh"></i> Actualizar</a> &nbsp;&nbsp;&nbsp;
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
                                        <h3 class="box-title"> Registro de Personas</h3>
                                        <div class="box-tools pull-right"></div>
                                    </div>

                                    <div class="">

                                        <div class="container-fluid">

                                            <div class="col-lg-12">
                                                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                                    <div class="table-responsive">
                                                        <table id="tablaPersona" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th><center>N°</center></th>
                                                            <th><center>Nombres</center></th>

                                                            <th><center>Genero</center></th>
                                                            <th><center>Ubigeo</center></th>
                                                            <th><center>Tipo-Doc</center></th>
                                                            <th><center>N° Doc</center></th>
                                                            <th><center>Ver</center></th>
                                                            <th><center>Acción</center></th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%                                                                    int cont = 0;
                                                                    ArrayList rc = np.Mostrar_Persona();
                                                                    for (int i = 0; i < rc.size(); i++) {
                                                                        persona cp = (persona) rc.get(i);
                                                                        cont++;

                                                                %>
                                                                <tr role="row" class="odd">
                                                                    <td class="sorting_1"><%= cont%></td>            
                                                                    <td><%= cp.getNombres() + " " + cp.getApe_paterno() + " " + cp.getApe_materno()%></td>

                                                                    <td><%= cp.getGenero()%></td>
                                                                    <td><%= cp.getIdubigeo()%></td>
                                                                    <td><%= cp.getIdtipodoc()%></td>
                                                                    <td><%= cp.getNro_doc()%></td>





                                                                    <td align="center"><a class="btn btn-default btn-xs" data-toggle="modal" data-target="#ver<%=cp.getIdpersona()%>"><i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i> </a>
                                                                    </td>
                                                                    <td>
                                                            <center>
                                                                <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar<%=cp.getIdpersona()%>"><i class="fa fa-pencil" aria-hidden="true"></i> </a>

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
                                                                                <form  action="ControlPersona" method="post">
                                                                                    <input type="hidden" name="op" value="eliminar">
                                                                                    <input type="hidden" name="id" value="<%=cp.getIdpersona()%>">
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
        <!-- Registro Persona-->
        <div class="modal fade" id="addCategoria" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Agregar Persona</h4>
                    </div>

                    <div class="modal-body">

                        <form action="ControlPersona" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="add_Persona">

                            <div class="form-group">
                                <label for="numeroCategoria" class="col-sm-2 control-label">*Nombres: </label>
                                <div class="col-sm-3">
                                    <input name="nombres" type="text" autocomplete="off" class="form-control" placeholder="Nombre de la personas" title="Nombres de la persona">
                                </div>

                                <label for="A-paterno" class="col-sm-2 control-label">*A-Paterno: </label>
                                <div class="col-sm-5">
                                    <input name="ape_paterno" type="text" autocomplete="off" class="form-control" placeholder="A-Paterno de la persona" title="A-Paterno de la persona">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="A-materno" class="col-sm-2 control-label">*A-Materno: </label>
                                <div class="col-sm-3">                                          
                                    <input name="ape_materno" type="text" autocomplete="off" class="form-control" placeholder="A-Materno de la persona" title="A-materno de la persona">
                                </div>

                                <label for="geneoPersona" class="col-sm-2 control-label">*Genero: </label>

                                <div class="col-sm-5">
                                    <select name="genero" id="genero" class="form-control"  title="Genero">
                                        <option value="" hidden="hidden"selected="selected">Selecionar</option>
                                        <option value="M">Masculino</option>
                                        <option value="F">Femenino</option>

                                    </select>

                                </div>
                                <div class="col-sm-2">
                                    <div class="btn small-box bg- btn-xs" id="colorBox" data-toggle="modal">&nbsp;<br/>&nbsp;</div>
                                </div>
                            </div>




                            <div class="form-group">
                                <label for="Ubigeo" class="col-sm-2 control-label">*Ubigeo: </label>
                                <div class="col-sm-5">
                                    <select name="idubigeo" id="colores" class="form-control"  title="Ubigeo">
                                        <option value="" hidden="hidden"<%if (ub.getIdubigeo()
                                                        == null) {%>selected="selected"<%}%>>Selecionar</option>
                                        <%
                                            nub.setUb(ub);
                                            ArrayList bc = nub.Buscar_ubigeo();
                                            for (int x = 0;
                                                    x < bc.size();
                                                    x++) {
                                                ubigeo au = (ubigeo) bc.get(x);
                                        %>
                                        <option value="<%=au.getIdubigeo()%>"<%if (au.getIdubigeo().equals(p.getIdubigeo())) {%>selected="selected"<%}%>><%=au.getNombre()%></option>
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
                                <label for="Tipo-doc" class="col-sm-2 control-label">*Tipo-Doc: </label>
                                <div class="col-sm-5">
                                    <select name="idtipodoc" id="iconos" class="form-control" title="Tipo_Doc">
                                        <option value="" hidden="hidden"<%if (td.getIdtipodoc() == null) {%>selected="selected"<%}%>>Selecionar</option>
                                        <%
                                            ntd.setTd(td);
                                            ArrayList bt = ntd.Buscar_tipodoc();
                                            for (int x = 0;
                                                    x < bt.size();
                                                    x++) {
                                                tipo_doc atd = (tipo_doc) bt.get(x);
                                        %>
                                        <option value="<%=atd.getIdtipodoc()%>"<%if (atd.getIdtipodoc().equals(p.getIdtipodoc())) {%>selected="selected"<%}%>><%=atd.getNombre()%></option>
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
                                <label for="N-Doc" class="col-sm-2 control-label">*N°_Doc: </label>
                                <div class="col-sm-3">
                                    <input name="nro_doc" type="number" autocomplete="off" class="form-control" placeholder="Nro-doc   de la persona" title="Nro-doc   de la persona">
                                </div>

                                <label for="F-Nacimiento" class="col-sm-2 control-label">*F-Nacimiento: </label>
                                <div class="col-sm-5">
                                    <input name="fecha_nacimiento" type="date" autocomplete="off" class="form-control" placeholder="F-nacimiento de la persona">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="DirecciónPersona" class="col-sm-2 control-label">*Dirección: </label>
                                <div class="col-sm-3">
                                    <input name="direccion" type="text" autocomplete="off" class="form-control" placeholder="Dirección de la persona" title="Dirección de la persona">
                                </div>

                                <label for="TeléfonoPersona" class="col-sm-2 control-label">*Teléfono: </label>
                                <div class="col-sm-5">
                                    <input name="telefono" type="number" autocomplete="off" class="form-control" placeholder="Teléfono de la Persona" title="Teléfono de la Persona">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="FotoPersona" class="col-sm-2 control-label">*Foto: </label>
                                <div class="col-sm-3"  >
                                    <input name="foto" type="file" autocomplete="off" >
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




        <!--  VER  PERSONA-->
        <%
            int cont1 = 0;
            String idper;
            for (int i = 0;
                    i < rc.size();
                    i++) {
                persona cp = (persona) rc.get(i);
                idper = cp.getIdpersona();
                cont1++;

        %>
        <div class="modal fade" id="ver<%=idper%>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="glyphicon glyphicon-eye-open"></i> Ver Persona </h4>
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
                                                                        <td width="143"><img src="../NetBeansProjects/BibliotecaOfelia/BibliotecaOfelia/web/Recursos/img/avatar5.png" width="142" height="114" /></td>
                                                                        <td><%=cp.getNombres() + " " + cp.getApe_paterno() + " " + cp.getApe_materno()%></td>
                                                                    </tr>
                                                                    <tr>

                                                                    </tr>

                                                                    <tr>
                                                                        <td height="33" colspan="2"><strong>PERSONAL</strong></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Fecha Nacimiento:</td>
                                                                        <td ><%=cp.getFecha_nacimiento()%></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td>Ubigeo:</td>
                                                                        <td><%=cp.getIdubigeo()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Tipo Documento:</td>
                                                                        <td><%=cp.getIdtipodoc()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>N° Documento:</td>
                                                                        <td><%=cp.getNro_doc()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Género:</td>
                                                                        <td><%=cp.getGenero()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Dirección:</td>
                                                                        <td><%=cp.getDireccion()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Teléfono:</td>
                                                                        <td><%=cp.getTelefono()%></td>

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
        <!-- Actualizar Persona-->                                                          

        <%        int cont2 = 0;
            String idper2;
            ArrayList rcs = np.Mostrar_PersonaUpdate();
            for (int e = 0;
                    e < rcs.size();
                    e++) {
                persona cp2 = (persona) rcs.get(e);
                idper2 = cp2.getIdpersona();
                cont2++;
        %>

        <div class="modal fade" id="editar<%=idper2%>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Actualizar Persona</h4>
                    </div>
                    <div class="modal-body">

                        <form action="ControlPersona" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="update_persona">
                            <input type="hidden" name="id" value="<%=idper2%>">

                            <div class="form-group">
                                <label for="Nombres" class="col-sm-2 control-label">*Nombres: </label>
                                <div class="col-sm-3">
                                    <input name="nombres" type="text" autocomplete="off" class="form-control" placeholder="Nombres de la persona" title="nombresde la persona" value="<%=cp2.getNombres()%>">
                                </div>

                                <label for="A-paterno" class="col-sm-2 control-label">*A-Paterno: </label>
                                <div class="col-sm-3">
                                    <input name="ape_paterno" type="text" autocomplete="off" class="form-control" placeholder="A-paterno de la persona" title="A-paterno de la persona" value="<%=cp2.getApe_paterno()%>">
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="A-materno" class="col-sm-2 control-label">*A-Materno: </label>
                                <div class="col-sm-3">
                                    <input name="ape_materno" type="text" autocomplete="off" class="form-control" placeholder="A-Materno de la persona" title="A-materno de la persona" value="<%=cp2.getApe_materno()%>">
                                </div>

                                <label for="generoPersona" class="col-sm-2 control-label">*Genero: </label>

                                <div class="col-sm-5">
                                    <select name="genero" id="genero" class="form-control"  title="Genero">
                                        <option value=""hidden="hidden">Selecionar</option>
                                        <option value="M" <%if (cp2.getGenero().equals("M")) {%>selected="selected"<%}%>>Masculino</option>
                                        <option value="F" <%if (cp2.getGenero().equals("F")) {%>selected="selected"<%}%>>Femenino</option>

                                    </select>

                                </div>
                                <div class="col-sm-2">
                                    <div class="btn small-box bg- btn-xs" id="colorBox" data-toggle="modal">&nbsp;<br/>&nbsp;</div>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Ubigeo" class="col-sm-2 control-label">*Ubigeo:</label>
                                <div class="col-sm-5">
                                    <select name="idubigeo" id="colores" class="form-control"  title="Ubigeo">
                                        <option value="" hidden="hidden"<%if (ub.getIdubigeo()
                                                        == null) {%>selected="selected"<%}%>>Selecionar</option>
                                        <%

                                            for (int x = 0;
                                                    x < bc.size();
                                                    x++) {
                                                ubigeo au = (ubigeo) bc.get(x);
                                        %>
                                        <option value="<%=au.getIdubigeo()%>"<%if (au.getIdubigeo().equals(cp2.getIdubigeo())) {%>selected="selected"<%}%>><%=au.getNombre()%></option>
                                        <%
                                            }
                                        %>
                                    </select>

                                </div>

                                <div class="form-group">
                                    <label for="Tipo-doc" class="col-sm-2 control-label">*Tipo-Doc: </label>
                                    <div class="col-sm-5">
                                        <select name="idtipodoc" id="iconos" class="form-control" title="Tipo_Doc">
                                            <option value="" hidden="hidden"<%if (td.getIdtipodoc() == null) {%>selected="selected"<%}%>>Selecionar</option>
                                            <%
                                                ntd.setTd(td);
                                                for (int x = 0;
                                                        x < bt.size();
                                                        x++) {
                                                    tipo_doc atd = (tipo_doc) bt.get(x);
                                            %>
                                            <option value="<%=atd.getIdtipodoc()%>"<%if (atd.getIdtipodoc().equals(cp2.getIdtipodoc())) {%>selected="selected"<%}%>><%=atd.getNombre()%></option>
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
                                    <label for="N-Doc" class="col-sm-2 control-label">*N°_Doc: </label>
                                    <div class="col-sm-3">
                                        <input name="nro_doc" type="text" autocomplete="off" class="form-control" placeholder="Nro-doc   de la persona" title="Nro-doc   de la persona" value="<%=cp2.getNro_doc()%>">
                                    </div>

                                    <label for="F-Nacimiento" class="col-sm-2 control-label">*F-Nacimiento: </label>
                                    <div class="col-sm-5">
                                        <input name="fecha_nacimiento" type="text" autocomplete="off" class="form-control" placeholder="F-nacimiento de la persona"value="<%=cp2.getFecha_nacimiento()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="DirecciónPersona" class="col-sm-2 control-label">*Dirección: </label>
                                    <div class="col-sm-3">
                                        <input name="direccion" type="text" autocomplete="off" class="form-control" placeholder="Dirección de la persona" title="Dirección de la persona"value="<%=cp2.getDireccion()%>">
                                    </div>

                                    <label for="TeléfonoPersona" class="col-sm-2 control-label">*Teléfono: </label>
                                    <div class="col-sm-5">
                                        <input name="telefono" type="text" autocomplete="off" class="form-control" placeholder="Teléfono de la Persona" title="Teléfono de la Persona"value="<%=cp2.getTelefono()%>">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="FotoPersona" class="col-sm-2 control-label">*Foto: </label>
                                    <div class="col-sm-3">
                                        <input name="foto" type="text" autocomplete="off" class="form-control" placeholder="Foto de la Persona" title="Foto de la Persona">
                                    </div>


                                </div>
                                <div class="col-sm-2">
                                    <div class="btn small-box bg- btn-xs" id="colorBox" data-toggle="modal">&nbsp;<br/>&nbsp;</div>
                                </div>
                            </div>


                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i> Actualizar</button>
                                <a class="btn btn-default" data-dismiss="modal"id="closemodal2<%=idper2%>"><i class="fa fa-close" aria-hidden="true"></i> cerrar</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>


        <script>
            $(function () {
                $("#tablaPersona").DataTable({
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

        <script>
            function cambiar_color()
            {
                var color = document.getElementById("colores").value;
                color = color.toLowerCase();
                var cadena = "btn small-box bg-" + color + " btn-xs";
                //alert(cadena);
                document.getElementById("colorBox").className = cadena;
            }
            ;
            function cambiar_icono()
            {
                var icono = document.getElementById("iconos").value;
                icono = icono.toLowerCase();
                var cadena = "ions " + icono;
                //alert(cadena);
                document.getElementById("iconoBox").className = cadena;
            }
            ;
        </script>
        <%@include file="include/recursos.jsp" %>
    </body>
</html>
