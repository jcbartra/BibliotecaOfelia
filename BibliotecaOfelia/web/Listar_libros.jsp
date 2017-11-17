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
        int cont = 0, cont2 = 0, cont3 = 0;
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
        if (subcate.equals("x")) {
            //subcategoria
            subcategoria sc = new subcategoria();
            n_subcategoria nsc = new n_subcategoria();
            sc.setIdcategoria(cate);
            nsc.setSc(sc);
            nsc.Min_Subcategoria();
            String minsubcat = sc.getIdsubcategoria();

            subcate = minsubcat;

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


    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <%@include file="include/header.jsp" %>

            <%@include file="include/aside.jsp" %>


            <div class="content-wrapper">
                <section class="content-header">
                    <h1 class="epic-nav-item-heading " aria-selected="true">
                        MÓDULO Listar Libros
                        <small>Listar Libros</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="Ejemplar.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Listado Libros</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <a href="Inicio.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-backward"></i> Regresar</a> &nbsp;&nbsp;&nbsp;
                                <a href="Listar_libros.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-refresh"></i> Actualizar</a> &nbsp;&nbsp;&nbsp;
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
                                        <h3 class="box-title"> Vista Libros</h3>
                                        <div class="box-tools pull-right"></div>
                                    </div>

                                    <div class="">

                                        <div class="container-fluid">

                                            <div class="col-lg-12">
                                                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">

                                                    <div class="table-responsive">

                                                        <div class="col-lg-12" align="center">
                                                            <form action="Listar_libros.jsp" name="form2" method="post">
                                                                <div class="col-lg-12" align="center">
                                                                    <input type="hidden" name="s1" value="<%=cate%>">
                                                                    SubCategoría: <select id="destino" name="destino" onchange="document.form2.submit();">
                                                                        <%
                                                                            subcategoria sc=new subcategoria();
                                                                                n_subcategoria nsc=new n_subcategoria();
                                                                                nsc.setSc(sc);

                                                                           ArrayList lsc=nsc.Subcategorias_Especifica(cate);
                                                                           for(int s=0;s<lsc.size();s++){
                                                                            subcategoria scat=(subcategoria) lsc.get(s);
                                                                           System.out.println(scat.getNombre());
                                                                        %>

                                                                                <option value='<%=scat.getIdsubcategoria()%>' <%if(scat.getIdsubcategoria().equals(subcate)){%>selected<%}%>><%=scat.getNombre()%></option>

                                                                        <%}%>

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





        <%@include file="include/recursos.jsp" %>
    </body>
</html>

