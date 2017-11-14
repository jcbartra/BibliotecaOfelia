<%@page import="biblioteca.ofelia.entidad.libro"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <%@include file="include/head.jsp" %>
    <%@include file="include/mensaje.jsp" %>

    <%
        String cate =(String)request.getParameter("s1");if(cate==null){cate="0001";}
        String subcate =(String)request.getParameter("destino");if(subcate==null){subcate="x";}
        int cont = 0, cont2=0, cont3=0;
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
        if(subcate.equals("x")){
        //subcategoria
        subcategoria sc=new subcategoria();
        n_subcategoria nsc=new n_subcategoria();
        sc.setIdcategoria(cate);
        nsc.setSc(sc);
        nsc.Min_Subcategoria();
        String minsubcat=sc.getIdsubcategoria();
        
        subcate=minsubcat;
        
        }
        //editorial
        editorial ed = new editorial();
        n_editorial ned = new n_editorial();
        ned.setE(ed);
        
        //ejemplar
        ejemplar ej = new ejemplar();
        n_ejemplar nej = new n_ejemplar();
        nej.setE(ej);
        nej.ejemplar_maximo();
        String mxid=ej.getIdejemplar();if(mxid==null){mxid="0";}
        int maxid=Integer.parseInt(mxid)+1;

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


    <body class="hold-transition skin-blue sidebar-mini"  onload="recargarPrimero();">
        <div class="wrapper">

            <%@include file="include/header.jsp" %>

            <%@include file="include/aside.jsp" %>


            <div class="content-wrapper">
                <section class="content-header">
                    <h1 class="epic-nav-item-heading " aria-selected="true">
                        MÓDULO Ejemplar
                        <small>Registrar Ejemplar</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="Ejemplar.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Registro</li>
                        <li class="active">Ejemplar</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <a href="Ejemplar.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-refresh"></i> Actualizar</a> &nbsp;&nbsp;&nbsp;
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
                                        <h3 class="box-title"> Registro de Ejemplares</h3>
                                        <div class="box-tools pull-right"></div>
                                    </div>

                                    <div class="">

                                        <div class="container-fluid">

                                            <div class="col-lg-12">
                                                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                                    
                                                    <div class="table-responsive">
                                                        
                                                        <div class="col-lg-12" align="center">
                                                            <form action="Ejemplar.jsp" name="form1" method="post">
                                                            <div class="col-lg-6" align="right">
                                                            Categoría <input type="hidden" id="s2" value="<%=subcate%>">
                                                            <select onchange="document.form1.submit();" name="s1" id="s1">
                                                            <option value='0'>Selecciona una opcion</option>
                                                            <%for(int x=0; x<contct; x++){%>
                                                            <option value='<%=categoria[x][1]%>' <%if(categoria[x][1].equals(cate)){%>selected<%}%>><%=categoria[x][2]%></option>
                                                            <%}%>
                                                            </select>
                                                            </div>
                                                            </form>
                                                            <form action="Ejemplar.jsp" name="form2" method="post">
                                                            <div class="col-lg-6" align="left">
                                                                <input type="hidden" name="s1" value="<%=cate%>">
                                                            SubCategoría: <select id="destino" name="destino" onchange="document.form2.submit();">

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
                                                            <th><center>Ejemplares</center></th>
                                                            <th><center>Acción</center></th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%
                                                                    lb.setIdcategoria(cate);
                                                                    lb.setIdsubcategoria(subcate);
                                                                    ArrayList rc = lib.Libros_Generales_id();
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
                                                                    <td align="center"><a class="btn btn-default btn-xs" data-toggle="modal" data-target="#ver<%=lbr.getIdlibro()%>"><i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i> </a>
                                                                    </td>
                                                                    <td>


                                                            <center>
                                                                <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar<%=lbr.getIdlibro()%>" onclick="recargarPrimero<%=lbr.getIdlibro()%>();"><i class="fa fa-plus" aria-hidden="true"></i> </a>
                                                            </center>
                                                            <!--Modal Registrar-->
                                                                <div class="modal fade modal-banco-first" id="editar<%=lbr.getIdlibro()%>">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                                <h4 class="modal-title"><i class="fa fa-book" aria-hidden="true"></i> Registrar Ejemplares</h4>
                                                                            </div>
                                                                            <form  action="ControlEjemplar" method="get">
                                                                            <div class="modal-body">
                                                                                <div class="row">

                                                                                    <img src="Recursos/img/Devolver.png" class="col-md-3">

                                                                                    <div class="col-md-9">
                                                                                        <div class="col-sm-12" align="center"><br /></div>
                                                                                        <div class="col-sm-12" align="center"> <h5 style="font-weight: bold;">Registro de Ejemplares</h5></div>
                                                                                        <div class="col-sm-12"><br /></div>
                                                                                        <label for="C_ejemplar" class="col-sm-6 control-label">*Cantidad de Ejemplares: </label>
                                                                                        <div class="col-sm-6">
                                                                                            <input name="cant_ejemplar" id="cant_ejemplar<%=lbr.getIdlibro()%>" type="text" autocomplete="off" onchange="Fin<%=lbr.getIdlibro()%>();" class="form-control" placeholder="Cantidad de Ejemplares" onkeypress="return validaN(event);">
                                                                                        </div>
                                                                                        <br /><br />
                                                                                        <label for="C_inifin" class="col-sm-6 control-label">*Rango de Numeración: </label>
                                                                                        <div class="col-sm-6" align="center">
                                                                                            <input type="hidden" id="ini<%=lbr.getIdlibro()%>" value="<%=maxid%>" >
                                                                                            <b><label><%=maxid%></label> - <label id="fin<%=lbr.getIdlibro()%>"></label></b>
                                                                                        </div>
                                                                                        
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                
                                                                                    <input type="hidden" name="op" value="add_ejemplar">
                                                                                    <input type="hidden" name="idlibro" value="<%=lbr.getIdlibro()%>">
                                                                                    <button type="submit" class="btn btn-primary danger"><i class="fa fa-book" aria-hidden="true"></i> Añadir</button>
                                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>  
                                                                                
                                                                            </div>
                                                                        </form>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--fin de Modal Registrar-->
                                                                
                                                                <script>
            
                                                                function Fin<%=lbr.getIdlibro()%>()
                                                                {
                                                                    var ini = parseInt(document.getElementById("ini<%=lbr.getIdlibro()%>").value);
                                                                    var num = parseInt(document.getElementById("cant_ejemplar<%=lbr.getIdlibro()%>").value);
                                                                    var fin= ini+num-1;
                                                                    document.getElementById("fin<%=lbr.getIdlibro()%>").innerHTML = fin;
                                                                };

                                                            </script>
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

        <!-- Ver Ejemplares-->
        <%for (int i = 0; i < rc.size(); i++) {
        libro lbr = (libro) rc.get(i);
        cont2++;%>
        <div class="modal fade" id="ver<%=lbr.getIdlibro()%>" tabindex="-1" role="dialog">
            <div class="modal-dialog modal-md" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-bookmark"></i> Editar Ejemplares</h4>
                    </div>
                    <div class="modal-body">
                    <table id="tablaEjemplar<%=lbr.getIdlibro()%>" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                <thead>
                                    <tr role="row">
                                        <th><center>N°</center></th>
                                <th><center>Titulo</center></th>
                                <th><center>Autor</center></th>
                                <th><center>Acción</center></th>
                                </tr>
                                </thead>

                                <tbody>
                                    <%
                                        ej.setIdlibro(lbr.getIdlibro());
                                        ArrayList rej = nej.ejemplares_Especificos();
                                        for (int is = 0; is < rej.size(); is++) {
                                            ejemplar ejs = (ejemplar) rej.get(is);
                                            cont3++;

                                    %>
                                    <tr role="row" class="odd">
                                        <td><%= ejs.getIdejemplar()%></td>
                                        <td><%= ejs.getTitulo()%></td>
                                        <td><%= ejs.getAutor()%></td>
                                        <td>
                                        <center>
                                            <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editars<%=ejs.getIdlibro()%>"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
                                            </center>
                                <!--Modal Editar-->
                                    <div class="modal fade modal-banco-first" id="editars<%=ejs.getIdlibro()%>">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <div class="modal-header">
                                                    <button type="button" class="close" id="close1<%=ejs.getIdlibro()%>" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title"><i class="fa fa-book" aria-hidden="true"></i> Registrar Ejemplares</h4>
                                                </div>
                                                <form  action="ControlEjemplar" method="get">
                                                <div class="modal-body">
                                                    hjhbjhb
                                                </div>
                                                <div class="modal-footer">

                                                        <input type="hidden" name="op" value="add_ejemplar">
                                                        <input type="hidden" name="idlibro" value="">
                                                        <button type="button" class="btn btn-default" id="closemodal1<%=ejs.getIdlibro()%>">Cancelar</button>  

                                                </div>
                                            </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!--fin de Modal Registrar-->

      
                                <script type="text/javascript">
                                    $('#close1<%=ejs.getIdlibro()%>').click(function() {
                                    $('#editar<%=ejs.getIdlibro()%>').modal('hide');
                                });
                                    $('#closemodal1<%=ejs.getIdlibro()%>').click(function() {
                                    $('#editar<%=ejs.getIdlibro()%>').modal('hide');
                                });
                                </script> 
                                
                                </td>
                                </tr>
                                <% }%>
                                </tbody>
                            </table>


                            <div class="modal-footer">
                                <a class="btn btn-default"  data-dismiss="modal"><i class="fa fa-close" aria-hidden="true"></i> Cerrar</a>
                            </div>
                        
                    </div>
                </div>
            </div>
        </div>
        <%}%>                            


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
                xhttp.open("GET", "procesos/BusquedaCategoria.jsp?id=" + id+"&subid="+subid, true);
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

