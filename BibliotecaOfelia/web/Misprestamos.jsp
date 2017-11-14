<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="include/head.jsp" %>
    <script>
        function recargarSubcat(id) {
              
            var xhttp; 
            if (id == "") {
              document.getElementById("subcat").innerHTML = "";
              return;
            }
            xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
              if (this.readyState == 4 && this.status == 200) {
              document.getElementById("subcat").innerHTML = this.responseText;
              }
            };
            xhttp.open("GET", "procesos/BusquedaCategoria.jsp?id="+id, true);
            xhttp.send();
          }
          
    </script>
    <%@include file="include/mensaje.jsp" %>
    <%
        String estado =(String)request.getParameter("estado");if(estado==null){estado="1";}
        String datos =(String)request.getParameter("datos");if(datos==null){datos="%";}
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

        categoria c=new categoria();
        n_categoria nc=new n_categoria();
        nc.setC(c);
        
         //categorias
         String[][] categoria=new String[100][3];
         int contct;
         ArrayList lct=nc.Categorias_Generales();
         for(contct=0;contct<lct.size();contct++){
         categoria cat=(categoria) lct.get(contct);
         categoria[contct][1]=cat.getIdcategoria();
         categoria[contct][2]=cat.getNombre();
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
                        MÓDULO MIS PRESTAMOS
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="Inicio.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Mis Préstamos</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-12">
                                <a href="Misprestamos.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-refresh"></i> Actualizar</a> &nbsp;&nbsp;&nbsp;
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
                                                            <form name="form2" action="Misprestamos.jsp" method="get">
                                                                <select name="estado" onchange="document.form2.submit();" class="form-control">
                                                                    <option value="1" <%if(estado.equals("1")){%>selected<%}%>>Activos</option>
                                                                    <option value="2"<%if(estado.equals("2")){%>selected<%}%>>Entregados</option>
                                                                </select>
                                                            </form>
                                                                
                                                        </div>
                                                        <div class="form-group col-lg-6" align="left">
                                                            <form name="form1" action="Misprestamos.jsp" method="post">
                                                                <select <%if(estado.equals("2")){%>disabled<%}%> name="datos" onchange="document.form1.submit();" class="form-control">
                                                                    <option value="%" <%if(datos.equals("%")){%>selected<%}%>>Todos</option>
                                                                    <option value="3"<%if(datos.equals("3")){%>selected<%}%>>En Tiempo</option>
                                                                    <option value="2"<%if(datos.equals("2")){%>selected<%}%>>A Entregar</option>
                                                                    <option value="1"<%if(datos.equals("1")){%>selected<%}%>>Fuera de Tiempo</option>
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
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%
                                                                    String color="";
                                                                    pd.setIdlector(idusuario);
                                                                    pd.setDato(datos);
                                                                    pd.setEstado(estado);
                                                                    ArrayList rdp = npd.detalle_prestamo_especifico();
                                                                    for (int i = 0; i < rdp.size(); i++) {
                                                                        prest_detalle pdt = (prest_detalle) rdp.get(i);
                                                                        cont++;
                                                                        if(pdt.getDato().equals("1")){color="red";}
                                                                        if(pdt.getDato().equals("2")){color="yellow";}
                                                                        if(pdt.getDato().equals("3")){color="green";}

                                                                %>
                                                                <tr role="row" class="odd">
                                                                    <td class="sorting_1"><a class="btn btn-xs" <%if(estado.equals("1")){%>style="background: <%= color%>;"<%}%>>&nbsp;&nbsp;</a></td>
                                                                    <td><%= pdt.getLector()%></td>
                                                                    <td><%= pdt.getEjemplar()%></td>
                                                                    <td align="center"><%= pdt.getUsuario()%></td>
                                                                    <td align="center"><%= pdt.getFech_dev()%></td>
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
