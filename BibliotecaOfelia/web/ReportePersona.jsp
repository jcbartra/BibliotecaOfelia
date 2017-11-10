
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

                                <a href="ReporttePersona.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-refresh"></i> Actualizar</a> &nbsp;&nbsp;&nbsp;
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
                                        <h3 class="box-title"> Reporte de Personas</h3>
                                        <div class="box-tools pull-right"></div>
                                        <div class="form-group" class="btn btn-primary" class="col-sm-2 control-label">
                                            <div >
                                                <div class="col-sm-3">
                                                    <div >
                                                        <select  class="btn btn-info"   >
                                                            <option value="" hidden="hidden" >Mostar</option>
                                                            <option >Todas las Personas</option>
                                                            <option >Personas Inactivas</option>
                                                            
                                                        </select>
                                                    </div>
                                                </div>

                                            </div> 
                                        </div>
                                    </div>
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

                                                        <th><center>Género</center></th>
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





                                                                
                                                                </td>
                                                                <td>
                                                        <center>
                                                            

                                                            


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
        
        <!-- Registro Persona-->
        

        

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
        

        
        <%@include file="include/recursos.jsp" %>
    </body>
</html>
