<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="include/head.jsp" %>
    <%@include file="include/mensaje.jsp" %>


    <%        lector l = new lector();
        n_lector nl = new n_lector();
        nl.setL(l);

        persona p = new persona();
        n_persona np = new n_persona();
        np.setP(p);

        tipo t = new tipo();
        n_tipo nt = new n_tipo();
        nt.setT(t);

        turno tu = new turno();
        n_turno ntu = new n_turno();
        ntu.setTu(tu);

        periodo pe = new periodo();
        n_periodo npe = new n_periodo();
        npe.setPe(pe);
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
                        MÓDULO LECTOR
                        <small>Registrar Lector</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="Libro.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Registro</li>
                        <li class="active">Registrar Lesctor</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="col-md-12">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#addLector"> <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Libro </button>
                                <a href="Lector.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-refresh"></i> Actualizar</a> &nbsp;&nbsp;&nbsp;
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
                                        <h3 class="box-title"> Registro de Lectores</h3>
                                        <div class="box-tools pull-right"></div>
                                    </div>

                                    <div class="">

                                        <div class="container-fluid">

                                            <div class="col-lg-12">
                                                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                                    <div class="table-responsive">
                                                        <table id="tablaLector" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                            <thead>
                                                           <tr role="row">
                                                            <th><center>N°</center></th>
                                                            <th><center>Persona</center></th>
                                                            <th><center>Genero</center></th>
                                                            <th><center>Tipo</center></th>
                                                            <th><center>N° Documento</center></th>
                                                            <th><center>Estado</center></th>
                                                            <th><center>ver</center></th>
                                                            <th><center>Acción</center></th>
                                                            </tr>
                                                            </thead>
                                                            <tbody>
                                                                <% int cont = 0;
                                                                    ArrayList rl = nl.Mostrar_Lector();
                                                                    for (int i = 0; i < rl.size(); i++) {
                                                                        lector cl = (lector) rl.get(i);
                                                                        cont++;
                                                                %>
                                                                <tr role="row" class="odd">
                                                                    <td><%= cont%></td>            
                                                                    <td><%= cl.getIdpersona()%></td>
                                                                    <td><%= cl.getGenero()%></td>
                                                                    <td><%= cl.getIdtipo()%></td>
                                                                    <td><%= cl.getNdoc()%></td>
                                                                    <td><%= cl.getEstado()%></td>
                                                                    <td align="center">
                                                                        <a class="btn btn-default btn-xs" data-toggle="modal" data-target="#ver<%=cl.getIdlector()%>"><i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i> </a>
                                                                        </td>
                                                                    <td>
                                                                    <center>
                                                                        <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar<%=cl.getIdlector()%>"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
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
                                                                                <form  action="ControlLector" method="post">
                                                                                    <input type="hidden" name="op" value="eliminar">
                                                                                    <input type="hidden" name="idlector" value="<%=cl.getIdlector()%>">
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
        
<!-- Registro Lector-->

        <div class="modal fade" id="addLector" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Agregar Lector</h4>
                    </div>
                    <div class="modal-body">
                        <form action="ControlLector" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="add_Lector">
                            <div class="form-group">
                                <label for="persona" class="col-sm-2 control-label">*Persona: </label>
                                <div class="col-sm-5">
                                    <select name="idpersona" id="persona" class="form-control" title="Persona">
                                        <option value="" hidden="hidden"selected="selected" >Seleccionar</option>
                                        <%
                                            np.setP(p);
                                            ArrayList bp = np.Buscar_Persona_Lector();
                                            for (int x = 0; x < bp.size(); x++) {
                                                persona ap = (persona) bp.get(x);
                                        %>
                                        <option value="<%=ap.getIdpersona()%>"><%=ap.getNombres()%> <%=ap.getApe_paterno()%> <%=ap.getApe_materno()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label for="nota" class="col-sm-2"></label>
                                    <div class="col-sm-5" color="red">
                                        <h6>-Nota: En este campo solo se muestran las personas que aun no han sido registradas como lectores. </h6>
                                    
                                    </div>
                            </div>                                                                

                            <div class="form-group">
                                <label for="tipo" class="col-sm-2 control-label">*Tipo: </label>
                                <div class="col-sm-5">
                                    <select name="idtipo" id="tipo" class="form-control" title="Tipo">
                                        <option value="" hidden="hidden"selected="selected">Seleccionar</option>
                                        <%
                                            nt.setT(t);
                                            ArrayList bt = nt.Buscar_tipo();
                                            for (int x = 0; x < bt.size(); x++) {
                                                tipo at = (tipo) bt.get(x);
                                        %>
                                        <option value="<%=at.getIdtipo()%>"><%=at.getNombre()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="turno" class="col-sm-2 control-label">*Turno </label>
                                <div class="col-sm-5">
                                    <select name="idturno" id="turno" class="form-control" title="Turno">
                                        <option value="" hidden="hidden" selected="selected">Seleccionar</option>
                                        <%
                                            ntu.setTu(tu);
                                            ArrayList btu = ntu.Buscar_turno();
                                            for (int x = 0; x < btu.size(); x++) {
                                                turno atu = (turno) btu.get(x);
                                        %>
                                        <option value="<%=atu.getIdturno()%>"><%=atu.getTurno()%></option>
                                        <%
                                            }
                                        %>   
                                    </select>
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="periodo" class="col-sm-2 control-label">*Periodo </label>
                                <div class="col-sm-5">
                                    <select name="idperiodo" id="periodo" class="form-control" title="Periodo">
                                        <option value="" hidden="hidden" selected="selected">Seleccionar</option>
                                        <%
                                            npe.setPe(pe);
                                            ArrayList bpe = npe.Buscar_periodo();
                                            for (int x = 0; x < bpe.size(); x++) {
                                                periodo ape = (periodo) bpe.get(x);
                                        %>
                                        <option value="<%=ape.getIdperiodo()%>"><%=ape.getPeriodo()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="nivel" class="col-sm-2 control-label">*Nivel </label>
                                <div class="col-sm-3">
                                    <select name="nivel" id="nivel" class="form-control" title="Nivel">
                                        <option value="Primaria">Primaria</option>
                                        <option value="Secundaria">Secundaria</option>
                                    </select>  
                                </div>

                                <label for="Grado" class="col-sm-2 control-label">*Grado: </label>
                                <div class="col-sm-3">
                                    <select name="grado" id="grado" class="form-control" title="Grado">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option value="5">5</option>
                                        <option value="6">6</option>
                                    </select>  
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="seccion" class="col-sm-2 control-label">*Seccion: </label>
                                <div class="col-sm-3">
                                    <select name="seccion" id="seccion" class="form-control" title="Seccion" hidden="hidden">
                                        <option value="A">A</option>
                                        <option value="B">B</option>
                                        <option value="C">C</option>
                                        <option value="D">D</option>
                                        <option value="E">E</option>
                                    </select>
                                </div>

                                <label for="Condicion" class="col-sm-2 control-label">*Condicion: </label>
                                <div class="col-sm-3">
                                    <select name="condicion" id="condicion" class="form-control" title="ondicion">
                                        <option value="0">0</option>
                                        <option value="1">1</option>
                                    </select>
                                </div>
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
        
                                    
            <!--  VER  LECTOR-->
        <%
            int cont1 = 0;
            String idlec;
            for (int i = 0; i < rl.size(); i++) {
                lector cl = (lector) rl.get(i);
                idlec = cl.getIdlector();
                cont1++;

        %>
        <div class="modal fade" id="ver<%=idlec%>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="glyphicon glyphicon-eye-open"></i> Ver Lector </h4>
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
                                                            <body>
                                                                <table width="308" align="center" >
                                                                    <tr>
                                                                        <td colspan="3" align="center" bgcolor="#00FF99"><em><strong>DATOS LECTOR</strong></em></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="143"><img src="Recursos/img/personas/SF-V.jpg" width="142" height="114" /></td>
                                                                        <td><%=cl.getIdpersona()%></td>
                                                                    </tr>
                                                                    <tr>

                                                                    </tr>

                                                                    <tr>
                                                                        <td height="33" colspan="2"><strong>PERSONAL</strong></td>

                                                                    </tr>

                                                                    <tr>
                                                                        <td>Tipo:</td>
                                                                        <td><%=cl.getIdtipo()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Turno:</td>
                                                                        <td><%=cl.getIdturno()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Periodo:</td>
                                                                        <td><%=cl.getIdperiodo()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Estado hábil:</td>
                                                                        <td><%=cl.getEstado_habil()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Nivel:</td>
                                                                        <td><%=cl.getNivel()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Grado:</td>
                                                                        <td><%=cl.getGrado()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Seccion:</td>
                                                                        <td><%=cl.getSeccion()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Condicion:</td>
                                                                        <td><%=cl.getCondicion()%></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Estado periodo:</td>
                                                                        <td><%=cl.getEstado_periodo()%></td>

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
                <!-- Actualizar Lector-->
        <%        int cont2 = 0;
            String idlec2;
            ArrayList rcs = nl.Mostrar_LectorUpdate();
            for (int e = 0;
                    e < rcs.size();
                    e++) {
                lector cl2 = (lector) rcs.get(e);
                idlec2 = cl2.getIdlector();
                cont2++;
        %>
        <div class="modal fade" id="editar<%=idlec2%>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Actualizar Lector</h4>
                    </div>
                    <div class="modal-body">
                        <form action="ControlLector" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="Actualizar_Lector">
                            <input type="hidden" name="idlector" value="<%=idlec2%>"> 
                            <div class="form-group">
                                <label for="persona" class="col-sm-2 control-label">*Persona: </label>
                                <div class="col-sm-5">                                    
                                    <select name="idpersona" id="persona" class="form-control" title="Persona">
                                        <option value="" hidden="hidden"<%if (p.getIdpersona() == null) {%>selected="selected"<% } %> >Seleccionar</option>
                                        <%
                                            np.setP(p);
                                            for (int x = 0;
                                                    x < bp.size();
                                                    x++) {
                                                persona ap = (persona) bp.get(x);
                                        %>
                                        <option value="<%=ap.getIdpersona()%>"<%if (ap.getIdpersona().equals(cl2.getIdpersona())) {%>selected="selected"<%}%>><%=ap.getNombres()%> <%=ap.getApe_paterno()%> <%=ap.getApe_materno()%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>                                    
                            <div class="form-group">
                                <label for="tipo" class="col-sm-2 control-label">*Tipo: </label>
                                <div class="col-sm-5">
                                    <select name="idtipo" id="tipo" class="form-control" title="tipo">
                                        <option value="" hidden="hidden" <%if (t.getIdtipo() == null) {%>selected="selected"<% } %> >Seleccionar</option>
                                        <%
                                            nt.setT(t);
                                            for (int x = 0;
                                                    x < bt.size();
                                                    x++) {
                                                tipo at = (tipo) bt.get(x);
                                        %>
                                        <option value="<%=at.getIdtipo()%>"<%if (at.getIdtipo().equals(cl2.getIdtipo())) {%>selected="selected"<%}%>><%=at.getNombre()%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>                         
                                   
                            <div class="form-group">
                                <label for="turno" class="col-sm-2 control-label">*Turno </label>
                                <div class="col-sm-5">
                                    <select name="idturno" id="turno" class="form-control" title="turno">
                                        <option value="" hidden="hidden" <%if (tu.getIdturno() == null) {%>selected="selected"<% } %> >Seleccionar</option>
                                        <%
                                            ntu.setTu(tu);
                                            for (int x = 0;
                                                    x < btu.size();
                                                    x++) {
                                                turno atu = (turno) btu.get(x);
                                        %>
                                        <option value="<%=atu.getIdturno()%>"<%if (atu.getIdturno().equals(cl2.getIdturno())) {%>selected="selected"<%}%>><%=atu.getTurno()%> </option>
                                        <%
                                            }
                                        %>   
                                    </select>
                                </div>
                            </div> 
                                  
                            <div class="form-group">
                                <label for="periodo" class="col-sm-2 control-label">*Periodo </label>
                                <div class="col-sm-5">
                                    <select name="idperiodo" id="periodo" class="form-control" title="periodo">
                                        <option value="" hidden="hidden" <%if (pe.getIdperiodo() == null) {%>selected="selected"<% } %> >Seleccionar</option>
                                        <%
                                            npe.setPe(pe);
                                            for (int x = 0;
                                                    x < bpe.size();
                                                    x++) {
                                                periodo ape = (periodo) bpe.get(x);
                                        %>
                                        <option value="<%=ape.getIdperiodo()%>"<%if (ape.getIdperiodo().equals(cl2.getIdperiodo())) {%>selected="selected"<%}%>><%=ape.getPeriodo()%> </option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>        
       
                            <div class="form-group">

                                <label for="nivel" class="col-sm-2 control-label">*Nivel </label>
                                <div class="col-sm-5">
                                    <select name="nivel" id="nivel" class="form-control" title="nivel">
                                        <option value="0" <%if (cl2.getNivel().equals("0")) {%>selected="selected"<%}%>>0</option>
                                        <option value="1" <%if (cl2.getNivel().equals("1")) {%>selected="selected"<%}%>>1</option>
                                    </select>  
                                </div>
                            </div>          

                            <div class="form-group">
                                <label for="Grado" class="col-sm-2 control-label">*Grado: </label>
                                <div class="col-sm-3">
                                    <select name="grado" id="grado" class="form-control" title="grado" hidden="hidden">
                                        <option value="1" <%if (cl2.getGrado().equals("1")) {%>selected="selected"<%}%>>1</option>
                                        <option value="2" <%if (cl2.getGrado().equals("2")) {%>selected="selected"<%}%>>2</option>
                                        <option value="3" <%if (cl2.getGrado().equals("3")) {%>selected="selected"<%}%>>3</option>
                                        <option value="4" <%if (cl2.getGrado().equals("4")) {%>selected="selected"<%}%>>4</option>
                                        <option value="5" <%if (cl2.getGrado().equals("5")) {%>selected="selected"<%}%>>5</option>
                                        <option value="6" <%if (cl2.getGrado().equals("6")) {%>selected="selected"<%}%>>6</option>
                                    </select>  
                                </div>

                                <label for="seccion" class="col-sm-2 control-label">*Seccion: </label>
                                <div class="col-sm-5">
                                    <select name="seccion" id="seccion" class="form-control" title="seccion" hidden="hidden">
                                        <option value="A" <%if (cl2.getSeccion().equals("A")) {%>selected="selected"<%}%>>A</option>
                                        <option value="B" <%if (cl2.getSeccion().equals("B")) {%>selected="selected"<%}%>>B</option>
                                        <option value="C" <%if (cl2.getSeccion().equals("C")) {%>selected="selected"<%}%>>C</option>
                                        <option value="D" <%if (cl2.getSeccion().equals("D")) {%>selected="selected"<%}%>>D</option>
                                        <option value="E" <%if (cl2.getSeccion().equals("E")) {%>selected="selected"<%}%>>E</option>

                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="Condicion" class="col-sm-2 control-label">*Condicion: </label>
                                <div class="col-sm-3">
                                    <select name="condicion" id="condicion" class="form-control" title="condicion">
                                        <option value="0" <%if (cl2.getCondicion().equals("0")) {%>selected="selected"<%}%>>0</option>
                                        <option value="1" <%if (cl2.getCondicion().equals("1")) {%>selected="selected"<%}%>>1</option>
                                    </select>
                                </div>
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
     <%}%> 
     
            <script>
            $(function () {
                $("#tablaLector").DataTable({
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

