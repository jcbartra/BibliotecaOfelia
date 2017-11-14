
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="include/head.jsp" %>
    <%@include file="include/mensaje.jsp" %>
    <%
    
        String idproveedor="";    
        int cont2 = 0;
    
        proveedor p = new proveedor();
        n_proveedor np=new n_proveedor();
        np.setP(p);
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
                        REGISTRO DE PROVEEDORES
                        <small>Proveedor</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="inicio.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Sistema</li>
                        <li class="active">Proveedor</li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="col-md-12">
                                
                            <button class="btn btn-primary" data-toggle="modal" data-target="#addProveedor">
                                <i class="fa fa-plus-circle" aria-hidden="true"></i> Registrar Proveedor
                            </button>

                            <a href="Proveedor.jsp" class="btn btn-primary">
                                <i class="glyphicon glyphicon-refresh"></i> Actualizar</a>
                                &nbsp;&nbsp;&nbsp;
                            <label class="<%=style%>"><%=mensaje%></label>

                            <br><br>
                            </div>
                        </div>

                    </div>

                    

                    <section class="content">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="box collapsed-box">
                                    <div class="box-header with-border">
                                        <center><h3 class="box-title">Registro de Proveedores</h3></center>
                                        <div class="box-tools pull-right">
                                        </div>
                                    </div>
                                    <div class="">
                                        <div class="container-fluid">
                                            <div class="col-lg-12">
                                                <div class="table-responsive">
                                                    <table id="tablaProveedor" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                        <thead>
                                                            <tr role="row">
                                                            <th><center>N°</center></th>
                                                            <th><center>Proveedor</center></th>
                                                            <th><center>Acción</center></th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <%
                                                                int cont = 0;
                                                                    ArrayList pe= np.Proveedores();
                                                                    for(int i=0; i<pe.size(); i++){
                                                                       proveedor pl=(proveedor) pe.get(i); 
                                                                       cont++;
                                                            %>
                                                            <tr role="row" class="odd">
                                                                    <td class="sorting_1"><%=cont%></td>
                                                                    <td><%= pl.getProveedor()%></td>
                                                                                                                                   
                                                                <td>
                                                            <center>
                                                                <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar<%=pl.getIdproveedor()%>"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
                                                                <a class="btn btn-danger btn-xs" data-toggle="modal" data-target="#eliminar<%=pl.getIdproveedor()%>" role="button"><i class="fa fa-trash" aria-hidden="true"></i> </a>
                                                             
                                                                <div class="modal fade modal-banco-first" id="eliminar<%=pl.getIdproveedor()%>">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">

                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" id="close<%=pl.getIdproveedor()%>" aria-hidden="true">&times;</button>
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
                                                                                <form  action="ControlProveedor" method="post">
                                                                                    <input type="hidden" name="op" value="delete_Proveedor">
                                                                                    <input type="hidden" name="idproveedor" value="<%=pl.getIdproveedor()%>">
                                                                                    <button type="submit" class="btn btn-danger danger"><i class="fa fa-trash" aria-hidden="true"></i> Eliminar</button>
                                                                                    <button type="button" class="btn btn-default" id="closemodal<%=pl.getIdproveedor()%>">Cancelar</button>  
                                                                                </form>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                                
                                                                                <script type="text/javascript">
                                                                    $('#close<%=pl.getIdproveedor()%>').click(function() {
                                                                    $('#eliminar<%=pl.getIdproveedor()%>').modal('hide');
                                                                });
                                                                    $('#closemodal<%=pl.getIdproveedor()%>').click(function() {
                                                                    $('#eliminar<%=pl.getIdproveedor()%>').modal('hide');
                                                                });
                                                                </script>  
                                                                
<!-- Actualizar Periodo-->
        <%
            for(int d=0; d<pe.size(); d++){
                proveedor pr=(proveedor) pe.get(d); 
                idproveedor=pr.getIdproveedor();
                cont2++;
                
        %>
        <div class="modal fade" id="editar<%=idproveedor%>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Actualizar Proveedor</h4>
                    </div>
                    <div class="modal-body">

                        <form action="ControlProveedor" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="update_Proveedor">
                            <input type="hidden" name="idproveedor" value="<%=idproveedor%>">

                            <div class="form-group">
                                <label for="nombreproveedor" class="col-sm-2 control-label">*Proveedor: </label>
                                <div class="col-sm-3">
                                    <input name="proveedor" type="text" autocomplete="off" class="form-control" placeholder="Proveedor" title="Proveedor" value="<%=pr.getProveedor()%>" onkeypress="return validaL(event);">
                                </div>

                            <div class="modal-footer">
                                <button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i> Actualizar</button>
                                <a class="btn btn-default" data-dismiss="modal"><i class="fa fa-close" aria-hidden="true"></i> Cerrar</a>
                            </div>
                                </div>
                        </form>
                    
                </div>
            </div>
          </div>
        </div>
        <%}%>

        </center>
        </td>
        </tr>
                                                       
        <%}%>
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
            </div>
                                                        
            <%@include file="include/footer.jsp" %>
            </div>
            
            <!-- Registro Proveedores-->
        <div class="modal fade" id="addProveedor" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="ion-person-add"></i> Agregar Proveedor</h4>
                    </div>

                    <div class="modal-body">
                       
                        <form action="ControlProveedor" method="post" class="form-horizontal">
                            <input type="hidden" name="op" value="add_Proveedor">

                            <div class="form-group">
                                <label for="nombreProveedor" class="col-sm-2 control-label">*Proveedor: </label>
                                <div class="col-sm-3">
                                    <input name="proveedor" type="text" autocomplete="off" class="form-control" placeholder="Proveedor" title="Proveedor" onkeypress="return validaL(event);">
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

<script>
            $(function () {
                $("#tablaProveedor").DataTable({
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