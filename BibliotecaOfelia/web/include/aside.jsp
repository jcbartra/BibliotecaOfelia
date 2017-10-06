<%@ page import="biblioteca.ofelia.procesos.*,biblioteca.ofelia.entidad.*"%>
<%@ page import= "java.util.ArrayList"%> 
<aside  class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="<%=foto%>" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><%=usuario%></p>
                <a href="#"><i class="fa fa-circle text-success"></i> Conectado</a>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">MENÚ - PRINCIPAL</li>
            <li>
                <a href="Inicio.jsp">
                    <i class="glyphicon glyphicon-home"></i> <span>Página Principal</span>
                </a>
            </li>
            <%
                submenu sm=new submenu();
                n_submenu nsm=new n_submenu();
                
                menu m=new menu();
                n_menu nm=new n_menu();
                m.setRoles(idrol);
                nm.setM(m);
                ArrayList lm=nm.ListarMenu();

                for(int i=0; i<lm.size(); i++){
                menu mn=(menu) lm.get(i);
                
            %>
            <li class="treeview">
                <a href="<%=mn.getLink()%>">
                    <i class="<%=mn.getIcono()%>"></i>
                    <span><%=mn.getNombre()%></span>
                    <%if(mn.getEstado().equals("1")){%>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    <%}%>
                </a>
                <%if(mn.getEstado().equals("1")){
                    
                    sm.setRoles(idrol);
                    sm.setIdmenu(mn.getIdmenu());
                    nsm.setSm(sm);
                    
                    ArrayList lsm=nsm.ListarSubMenu();
                    for(int e=0; e<lsm.size(); e++){
                    submenu smn=(submenu) lsm.get(e);
                    
                    
                %>
                <ul class="treeview-menu">
                    <li><a href="<%=smn.getLink()%>"><i class="<%=smn.getIcono()%>"></i> <%=smn.getNombre()%></a></li>
                </ul>
                
                <%  }
                  }%>
            </li>
            <!-- 
            <li class="treeview">
                <a href="#">
                    <i class="glyphicon glyphicon-edit"></i>
                    <span>Registro</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="ListarLibro"><i class="fa fa-book"></i> Libro</a></li>
                </ul>
                <ul class="treeview-menu">
                    <li><a href="ListarPersona"><i class="fa fa-users"></i> Persona</a></li>
                </ul>
                <ul class="treeview-menu">
                    <li><a href="ListarUsuario"><i class="fa fa-user" aria-hidden="true"></i> Usuario</a></li>
                </ul>
                <ul class="treeview-menu">
                    <li><a href="ListarEditorial"><i class="fa fa-user" aria-hidden="true"></i> Editorial</a></li>
                </ul>
                <ul class="treeview-menu">
                    <li><a href="ListarEjemplar"><i class="fa fa-book"></i> Ejemplar</a></li>
                </ul>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="glyphicon glyphicon-edit"></i>
                    <span>Prestamo</span>
                </a>
            </li>

            <li class="treeview">
                <a href="#">
                    <i class="fa fa-wrench" aria-hidden="true"></i>
                    <span>Mantenimiento</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="ListarUbigeo"><i class="fa fa-circle-o"></i> Ubigeo</a></li>
                </ul>
                <ul class="treeview-menu">
                    <li><a href="ListarPeriodo"><i class="fa fa-circle-o"></i> Periodo</a></li>
                </ul>
                <ul class="treeview-menu">
                    <li><a href="ListarProveedor"><i class="fa fa-circle-o"></i> Proveedor</a></li>
                </ul>
                <ul class="treeview-menu">
                    <li><a href="ListarCategoria"><i class="fa fa-circle-o"></i> Categoria</a></li>
                </ul>
                <ul class="treeview-menu">
                    <li><a href="ListarTipo"><i class="fa fa-circle-o"></i> Tipo Lector</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-wrench" aria-hidden="true"></i>
                    <span>Sistema</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="ListarRol"><i class="fa fa-circle-o"></i> Rol</a></li>
                </ul>
                <ul class="treeview-menu">
                    <li><a href="ListarTurno"><i class="fa fa-circle-o"></i> Turno</a></li>
                </ul>
                <ul class="treeview-menu">
                    <li><a href="ListarTipo_doc"><i class="fa fa-circle-o"></i> Documento</a></li>
                </ul>
            </li>
            -->
        <%}%>    
            
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
