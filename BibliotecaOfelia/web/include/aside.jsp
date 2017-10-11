
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
                menu mnu=(menu) lm.get(i);
                
            %>
            <li class="treeview">
                <a href="<%=mnu.getLink()%>">
                    <i class="<%=mnu.getIcono()%>"></i>
                    <span><%=mnu.getNombre()%></span>
                    <%if(mnu.getEstado().equals("1")){%>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                    <%}%>
                </a>
                <%if(mnu.getEstado().equals("1")){
                    
                    sm.setRoles(idrol);
                    sm.setIdmenu(mnu.getIdmenu());
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
        <%}%>    
            <li>
                <a href="login.jsp">
                    <i class="glyphicon glyphicon-off"></i> <span>Salir</span>
                </a>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
