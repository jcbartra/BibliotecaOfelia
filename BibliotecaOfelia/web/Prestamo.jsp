<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="include/head.jsp" %>
    <script>
        function Buscar_titulo() {
            var res = document.getElementById("res").value;
            var con = res.length;
            var xhttp;
            //alert(con);
            if (con > 4) {
                //alert("---------------");
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    document.getElementById("resultado").innerHTML = this.responseText;
                };
                xhttp.open("GET", "procesos/BusquedaEjemplares.jsp?tit=" + res, true);
                xhttp.send();
            }
            else {
                document.getElementById("resultado").innerHTML = "";
                return;
            }
        }
        
        function MostrarP(id) {
            document.getElementById("resultado").innerHTML = "";
            var xhttp;
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                document.getElementById("addPrestamoPersona").innerHTML = this.responseText;
            };
            xhttp.open("GET", "procesos/PrestamoPresona.jsp?id=" + id, true);
            xhttp.send();
        }

    </script>
    <%@include file="include/mensaje.jsp" %>
    <%        String estado = (String) request.getParameter("estado");
        if (estado == null) {
            estado = "1";
        }
        String datos = (String) request.getParameter("datos");
        if (datos == null) {
            datos = "%";
        }
        String idprestamo = "";
        int cont = 0;
        int cont1 = 0;
        int cont3 = 0;

        prest_detalle pd = new prest_detalle();
        n_prest_detalle npd = new n_prest_detalle();
        npd.setPd(pd);

        ejemplar ej = new ejemplar();
        n_ejemplar nej = new n_ejemplar();
        nej.setE(ej);

        categoria c = new categoria();
        n_categoria nc = new n_categoria();
        nc.setC(c);

        //categorias
        String[][] categoria = new String[100][3];
        int contct;
        ArrayList lct = nc.Categorias_Generales();
        for (contct = 0; contct < lct.size(); contct++) {
            categoria cat = (categoria) lct.get(contct);
            categoria[contct][1] = cat.getIdcategoria();
            categoria[contct][2] = cat.getNombre();
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
                        MÓDULO PRESTAMO
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="Inicio.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Préstamo</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#addPrestamo"> <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Préstamo </button>
                                <a href="Prestamo.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-refresh"></i> Actualizar</a> &nbsp;&nbsp;&nbsp;
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
                                        <h3 class="box-title"> Registro de Préstamos</h3>
                                        <div class="box-tools pull-right"></div>
                                    </div>

                                    <div class="">

                                        <div class="container-fluid">

                                            <div class="col-lg-12">
                                                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                                    <div class="table-responsive">
                                                        <div class="form-group col-lg-6" align="right">
                                                            <form name="form2" action="Prestamo.jsp" method="get">
                                                                <select name="estado" onchange="document.form2.submit();" class="form-control">
                                                                    <option value="1" <%if (estado.equals("1")) {%>selected<%}%>>Activos</option>
                                                                    <option value="2"<%if (estado.equals("2")) {%>selected<%}%>>Entregados</option>
                                                                </select>
                                                            </form>

                                                        </div>
                                                        <div class="form-group col-lg-6" align="left">
                                                            <form name="form1" action="Prestamo.jsp" method="post">
                                                                <select <%if (estado.equals("2")) {%>disabled<%}%> name="datos" onchange="document.form1.submit();" class="form-control">
                                                                    <option value="%" <%if (datos.equals("%")) {%>selected<%}%>>Todos</option>
                                                                    <option value="3"<%if (datos.equals("3")) {%>selected<%}%>>En Tiempo</option>
                                                                    <option value="2"<%if (datos.equals("2")) {%>selected<%}%>>A Entregar</option>
                                                                    <option value="1"<%if (datos.equals("1")) {%>selected<%}%>>Fuera de Tiempo</option>
                                                                </select>
                                                            </form>
                                                        </div>
                                                        <br /> 
                                                        <br />
                                                        <div class="form-group col-lg-4" align="right"><a class="btn btn-xs" style="background: green;">&nbsp;&nbsp;</a> <b>En Tiempo</b></div>
                                                        <div class="form-group col-lg-4" align="center"><a class="btn btn-xs" style="background: yellow;">&nbsp;&nbsp;</a> <b>A Entregar</b></div>
                                                        <div class="form-group col-lg-4" align="left"><a class="btn btn-xs" style="background: red;">&nbsp;&nbsp;</a> <b>Fuera de Tiempo</b></div>
                                                        <br />
                                                        <table id="tablaPrestamo" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th><center></center></th>
                                                            <th><center>Lector</center></th>
                                                            <th><center>Ejemplar</center></th>
                                                            <th><center>Registrador</center></th>
                                                            <th><center>Fecha de Devolución</center></th>
                                                            <th><center>Acción</center></th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%
                                                                    String color = "";
                                                                    pd.setDato(datos);
                                                                    pd.setEstado(estado);
                                                                    ArrayList rdp = npd.detalle_prestamo_general();
                                                                    for (int i = 0; i < rdp.size(); i++) {
                                                                        prest_detalle pdt = (prest_detalle) rdp.get(i);
                                                                        cont++;
                                                                        if (pdt.getDato().equals("1")) {
                                                                            color = "red";
                                                                        }
                                                                        if (pdt.getDato().equals("2")) {
                                                                            color = "yellow";
                                                                        }
                                                                        if (pdt.getDato().equals("3")) {
                                                                            color = "green";
                                                                        }

                                                                %>
                                                                <tr role="row" class="odd">
                                                                    <td class="sorting_1"><a class="btn btn-xs" <%if (estado.equals("1")) {%>style="background: <%= color%>;"<%}%>>&nbsp;&nbsp;</a></td>
                                                                    <td><%= pdt.getLector()%></td>
                                                                    <td><%= pdt.getEjemplar()%></td>
                                                                    <td align="center"><%= pdt.getUsuario()%></td>
                                                                    <td align="center"><%= pdt.getFech_dev()%></td>        
                                                                    <td>
                                                            <center><%if (estado.equals("1")) {%>
                                                                <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar<%=pdt.getIdprestamo()%>"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
                                                                <a class="btn btn-primary btn-xs" data-toggle="modal" data-target="#eliminar<%=cont%>" role="button"><i class="fa fa-check" aria-hidden="true"></i> </a>
                                                                <%}%>
                                                                <!--Modal Eliminar-->
                                                                <div class="modal fade modal-banco-first" id="eliminar<%=cont%>">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                                <h4 class="modal-title"><i class="fa fa-book" aria-hidden="true"></i> Confirmar Devolución</h4>
                                                                            </div>
                                                                            <form  action="ControlPrestamo" method="get">
                                                                                <div class="modal-body">
                                                                                    <div class="row">

                                                                                        <img src="Recursos/img/Devolver.png" class="col-md-3">

                                                                                        <div class="col-md-9">
                                                                                            <div class="col-sm-12"><br /></div>
                                                                                            <h5 style="font-weight: bold;">Registro de Prestamo</h5>
                                                                                            <div class="col-sm-12"><br /></div>
                                                                                            <label for="D-Devolucion" class="col-sm-6 control-label">*Detalle de Devolución: </label>
                                                                                            <div class="col-sm-6">
                                                                                                <input name="detalle_devolucion" type="text" autocomplete="off" maxlength="500" class="form-control" placeholder="Detalle Devolucion">:
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="modal-footer">

                                                                                    <input type="hidden" name="op" value="entrega_prestamo">
                                                                                    <input type="hidden" name="idprestamo" value="<%=pdt.getIdprestamo()%>">
                                                                                    <input type="hidden" name="idejemplar" value="<%=pdt.getIdejemplar()%>">
                                                                                    <button type="submit" class="btn btn-primary danger"><i class="fa fa-book" aria-hidden="true"></i> Devolver</button>
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>  

                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--fin de Modal Eliminar-->

                                                                <!--Modal Actualizar-->
                                                                <div class="modal fade modal-banco-first" id="editar<%=pdt.getIdprestamo()%>">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                                <h4 class="modal-title"><i class="fa fa-book" aria-hidden="true"></i> Modificar Fecha Devolución</h4>
                                                                            </div>
                                                                            <form  action="ControlPrestamo" method="get">
                                                                                <div class="modal-body">
                                                                                    <div class="row">

                                                                                        <img src="Recursos/img/Devolver.png" class="col-md-3">

                                                                                        <div class="col-md-9">
                                                                                            <div class="col-sm-12"><br /></div>
                                                                                            <h5 style="font-weight: bold;">Editar Fecha de Prestamo</h5>
                                                                                            <div class="col-sm-12"><br /></div>
                                                                                            <label for="D-Devolucion" class="col-sm-6 control-label">*Fecha de Devolución: </label>
                                                                                            <div class="col-sm-6">
                                                                                                <input name="fecha_entrega" type="date" autocomplete="off" class="form-control">
                                                                                            </div>
                                                                                            <div class="col-sm-12"><br /></div>
                                                                                            <label for="H-Entrega" class="col-sm-5 control-label">*Hora de Devolución: </label>
                                                                                            <div class="col-sm-7">
                                                                                                <input name="hora_entrega" maxlength="2" type="text" autocomplete="off" class="form-control" placeholder="HH" size="2">:
                                                                                                <input name="minuto_entrega" maxlength="2" type="text" autocomplete="off" class="form-control" placeholder="MM" size="2">
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                                <div class="modal-footer">

                                                                                    <input type="hidden" name="op" value="act_prestamo">
                                                                                    <input type="hidden" name="idprest_detalle" value="<%=pdt.getIdprest_detalle()%>">
                                                                                    <button type="submit" class="btn btn-primary danger"><i class="fa fa-book" aria-hidden="true"></i> Modificar</button>
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>  

                                                                                </div>
                                                                            </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--fin de Modal Actualizar-->


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
        <!-- Registro Prestamo Libro-->
        <div class="modal fade" id="addPrestamo" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-ios-book"></i> Agregar Prestamo</h4>
                    </div>

                    <div class="modal-body" align="center">


                        <div class="col-sm-12" >
                            <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                <div class="table-responsive">
                                    <div class="col-lg-12">Buscar: <input type="text" autocomplete="off" class="form-control" placeholder="Buscar Nombre" title="Buscar Nombre" onkeypress="Buscar_titulo();" id="res"></div>
                                    <div class="col-lg-12">&nbsp;</div>
                                    
                                        <div id="resultado">

                                        </div>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <p>&nbsp;</p>
                                    <div class="modal fade" id="addPrestamoPersona" tabindex="-1" role="dialog">
                                            
                                        </div>
                                        <%
                                            ArrayList rej = nej.ejemplar_prestamo();
                                            for (int h = 0; h < rej.size(); h++) {
                                                ejemplar pej = (ejemplar) rej.get(h);
                                                cont1++;

                                        %>
                                        <!-- Registro Prestamo Persona-->
                                        

                                        <script type="text/javascript">
                                            $('#close1<%=pej.getIdejemplar()%>').click(function () {
                                                $('#addPrestamoPersona').modal('hide');
                                            });
                                            $('#closemodal1<%=pej.getIdejemplar()%>').click(function () {
                                                $('#addPrestamoPersona').modal('hide');
                                            });
                                        </script>
                                        <% }%>
                                        
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="modal-footer">
                        <a class="btn btn-default" data-dismiss="modal"><i class="fa fa-close" aria-hidden="true"></i> Cerrar</a>
                    </div>
                </div>
            </div>
        </div>



        <script>
            
            function cargarDni(dni, ejemplar) {
                //alert("---"+dni+"--- "+ejemplar);
                var xhttp;
                if (dni == "") {
                    document.getElementById("mostrarOpcion"+ejemplar).innerHTML = "LLene el Campo Numero Dni";
                    return;
                }
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    document.getElementById("mostrarOpcion"+ejemplar).innerHTML = this.responseText;

                };
                xhttp.open("GET", "procesos/BusquedaDni.jsp?dni=" + dni + "&ejemplar=" + ejemplar, true);
                xhttp.send();
            }
            
            function cargarDatos(nom,pat,mat,ejemplar) {

                var xhttp;
                if (nom == "" & pat == "" & mat == "") {
                    document.getElementById("mostrarOpcion"+ejemplar).innerHTML = "LLene los Campos Nombre, Apellido Paterno o Apellido Materno";
                    return;
                }
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    document.getElementById("mostrarOpcion"+ejemplar).innerHTML = this.responseText;

                };
                xhttp.open("GET", "procesos/BusquedaDatos.jsp?nom=" + nom + "&pat=" + pat + "&mat=" + mat + "&ejemplar=" + ejemplar, true);
                xhttp.send();
            }
            
            function Mostrarl(idpersona,ejemplar) {
                document.getElementById("idpersona"+ejemplar).value = idpersona;
                document.getElementById("botones"+ejemplar).innerHTML = "";
                var div1 = document.getElementById("mostrarRegistro"+ejemplar);
                div1.style.display = 'block';
                var boton = document.getElementById("btnReg"+ejemplar);
                boton.disabled = false;

            }
            function Ocultarl(ejemplar) {
                //alert("aaaaaaaaaaaaaa");
                document.getElementById("dni").value = "";
                document.getElementById("mostrarOpcion"+ejemplar).innerHTML = "aqui se mostrara el resultado";
            }
            
            function Ocultarl2(ejemplar) {
                //alert("aaaaaaaaaaaaaa");
                document.getElementById("nom").value = "";
                document.getElementById("pat").value = "";
                document.getElementById("mat").value = "";
                document.getElementById("mostrarOpcion"+ejemplar).innerHTML = "aqui se mostrara el resultado";
            }
            
            $(function () {
                $("#tablaPrestamo").DataTable({
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
            $(function () {
                $("#tablaRegPrestamo").DataTable({
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
