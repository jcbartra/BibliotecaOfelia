
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="include/head.jsp" %>
    <%@include file="include/mensaje.jsp" %>
    <%        int cont = 0;
        //ubigeo 
        String id = (String) request.getParameter("id");
        ubigeo ub = new ubigeo();
        n_ubigeo nub = new n_ubigeo();
        nub.setUb(ub);
        //pais
        pais pa = new pais();
        n_pais npa = new n_pais();
        npa.setPa(pa);
        //departamentos
        departamento dep = new departamento();
        n_departamento ndep = new n_departamento();
        ndep.setDep(dep);
        String[][] departamento = new String[100][3];
        int contde;
        ArrayList lde = ndep.Listar_departamento();
        for (contde = 0; contde < lde.size(); contde++) {
            departamento depa = (departamento) lde.get(contde);
            departamento[contde][1] = depa.getIddepartamento();
            departamento[contde][2] = depa.getNombre();
            //out.println(dep.getNombre()+"<br />");
        }
    %>
    <%    ArrayList ldepa = ndep.Mostrar_departamento(id);
        for (int s = 0; s < ldepa.size(); s++) {
            departamento depa = (departamento) ldepa.get(s);
            System.out.println(depa.getNombre());
    %> 
    <option value='<%=depa.getIddepartamento()%>'><%=depa.getNombre()%></option>
    <%}%>
    <%    ArrayList lub = nub.Ubigeos_Especifica(id);
        for (int f = 0; f < lub.size(); f++) {
            ubigeo subi = (ubigeo) lub.get(f);
            System.out.println(subi.getNombre());
    %>  
    <option value='<%=subi.getIdubigeo()%>'><%=subi.getNombre()%></option>
    <%}%>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
    <script src="http://www.google.com/jsapi"></script>
    <script src="../Recursos/js/jquery-2.2.3.min.js" type="text/javascript"></script>

    <%

        String[][] pais = new String[100][3];
        int contpa;
        ArrayList lpa = npa.Listar_pais();
        for (contpa = 0; contpa < lpa.size(); contpa++) {
            pais pai = (pais) lpa.get(contpa);
            pais[contpa][1] = pai.getIdpais();
            pais[contpa][2] = pai.getNombre();
            //out.println(pa.getNombre()+"<br />");
        }

    %>
    <script language="javascript">
        function recargarPrimero() {
            var id = document.getElementById("s1").value;
            var xhttp;
            if (id == "") {
                document.getElementById("destino").innerHTML = "";
                return;
            }
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("destino").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "procesardepartamento.jsp?id=" + id, true);
            xhttp.send();
        }
        function recargar(id) {

            var xhttp;
            if (id == "") {
                document.getElementById("destino").innerHTML = "";
                return;
            }
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("destino").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "procesardepartamento.jsp?id=" + id, true);
            xhttp.send();
        }
    </script>

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
                            <button class="btn btn-primary" data-toggle="modal" data-target="#addPais">
                                <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Pais</button>
                            <button class="btn btn-primary" data-toggle="modal" data-target="#addDepartamento">
                                <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Departamento</button>
                            <a class="btn btn-primary" href="Ubigeo.jsp"><i class="glyphicon glyphicon-refresh"></i> Actualizar</a>
                        </div>

                    </div>

                    <section class="content">
                        <div class="row">
                            <div class="col-md-12">
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
                                                        <th><center>ver</center></th>
                                                        <th><center>Acciones</center></th>
                                                        </tr>

                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                ArrayList rc = nub.Listar_Ubigeo();
                                                                for (int i = 0; i < rc.size(); i++) {
                                                                    ubigeo ubi = (ubigeo) rc.get(i);

                                                                    cont++;

                                                            %>
                                                            <tr role="row" class="odd">
                                                                <td class="sorting_1"><%=cont%></td>
                                                                <td><%= ubi.getNombre()%></td>
                                                                <td><%= ubi.getCod()%></td>
                                                                <td><%= ubi.getIddepartamento()%></td>
                                                                <td><%= ubi.getIdpais()%></td>
                                                                <td><center><a class="btn btn-default btn-xs" data-toggle="modal" data-target="#ver<%=cont%>" ><i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i></a></center></td>                                                 
                                                        <td>
                                                        <center>
                                                            <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar<%=ubi.getIdubigeo()%>" ><i class="fa fa-pencil" aria-hidden="true" onclick="recargarini<%=ubi.getIdubigeo()%>()"></i> </a>
                                                            <a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#eliminar<%=cont%>" role="button"><i class="fa fa-trash" aria-hidden="true"></i> </a>
                                                            <!---------------------------------------------------------VER PAIS----------------------->

                                                            <div class="modal fade" id="ver<%=cont%>" tabindex="-1" role="dialog">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">

                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                            <!---------------------------------MODIFICAR-------------------------------->
                                                                            <h4 class="modal-title"><i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i> Ver caracteristicas de <%=ubi.getNombre()%></h4>
                                                                        </div>

                                                                        <div class="modal-body">

                                                                            <form action="ControlUbigeo" method="post" class="form-horizontal">
                                                                                <input type="hidden" name="op" value="update_Ubigeo">
                                                                                <input type="hidden" name="idubigeo" value="<%=ubi.getIdubigeo()%>">
                                                                                <div class="form-group">
                                                                                    <label for="" class="col-sm-5 control-label ">*Nombre :</label>
                                                                                    <center> <div class="col-sm-5 ">
                                                                                            <%=ubi.getNombre()%>
                                                                                        </div></center>                                                                                        
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="" class="col-sm-5 control-label ">*Codigo :</label>
                                                                                    <center> <div class="col-sm-5 ">
                                                                                            <%=ubi.getCod()%>
                                                                                        </div></center>                                                                                        
                                                                                </div>  
                                                                                <div class="form-group">
                                                                                    <label for="" class="col-sm-5 control-label ">*Departamento :</label>
                                                                                    <center> <div class="col-sm-5 ">
                                                                                            <%=ubi.getIddepartamento()%>
                                                                                        </div></center>                                                                                        
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="" class="col-sm-5 control-label ">*Pais :</label>
                                                                                    <center> <div class="col-sm-5 ">
                                                                                            <%=ubi.getIdpais()%>
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
                                                                                <input type="hidden" name="op" value="delete_Ubigeo">
                                                                                <input type="hidden" name="idubigeo" value="<%=ubi.getIdubigeo()%>">
                                                                                <button type="submit" class="btn btn-danger danger"><i class="fa fa-trash" aria-hidden="true"></i> Eliminar</button>
                                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>  
                                                                            </form>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>

                                                            <!-- *****************************************************************************************Actualizar Ubigeo***************************************************************************************************** -->
                                                            <%
                                                                String idubigeo = "";
                                                                int cont2 = 0;
                                                                for (int l = 0; l < rc.size(); l++) {
                                                                    ubigeo ubig = (ubigeo) rc.get(l);
                                                                    idubigeo = ubig.getIdubigeo();
                                                                    cont2++;

                                                            %>
                                                            <div class="modal fade" id="editar<%=idubigeo%>" tabindex="-1" role="dialog">
                                                                <div class="modal-dialog" role="document">
                                                                    <div class="modal-content">

                                                                        <div class="modal-header">
                                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                            <h4 class="modal-title"><i class="fa fa-pencil" aria-hidden="true"></i> Actualizar Ubigeo</h4>
                                                                        </div>

                                                                        <div class="modal-body">
                                                                            <form action="ControlUbigeo" method="post" class="form-horizontal">
                                                                                <input type="hidden" name="op" value="update_Ubigeo">
                                                                                <input type="hidden" name="idubigeo" value="<%=idubigeo%>">

                                                                                <div class="form-group">
                                                                                    <label for="ubigeo" class="col-sm-5 control-label">* Nombre:</label>
                                                                                    <div class="col-sm-4">
                                                                                        <input name="nombre" type="text" autocomplete="off" class="form-control" value="<%=ubig.getNombre()%>">
                                                                                    </div></div>
                                                                                <div class="form-group">
                                                                                    <label for="ubigeo" class="col-sm-5 control-label">* Codigo:</label>
                                                                                    <div class="col-sm-4">
                                                                                        <input name="codigo" type="text" autocomplete="off" class="form-control" value="<%=ubig.getCod()%>">
                                                                                    </div>
                                                                                </div>
                                                                                <div class="form-group">
                                                                                    <label for="" class="col-sm-5 control-label">*Pais:</label>
                                                                                    <div class="col-sm-4">
                                                                                        <select onChange="recargar<%=idubigeo%>()" name="s1" id="s1<%=idubigeo%>">
                                                                                            <option value='0'>Selecciona una opcion</option>
                                                                                            <%for (int r = 0; r < contpa; r++) {%>
                                                                                            <option value='<%=pais[r][1]%>'<%if(ubig.getPais().equals(pais[r][1])){%> selected <%}%>><%=pais[r][2]%></option>
                                                                                            <%}%>
                                                                                        </select>
                                                                                    </div> 
                                                                                        <br></br>
                                                                                    <label for="" class="col-sm-5 control-label">*Departamento:</label>
                                                                                    <div class="col-sm-4">
                                                                                        <input type="hidden" id="sub<%=idubigeo%>" value="<%=ubig.getDepartamento()%>">
                                                                                        <select name="destino" id="destino<%=idubigeo%>">
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
                                                                                        
                                                           <script language="javascript">
                                                                function recargar<%=idubigeo%>() {
                                                                    var id=document.getElementById("s1<%=idubigeo%>").value;
                                                                    var xhttp;
                                                                    if (id == "") {
                                                                        document.getElementById("destino<%=idubigeo%>").innerHTML = "";
                                                                        return;
                                                                    }
                                                                    xhttp = new XMLHttpRequest();
                                                                    xhttp.onreadystatechange = function () {
                                                                        document.getElementById("destino<%=idubigeo%>").innerHTML = this.responseText;
                                                                    };
                                                                    xhttp.open("GET", "procesardepartamento.jsp?id=" + id, true);
                                                                    xhttp.send();
                                                                }
                                                                
                                                                function recargarini<%=idubigeo%>() {

                                                                    var id = document.getElementById("s1<%=idubigeo%>").value;
                                                                    var sub = document.getElementById("sub<%=idubigeo%>").value;
                                                                    var xhttp;
                                                                    if (id == "") {
                                                                        document.getElementById("destino<%=idubigeo%>").innerHTML = "";
                                                                        return;
                                                                    }
                                                                    xhttp = new XMLHttpRequest();
                                                                    xhttp.onreadystatechange = function () {
                                                                        document.getElementById("destino<%=idubigeo%>").innerHTML = this.responseText;
                                                                    };
                                                                    xhttp.open("GET", "procesardepartamento.jsp?id=" + id+"&sub="+sub, true);
                                                                    xhttp.send();
                                                                }
                                                                
                                                            </script>                             
                                                                                        
                                                            <%}%>
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
                <!------------------------otro listar------------------------------>

                <!------------------------otro listar------------------------------>
            </div>
            <!----------------------del listar------------------->                                            
            <!--Registro de Ubigeo-->
            <div class="modal fade" id="addUbigeo" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><i class="fa fa-plus-circle" aria-hidden="true"></i> Agregar Ubigeo</h4>
                        </div>

                        <div class="modal-body">
                            <form action="ControlUbigeo" method="post" class="form-horizontal">
                                <input type="hidden" name="op" value="insertUbigeo">
                                <div class="form-group">
                                    <label for="" class="col-sm-2 control-label" style="padding: 0px;">*Pais:</label>
                                    <div class="col-sm-4">
                                        <select onChange="recargar(this.value)" name="s1" id="s1">
                                            <option value='0'>Selecciona una opcion</option>
                                            <%for (int x = 0; x < contpa; x++) {%>
                                            <option value='<%=pais[x][1]%>'><%=pais[x][2]%></option>
                                            <%}%>
                                        </select>
                                    </div>    
                                    <label for="" class="col-sm-2 control-label" style="padding: 0px;">*Departamento:</label>
                                    <div class="col-sm-3">
                                        <select name="iddepartamento" id="destino">
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="nombre" class="col-sm-2 control-label">*Distrito:</label>
                                    <div class="col-sm-4">
                                        <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Nombre del Ubigeo">
                                    </div>
                                    <label for="codigo" class="col-sm-2 control-label">*Ubigeo:</label>
                                    <div class="col-sm-4">
                                        <input name="cod" type="text" autocomplete="off" class="form-control" placeholder="Ingrese Codigo">
                                    </div>
                                </div>
                                <!--<div class="form-group">       
                                    <label for="ubigeo" class="col-sm-2 control-label">*Departamento:</label>
                                    <div class="col-sm-4">
                                        <input name="ubigeo" type="text" autocomplete="off" class="form-control" placeholder="Seleccione Departamento">
                                    </div></div>
                                <div class="modal-footer">-->
                                <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i> Registrar</button>
                                <a class="btn btn-default" data-dismiss="modal"><i class="fa fa-close" aria-hidden="true"></i> Cerrar</a>
                            </form>
                        </div>
                    </div>
                </div>
            </div>

            <!--Registro de Pais-->
            <div class="modal fade" id="addPais" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><i class="fa fa-plus-circle" aria-hidden="true"></i> Agregar Pais</h4>
                        </div>


                        <div class="modal-body">
                            <form action="ControlPais" method="post" class="form-horizontal">
                                <input type="hidden" name="op" value="add_Pais">
                                <div class="form-group">
                                    <label for="nombre" class="col-sm-2 control-label">*Nombre:</label>
                                    <div class="col-sm-4">
                                        <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Nombre del Ubigeo">
                                    </div>
                                    <label for="cod" class="col-sm-2 control-label">*Codigo:</label>
                                    <div class="col-sm-4">
                                        <input name="cod" type="text" autocomplete="off" class="form-control" placeholder="Ingrese Codigo">
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

            <!--Registro de Departamento-->
            <div class="modal fade" id="addDepartamento" tabindex="-1" role="dialog">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                            <h4 class="modal-title"><i class="fa fa-plus-circle" aria-hidden="true"></i> Agregar Departamento</h4>
                        </div>

                        <div class="modal-body">
                            <form action="ControlDepartamento" method="post" class="form-horizontal">
                                <input type="hidden" name="op" value="add_Departamento">
                                <div class="form-group">                                    
                                    <label for="" class="col-sm-2 control-label ">* Pais:</label>
                                    <div class="col-sm-4">
                                        <select name="idpais" id="iconos" class="form-control" title="Pais">
                                            <option value="" hidden="hidden"<%if (pa.getIdpais() == null) {%>selected="selected"<%}%>>Selecionar</option>
                                            <%
                                                for (int x = 0; x < lpa.size(); x++) {
                                                    pais atp = (pais) lpa.get(x);
                                            %>
                                            <option value="<%=atp.getIdpais()%>"<%if (atp.getIdpais().equals(ub.getIdpais())) {%>selected="selected"<%}%>><%=atp.getNombre()%></option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                    <label for="nombre" class="col-sm-2 control-label">*Nombre:</label>
                                    <div class="col-sm-4">
                                        <input name="nombre" type="text" autocomplete="off" class="form-control" placeholder="Ingrese nombre">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="cod" class="col-sm-2 control-label">*Codigo:</label>
                                    <div class="col-sm-4">
                                        <input name="cod" type="text" autocomplete="off" class="form-control" placeholder="Ingrese Codigo">
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
            <!--Fin de Departamento-->                            

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

        <script language="javascript">
            function recargarPrimero() {

                var id = document.getElementById("s1").value;
                var xhttp;
                if (id == "") {
                    document.getElementById("destino").innerHTML = "";
                    return;
                }
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("destino").innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "procesardepartamento.jsp?id=" + id, true);
                xhttp.send();
            }
            function recargar(id) {

                var xhttp;
                if (id == "") {
                    document.getElementById("destino").innerHTML = "";
                    return;
                }
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("destino").innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "procesardepartamento.jsp?id=" + id, true);
                xhttp.send();
            }
        </script>
        <%@include file="include/recursos.jsp" %>

    </body>

</html>

