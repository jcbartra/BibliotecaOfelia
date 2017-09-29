


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

    <%@include file="include/head.jsp" %>
    
    <%
        categoria c=new categoria();
        n_categoria nc=new n_categoria();
        nc.setC(c);
    %>
    
    <body class="hold-transition skin-blue sidebar-mini">
        <div class="wrapper">

            <%@include file="include/header.jsp" %>
            <!-- Left side column. contains the logo and sidebar -->
            <%@include file="include/aside.jsp" %>

            <!-- Content Wrapper. Contains page content -->
            <div class="content-wrapper">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        BIBLIOTECA
                        <small>Control panel</small>
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href=""><i class="glyphicon glyphicon-home"></i> Inicio</a></li>
                        <li class="active">Página Principal</li>
                    </ol>
                </section>

                <!-- Main content -->
                <section class="content">
                    <!-- Small boxes (Stat box) -->
                    <div class="row">
                    <%
                        ArrayList rc= nc.Categorias_Generales();
                        for(int i=0; i<rc.size(); i++){
                           categoria ct=(categoria) rc.get(i); 
                           
                        
                    %>    
                    <!-- caja que necesito-->
                        <div class="col-lg-3 col-xs-6">
                            <!-- small box -->
                            <div class="small-box bg-<%=ct.getColor()%>">
                                <div class="inner">
                                    <h4><%=ct.getNombre()%></h4>
                                    <%if(ct.getNombre().length()<25){%><br /><%}%>

                                    <p><%=ct.getNroini()%> - <%=ct.getNrofin()%></p>
                                </div>
                                <div class="icon">
                                    <i class="<%=ct.getIcono()%>"></i>
                                </div>
                                <a href="#" class="small-box-footer">Ver Libros <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                        <!-- fin de caja que necesito-->
                        <%}%>
                        
                        
                        

                        
                    </div>
                    <!-- /.row -->
                    <!-- Main row -->
                    <div class="row">
                        <!-- Left col -->
                        <section class="col-lg-7 connectedSortable">

                        </section>

                        <section class="col-lg-5 connectedSortable">
                        </section>
                    </div>
                </section>
            </div>

            
            <%@include file="include/footer.jsp" %>

           
        </div>
           
            <%@include file="include/recursos.jsp" %>
            

    </body>
</html>
