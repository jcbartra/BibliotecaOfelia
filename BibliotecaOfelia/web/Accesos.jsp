<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <%@include file="include/head.jsp" %>
    <%@include file="include/mensaje.jsp" %>
    <%
        String idrolp="";
        String idrolp2="";
        String idmenu="";
        String idsubmenu="";
        String submenu="";
        int cont = 0;
        int cont1 = 0;
        int cont2 = 0;
        int cont3 = 0;
        int cont4 = 0;
        
        rolp r=new rolp();
        n_rolp nr=new n_rolp();
        nr.setR(r);
        
        menu mu=new menu();
        n_menu nmnu=new n_menu();
        nmnu.setM(mu);
        
        submenu smnu=new submenu();
        n_submenu nsmnu=new n_submenu();
        nsmnu.setSm(smnu);

        //menu
        String[][] menu=new String[100][4];
        int contm;
        ArrayList lmnu=nmnu.Menu_General();
        for(contm=0;contm<lmnu.size();contm++){
        menu men=(menu) lmnu.get(contm);
        menu[contm][1]=men.getIdmenu();
        menu[contm][2]=men.getNombre();
        menu[contm][3]=men.getRoles();
        }
        
        //menu
        String[][] submenus=new String[100][5];
        int contsm=0;
        ArrayList lsmnu=nsmnu.SubMenuGeneral();
        for(contsm=0;contsm<lsmnu.size();contsm++){
        submenu smen=(submenu) lsmnu.get(contsm);
        submenus[contsm][1]=smen.getIdsubmenu();
        submenus[contsm][2]=smen.getNombre();
        submenus[contsm][3]=smen.getIdmenu();
        submenus[contsm][4]=smen.getRoles();
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
                        MÓDULO ACCESOS
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="Inicio.jsp"><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Sistema</li>
                        <li class="active">Accesos </li>
                    </ol>
                </section>
                <section class="content">
                    <div class="row">
                      <div class="col-md-12">
                        <div class="col-md-12">
                          <a href="Accesos.jsp" class="btn btn-primary"> <i class="glyphicon glyphicon-refresh"></i> Actualizar</a> &nbsp;&nbsp;&nbsp;
                          <label class="<%=style%>"><%=mensaje%></label>
                          <br>
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
                                        <h3 class="box-title"> Registro de Accesos</h3>
                                        <div class="box-tools pull-right"></div>
                                    </div>

                                    <div class="">

                                        <div class="container-fluid">

                                            <div class="col-lg-12">
                                                <div id="example1_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
                                                    <div class="table-responsive">
                                                        <table id="tablaAccesos" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th><center>N°</center></th>
                                                            <th><center>Rol</center></th>
                                                            <th><center>Accesos</center></th>
                                                            <th><center>Accion</center></th>
                                                            </tr>
                                                            </thead>

                                                            <tbody>
                                                                <%
                                                                    ArrayList lr=nr.Roles_Generales();
                                                                    for(int s=0;s<lr.size();s++){
                                                                    rolp rp=(rolp) lr.get(s); 
                                                                    cont++;
                                                                    
                                                                %>
                                                                <tr role="row" class="odd">
                                                                    <td class="sorting_1"><%= cont%></td>
                                                                    <td><%= rp.getRol()%></td>
                                                                    <td align="center"> 
                                                                        <a class="btn btn-default btn-xs" data-toggle="modal" data-target="#ver<%=rp.getIdrol()%>"><i class="glyphicon glyphicon-eye-open" aria-hidden="true"></i> </a>
                                                                    </td>
                                                                    <td align="center">
                                                                        <a class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editar<%=rp.getIdrol()%>"><i class="fa fa-pencil" aria-hidden="true"></i> </a>
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
        
        <!--Ver Accesos-->
        
        <%
            for(int s=0;s<lr.size();s++){
               rolp rp=(rolp) lr.get(s); 
               cont1++;
               idrolp=rp.getIdrol();
               //out.println(idrolp);
        %>
        <div class="modal fade" id="ver<%=idrolp%>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">

                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title"><i class="glyphicon glyphicon-eye-open"></i> Ver Accesos</h4>
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
                                                        <table id="tablaAcceso<%=idrolp%>" name="tablaAcceso" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th><center>N°</center></th>
                                                                    <th><center>Menu</center></th>
                                                                    <th><center>Submenu</center></th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                               
                                                                <%
                                                                       for(int k=0;k<contm;k++){
                                                                           if(menu[k][3].indexOf(idrolp)!=-1)
                                                                           {
                                                                               cont2++;
                                                                           
                                                                %>
                                                                <tr role="row" class="odd" align="center">
                                                                    <td class="sorting_1"><%= cont2%></td>
                                                                    <td><%= menu[k][2]%>
                                                                    </td>
                                                                    <td><%
                                                                    smnu.setRoles(idrolp);
                                                                    smnu.setIdmenu(menu[k][1]);
                                                                    ArrayList lsmu=nsmnu.SubMenuRoles();
                                                                       for(int f=0;f<lsmu.size();f++){
                                                                           submenu smu=(submenu) lsmu.get(f);%>
                                                                            <%=smu.getNombre()%><br />
                                                                        <%}%></td>
                                                                </tr>
                                                            <% }}%>
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
                        </div>
                    </div>
            </div>
        </div>
        <%}%>
        
        <!--Editar Accesos-->
        
        <%
            for(int s=0;s<lr.size();s++){
               rolp rp=(rolp) lr.get(s); 
               cont1++;
               idrolp=rp.getIdrol();
               //out.println(idrolp);
        %>
        <div class="modal fade" id="editar<%=idrolp%>" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
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
                                                        <form action="ControlAccesos" method="post">
                                                        <table id="tablaAcceso<%=idrolp%>" name="tablaAcceso" class="table table-bordered table-striped dataTable" role="grid" aria-describedby="example1_info">
                                                            <thead>
                                                                <tr role="row">
                                                                    <th><center>N°</center></th>
                                                                    <th><center>Menu</center></th>
                                                                    <th><center>Submenu</center></th>
                                                                </tr>
                                                            </thead>

                                                            <tbody>
                                                               
                                                                <%
                                                                       cont3=0;cont4=0;
                                                                       for(int k=0;k<contm;k++){
                                                                       cont3++;    
                                                                %>
                                                                <tr role="row" class="odd" align="center">
                                                                    <td class="sorting_1"><%= cont3%></td>
                                                                    <td><%= menu[k][2]%>
                                                                    </td>
                                                                    <td><%
                                                                    
                                                                    for(int f=0;f<contsm;f++){
                                                                     if(submenus[f][3].equals(menu[k][1])){   
                                                                         cont4++;
                                                                    %>
                                                                    <input type="hidden" name="idmenu<%=idrolp+cont4%>" value="<%=menu[k][1]%>">
                                                                    <input type="hidden" name="idsubmenu<%=idrolp+cont4%>" value="<%=submenus[f][1]%>">
                                                                           <div class="col-md-6 text-left"><%=submenus[f][2]%></div>
                                                                           <div class="col-md-6 text-left"><input type="checkbox" name="seleccion<%=idrolp+cont4%>" value="S" <%if(submenus[f][4].indexOf(idrolp)!=-1){%>checked<%}%>></div>
                                                                           <br />
                                                                        <%}}%></td>
                                                                </tr>
                                                            <% }%>
                                                                <tr role="row" class="odd" align="center">
                                                                    <td><input type="hidden" name="tmenu" value="<%=cont4%>"></td>
                                                                    <td><input type="hidden" name="idrol" value="<%=idrolp%>"></td>
                                                                    <td><button type="submit" class="btn btn-primary"><i class="fa fa-floppy-o" aria-hidden="true"></i> Registrar</button>
                                                                    <a class="btn btn-default" data-dismiss="modal"><i class="fa fa-close" aria-hidden="true"></i> Cerrar</a>
                                                                    </td>
                                                                </tr>
                                                            </tbody>
                                                        </table>
                                                        </form>    
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

        
        <script>
            $(function () {
                $("#tablaAccesos").DataTable({
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
