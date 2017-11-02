<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%//jsp:useBean id="ListarCategorias" scope="request" type="java.util.List<VistaCategorias>"/%>

<!DOCTYPE html>
<html>
    <%@include file="include/head.jsp" %>
    <%
        lector l = new lector();
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
                        <li><a href="inicio.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Registro</li>
                        <li class="active">Registrar Lector</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">

                        <div class="col-md-12">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#addCategoria">
                                <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Lector
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
                                        <h3 class="box-title"> Registro de Lector</h3>
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
                                                            <th><center>Persona</center></th>
                                                            <th><center>Genero</center></th>
                                                            <th><center>Tipo</center></th>
                                                            <th><center>N° Documento</center></th>
                                                            <th><center>Estado</center></th>
                                                            
                                                            </tr>
                                                            
                                                            
                                                           
                                                            
                                                            
                                                            
                                                            </thead>

                                                            <tbody>
                                                                <% int cont = 0;
                                                                    ArrayList rc = nl.Mostrar_Lector();
                                                                    for (int i = 0; i < rc.size(); i++) {
                                                                        lector cl = (lector) rc.get(i);
                                                                        cont++;

                                                                %>
                                                                <tr role="row" class="odd">
                                                                    <td class="sorting_1"><%= cont%></td>            
                                                                    <td><%= cl.getIdpersona()%></td>
                                                                    
                                                                    <td><%= cl.getGenero()%></td>
                                                                    <td><%= cl.getIdtipo()%></td>
                                                                    <td><%= cl.getNdoc()%></td>
                                                                    <td><%= cl.getEstado()%></td>
                                                                    




                                                                    <td align="center"><a class="btn btn-default btn-xs" data-toggle="modal" data-target="#ver<%=cl.getIdlector()%>"><i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i> </a>
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
                                                                                <form  action="ControlPersona" method="post">
                                                                                    <input type="hidden" name="op" value="eliminar">
                                                                                    <input type="hidden" name="id" value="<%=cl.getIdlector()%>">
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
                        <h4 class="modal-title"><i class="ion-person-add"></i> Agregar Lector</h4>
                    </div>

                    <div class="modal-body">

                        <form action="ControlPersona" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="add_Persona">

                            <div class="form-group">
                                <label for="persona" class="col-sm-2 control-label">*Persona: </label>
                                <div class="col-sm-5">
                                    
                                    <select name="idpersona" id="persona" class="form-control" title="Persona">
                                        <option value="" <%if(p.getIdpersona() ==null) {%>selected="selected"<% } %> >Seleccionar</option>
                                        <% 
                                        np.setP(p);
                                            ArrayList bp = np.Buscar_persona();
                                            for (int x = 0; x < bp.size(); x++) {
                                                persona ap = (persona) bp.get(x);
                                        %>
                                        <option value="<%=ap.getIdpersona()%>"<%if (ap.getIdpersona().equals(l.getIdpersona())) {%>selected="selected"<%}%>><%=ap.getNombres()%> <%=ap.getApe_paterno()%> <%=ap.getApe_materno()%></option>
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
                                        <option value="" <%if(t.getIdtipo() ==null) {%>selected="selected"<% } %> >Seleccionar</option>
                                        <% 
                                        nt.setT(t);
                                            ArrayList bt = nt.Buscar_tipo();
                                            for (int x = 0; x < bt.size(); x++) {
                                                tipo at = (tipo) bt.get(x);
                                        %>
                                        <option value="<%=at.getIdtipo()%>"<%if (at.getIdtipo().equals(l.getIdtipo())) {%>selected="selected"<%}%>><%=at.getNombre()%></option>
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
                                     <option value="" <%if(tu.getIdturno() ==null) {%>selected="selected"<% } %> >Seleccionar</option>
                                        <% 
                                        ntu.setTu(tu);
                                            ArrayList btu = ntu.Buscar_turno();
                                            for (int x = 0; x < btu.size(); x++) {
                                                turno atu = (turno) btu.get(x);
                                        %>
                                        <option value="<%=atu.getIdturno()%>"<%if (atu.getIdturno().equals(l.getIdturno())) {%>selected="selected"<%}%>><%=atu.getTurno()%></option>
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
                                        <option value="" <%if(pe.getIdperiodo() ==null) {%>selected="selected"<% } %> >Seleccionar</option>
                                        <% 
                                        npe.setPe(pe);
                                            ArrayList bpe = npe.Buscar_periodo();
                                            for (int x = 0; x < bpe.size(); x++) {
                                                periodo ape = (periodo) bpe.get(x);
                                        %>
                                        <option value="<%=ape.getIdperiodo()%>"<%if (ape.getIdperiodo().equals(l.getIdperiodo())) {%>selected="selected"<%}%>><%=ape.getPeriodo()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="estado_habil" class="col-sm-2 control-label">*Estado habil </label>
                                <div class="col-sm-3">
                                <select name="estado_habil" id="estado_habil" class="form-control" title="estado habil">
                                        <option value="">0</option>
                                        <option value="">1</option>
                                    </select>    
                                </div>

                                <label for="nivel" class="col-sm-2 control-label">*Nivel </label>
                                <div class="col-sm-5">
                                   <select name="nivel" id="nivel" class="form-control" title="nivel">
                                        <option value="Primaria">Primaria</option>
                                        <option value="Secundaria">Secundaria</option>
                                    </select>  
                                </div>
                            </div>


                            <div class="form-group">
                                <label for="Grado" class="col-sm-2 control-label">*Grado: </label>
                                <div class="col-sm-3">
                                   <select name="grado" id="grado" class="form-control" title="grado">
                                       <option value="1" selected="selected">1</option>
                                       <option value="2" selected="selected">2</option>
                                       <option value="3" selected="selected">3</option>
                                       <option value="4" selected="selected">4</option>
                                       <option value="5" selected="selected">5</option>
                                       <option value="6" selected="selected">6</option>
                                    </select>  
                                </div>

                                <label for="seccion" class="col-sm-2 control-label">*Seccion: </label>
                                <div class="col-sm-5">
                                   <select name="seccion" id="seccion" class="form-control" title="seccion">
                                       <option value="A">A</option>
                                       <option value="B">B</option>
                                       <option value="C">C</option>
                                       <option value="D">D</option>
                                       <option value="E">E</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="Condicion" class="col-sm-2 control-label">*Condicion: </label>
                                <div class="col-sm-3">
                                     <select name="condicion" id="condicion" class="form-control" title="condicion">
                                        <option value="">0</option>
                                        <option value="">1</option>
                                    </select>
                                </div>

                                <label for="TeléfonoPersona" class="col-sm-2 control-label">*Estado periodo: </label>
                                <div class="col-sm-5">
                                     <select name="estado_periodo" id="estado_periodo" class="form-control" title="estado periodo">
                                        <option value="">0</option>
                                        <option value="">1</option>
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

        <!--  VER  PERSONA-->
        <%
            int cont1 = 0;
            String idper;
            for (int i = 0; i < rc.size(); i++) {
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
                                                                <table width="308" align="center">
                                                                    <tr>
                                                                        <td colspan="3" align="center" bgcolor="#00FF99"><em><strong>DATOS PERSONALES</strong></em></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td width="143"><img src="../NetBeansProjects/BibliotecaOfelia/BibliotecaOfelia/web/Recursos/img/avatar5.png" width="142" height="114" /></td>
                                                                        <td><%=cp.getNombres()+" "+cp.getApe_paterno()+" "+cp.getApe_materno()%></td>
                                                                    </tr>
                                                                    <tr>

                                                                    </tr>

                                                                    <tr>
                                                                        <td height="33" colspan="2"><strong>PERSONAL</strong></td>

                                                                    </tr>
                                                                    <tr>
                                                                        <td>Fecha Nacimiento:</td>
                                                                        <td><%=cp.getFecha_nacimiento()%></td>
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
                                                                    <tr>
                                                                        <td>&nbsp;</td>
                                                                        <td><input type="submit" name="op" id="button" value="REGRESAR"></td>


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
