
<%-- 
    Document   : Libro
    Created on : 30/10/2017, 04:40:23 PM
    Author     : GADEA-JADE
--%>
<%@page import="biblioteca.ofelia.entidad.libro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <%@include file="include/head.jsp" %>
    <%@include file="include/mensaje.jsp" %>


    <%        String cate = (String) request.getParameter("s1");
        if (cate == null) {
            cate = "0001";
        }
        String subcate = (String) request.getParameter("destino");
        if (subcate == null) {
            subcate = "x";
        }
        int cont = 0;
        libro lb = new libro();
        n_libros lib = new n_libros();
        lib.setL(lb);

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
            //out.println(cat.getNombre()+"<br />");
        }

        //editorial
        editorial ed = new editorial();
        n_editorial ned = new n_editorial();
        ned.setE(ed);

        //autor
        autor au = new autor();
        n_autores nau = new n_autores();
        nau.setA(au);

        String[][] autor = new String[100000][3];
        int contau;
        ArrayList lau = nau.autore();
        for (contau = 0; contau < lau.size(); contau++) {
            autor aut = (autor) lau.get(contau);
            autor[contau][1] = aut.getIdAutor();
            autor[contau][2] = aut.getNombre();
        }

        String[][] editorial = new String[100][3];
        int conted;
        ArrayList led = ned.editoriales();
        for (conted = 0; conted < led.size(); conted++) {
            editorial edit = (editorial) led.get(conted);
            editorial[conted][1] = edit.getIdeditorial();
            editorial[conted][2] = edit.getNombre();
        }
    %>


    <style>
        .ions {
            font-size: 30px;
        }
    </style>


    <body class="hold-transition skin-blue sidebar-mini" onload="recargarPrimero();">
        <div class="wrapper">

            <%@include file="include/header.jsp" %>

            <%@include file="include/aside.jsp" %>


            <div class="content-wrapper">
                <section class="content-header">
                    <h1 class="epic-nav-item-heading " aria-selected="true">
                        MÓDULO LIBRO
                        <small>Registrar Libro</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="Libro.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Registro</li>
                        <li class="active">Registrar Libro</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <button class="btn btn-primary" data-toggle="modal" data-target="#addLibro"> <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Libro </button>
                                <a href="Libro.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-refresh"></i> Actualizar</a> &nbsp;&nbsp;&nbsp;
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
                                        <h3 class="box-title"> Registro de Libros</h3>
                                        <div class="box-tools pull-right"></div>
                                    </div>

                                    <div class="">

                                        <div class="container-fluid">

                                            <div class="col-lg-12">
                                                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                                    <div class="table-responsive">
                                                        <div class="col-lg-12" align="center">
                                                            <form action="Libro.jsp" name="form1" method="post">
                                                                <div class="col-lg-6" align="right">
                                                                    Categoría <input type="hidden" id="s2" value="<%=subcate%>">
                                                                    <select onchange="document.form1.submit();" name="s1" id="s1" class="form-control">
                                                                        <option value='0'>Selecciona una opcion</option>
                                                                        <%for (int x = 0; x < contct; x++) {%>
                                                                        <option value='<%=categoria[x][1]%>' <%if (categoria[x][1].equals(cate)) {%>selected<%}%>><%=categoria[x][2]%></option>
                                                                        <%}%>
                                                                    </select>
                                                                </div>
                                                            </form>
                                                            <form action="Libro.jsp" name="form2" method="post">
                                                                <div class="col-lg-6" align="left">
                                                                    <input type="hidden" name="s1" value="<%=cate%>">
                                                                    SubCategoría: <select id="destino" name="destino" onchange="document.form2.submit();" class="form-z">

                                                                    </select>
                                                                </div>
                                                            </form>
                                                            <br /><br />
                                                        </div>
                                                        <table id="tablaLibro" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th><center>N°</center></th>
                                                            <th><center>SubCategoria</center></th>
                                                            <th><center>Editorial</center></th>
                                                            <th><center>Titulo</center></th>
                                                            <th><center>Autor</center></th>
                                                            <th><center>Año Publicación</center></th>
                                                            <th><center>Páginas</center></th>
                                                            <th><center>Acción</center></th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%
                                                                    lb.setIdsubcategoria(subcate);
                                                                    ArrayList rc = lib.Libros_Generales();
                                                                    for (int i = 0; i < rc.size(); i++) {
                                                                        libro lbr = (libro) rc.get(i);
                                                                        cont++;

                                                                %>
                                                                <tr role="row" class="odd">
                                                                    <td><%= cont%></td>
                                                                    <td><%= lbr.getSubcategoria()%></td>
                                                                    <td><%= lbr.getIdeditorial()%></td>
                                                                    <td><%= lbr.getTitulo()%></td>
                                                                    <td><%= lbr.getIdautor()%></td>
                                                                    <td><%= lbr.getAnio_publicacion()%></td>
                                                                    <td><%= lbr.getPaginas()%></td>
                                                                    <td>


                                                            <center>
                                                                <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar<%=lbr.getIdlibro()%>" onclick="recargarPrimero<%=lbr.getIdlibro()%>();"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
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
                                                                                <form  action="ControlLibros" method="post">
                                                                                    <input type="hidden" name="op" value="delete_Libro">
                                                                                    <input type="hidden" name="idlibro" value="<%=lbr.getIdlibro()%>">

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
        
        <!-- Modal Actualizar-->

        <%        int cont2 = 0;
            String idlib2;
            ArrayList rcs = lib.Libros_Generales();
            for (int e = 0; e < rcs.size(); e++) {
                libro li2 = (libro) rcs.get(e);
                idlib2 = li2.getIdlibro();
                cont2++;
        %>
        <div class="modal fade" id="editar<%=idlib2%>" tabindex="-1" role="dialog" >
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-android-sync"></i> Actualizar Libro </h4>
                    </div>
                    <div class="modal-body">
                        <form action="ControlLibros"  method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="update_Libro">
                            <input type="hidden" name="idlibro" value="<%=idlib2%>">

                            <div class="form-group">
                                <div class="col-sm-12">
                                    <label name="categoria" class="col-sm-2 control-label">*Categoría: </label>
                                    <div  class="col-sm-5">
                                        <select onChange="recargar<%=idlib2%>(this.value)" name="s1" id="s1<%=idlib2%>" class="form-control">
                                            <option value='0' hidden="hidden">Selecciona una opcion</option>
                                            <%for (int t = 0; t < contct; t++) {%>
                                            <option value='<%=categoria[t][1]%>'<%if (li2.getIdcategoria().equals(categoria[t][1])) {%>selected="selected"<%}%>><%=categoria[t][2]%></option>
                                            <% }%>
                                        </select>
                                    </div>


                                    <div class="col-sm-5">
                                        <input type="hidden" name="idsub" id="idsub<%=li2.getIdlibro()%>" value="<%=li2.getIdsubcategoria()%>">
                                        <select name="idsub" id="destino<%=li2.getIdlibro()%>" id="subcategoria" id="idsub<%=li2.getIdlibro()%>" value="<%=li2.getIdsubcategoria()%>" title="subcategoria" class="form-control">
                                            <option value="0" hidden="hidden">Selecione subcategoria</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="col-sm-12">
                                    <label for="editorial" class="col-sm-2 control-label">*Editorial: </label>
                                    <div class="col-sm-4">
                                        <select name="ideditorial" id="editorial" class="form-control" title="Editorial">
                                                <option value="0" hidden="hidden" <%if (ed.getIdeditorial()
                                                        == null) {%>selected="selected"<%}%>>Seleccione editorial</option>
                                            <% for (int j = 0; j < conted; j++) {
                                            %>
                                            <option value="<%=editorial[j][1]%>"<%if (li2.getIdeditorial().equals(editorial[j][2])) {%>selected="selected"<% }%>><%=editorial[j][2]%>
                                            </option>
                                            <% }%>

                                        </select>
                                    </div>
                                    <label for="autor" class="col-sm-2 control-label">*Autor: </label>
                                    <div class="btn-group bootstrap-select col-sm-4">
                                                                                            <select name="idautor" id="autor" class="selectpicker form-control" data-live-search="true" tabindex="-98" title="Autor">
                                                                                                <option value="0" hidden="hidden">Seleccione Autor</option>
                                                                                                <% for (int j = 0;
                                                                                                            j < contau;
                                                                                                            j++) {
                                                                                                %>
                                                                                                <option value="<%=autor[j][1]%>"<%if (li2.getIdautor().equals(autor[j][2])) {%>selected="selected"<% }%>><%=autor[j][2]%></option>
                                                                                                <% }%>
                                                                                            </select>
                                                                                        </div>
                                </div>
                            </div>
                            <p style="color: #ffffff; font-size: 5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>

                            <div class="form-group">
                                <label for="tituloLibro" class="col-sm-2 control-label">*Titulo: </label>
                                <div class="col-sm-10">
                                    <input name="titulo" type="text" autocomplete="off" class="form-control" placeholder="Titulo del Libro" title="Titulo del Libro" value="<%= li2.getTitulo()%>" onkeypress="return validaL(event);">
                                </div>
                            </div>
                            <p style="color: #ffffff; font-size: 5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>

                            <div class="form-group">
                                <label for="anio_publicacionLibro" class="col-sm-2 control-label">*Año publicación: </label>
                                <div class="col-sm-4">
                                    <input name="anio_publicacion" type="text" autocomplete="off" class="form-control" placeholder="Año" title="Año" value="<%=li2.getAnio_publicacion()%>" onkeypress="return validaN(event);">
                                </div>

                                <label for="paginasLibro" class="col-sm-2 control-label">*Páginas: </label>
                                <div class="col-sm-4">
                                    <input name="paginas" type="text" autocomplete="off" class="form-control" placeholder="Páginas" title="Páginas" value="<%= li2.getPaginas()%>" onkeypress="return validaN(event);">
                                </div>
                            </div>
                            <p style="color: #ffffff; font-size: 5px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary"><i class="ion-android-sync" aria-hidden="true"></i> Actualizar</button>
                                <a class="btn btn-default" data-dismiss="modal" id="closemodal<%=li2.getIdlibro()%>"><i class="fa fa-close" aria-hidden="true"></i> Cerrar</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>

        <script type="text/javascript">
            function recargar<%=idlib2%>(id) {
                var xhttp;
                if (id == "") {
                    document.getElementById("destino<%=idlib2%>").innerHTML = "";
                    return;
                }
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("destino<%=idlib2%>").innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "procesar.jsp?id=" + id, true);
                xhttp.send();
            }
            function recargarPrimero<%=idlib2%>() {

                var id = document.getElementById("s1<%=idlib2%>").value;
                //alert(id);
                var idsub = document.getElementById("idsub<%=idlib2%>").value;
                //alert(id+"------------"+idsub);
                var xhttp;
                if (id == "") {
                    document.getElementById("destino<%=idlib2%>").innerHTML = "";
                    return;
                }
                xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function () {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("destino<%=idlib2%>").innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "procesar.jsp?id=" + id + "&idsub=" + idsub, true);
                xhttp.send();
            }
        </script>

        <% }%>

        <!-- Registro Libro-->
        <div class="modal fade" id="addLibro" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Agregar Libro</h4>
                    </div>
                    <div class="modal-body">
                        <form action="ControlLibros" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="add_Libro">

                            <div class="form-group">
                                <label name="categoria" class="col-sm-2 control-label">*Categoría: </label>
                                <div class="col-sm-5">
                                    <select onChange="recargar(this.value)" name="s1" id="s1" class="form-control">
                                        <option value='0'>Selecciona una opcion</option>
                                        <%for (int x = 0; x < contct; x++) {%>
                                        <option value='<%=categoria[x][1]%>'><%=categoria[x][2]%></option>
                                        <%}%>
                                    </select>
                                </div>
                                <div class="col-sm-5">
                                    <select name="idsubcategoria" id="destino" id="subcategoria" class="form-control" title="subcategoria">
                                        <option value="0" >Selecione subcategoria</option>

                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="editorial" class="col-sm-2 control-label">*Editorial: </label>
                                <div class="col-sm-4">
                                    <select name="ideditorial" id="editorial" class="form-control" title="Editorial">
                                        <option value="0" hidden="hidden">Seleccione editorial</option>
                                        <% for (int i = 0; i < conted; i++) {
                                        %>
                                        <option value="<%=editorial[i][1]%>"><%=editorial[i][2]%>
                                        </option>
                                        <% }%>

                                    </select>
                                </div>
                                <label for="autor" class="col-sm-2 control-label">*Autor: </label>
                                <div class="btn-group bootstrap-select col-sm-4">
                                    <select name="idautor" id="autor" class="selectpicker form-control" data-live-search="true" tabindex="-98" title="Autor">
                                        <option value="0" hidden="hidden">Seleccione Autor</option>
                                        <% for (int j = 0;
                                                    j < contau;
                                                    j++) {
                                        %>
                                        <option value="<%=autor[j][1]%>"><%=autor[j][2]%></option>
                                        <% }%>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="tituloLibro" class="col-sm-2 control-label">*Titulo: </label>
                                <div class="col-sm-10">
                                    <input name="titulo" type="text" autocomplete="off" class="form-control" placeholder="Titulo del Libro" title="Titulo del Libro" onkeypress="return validaL(event);">
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="anio_publicacionLibro" class="col-sm-2 control-label">*Año publicación: </label>
                                <div class="col-sm-4">
                                    <input name="anio_publicacion" type="text" autocomplete="off" class="form-control" placeholder="Año" title="Año" onkeypress="return validaN(event);">
                                </div>

                                <label for="paginasLibro" class="col-sm-2 control-label">*Páginas: </label>
                                <div class="col-sm-4">
                                    <input name="paginas" type="text" autocomplete="off" class="form-control" placeholder="Páginas" title="Páginas" onkeypress="return validaN(event);">
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

        <script>
            $(function () {
                $("#tablaLibro").DataTable({
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
                var subid = document.getElementById("s2").value;
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
                xhttp.open("GET", "procesos/BusquedaCategoria.jsp?id=" + id + "&subid=" + subid, true);
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
                xhttp.open("GET", "procesos/BusquedaCategoria.jsp?id=" + id, true);
                xhttp.send();
            }
        </script>
        <%@include file="include/recursos.jsp" %>
    </body>
</html>

