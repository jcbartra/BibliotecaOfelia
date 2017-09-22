<aside  class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="Recursos/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p><%= usuarioSesion%></p>
                <a href="#"><i class="fa fa-circle text-success"></i> Conectado</a>
            </div>
        </div>

        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">MENÚ - PRINCIPAL</li>
            <li>
                <a href="inicio.html">
                    <i class="glyphicon glyphicon-home"></i> <span>Página Principal</span>
                </a>
            </li>
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
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
