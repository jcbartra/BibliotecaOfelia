package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.libro;
import biblioteca.ofelia.util.DBConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author GADEA-JADE
 */
public class n_libros {

    DBConn tran = null;
    Connection conn = null;
    String qry, qry2;
    public static int val;

    libro l = new libro();

    public n_libros() {
        tran = new DBConn();
    }

    private String MError = new String();

    public void setMError(String mensaje) {
        MError = mensaje;
    }

    public String getMError() {
        return MError;
    }

    public libro getL() {
        return l;
    }

    public void setL(libro l) {
        this.l = l;
    }

    public ArrayList Libros_Generales() {
        ArrayList consulta = new ArrayList();
        try {
            val = 0;
            int i = 0;
            int e = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select idli,idcategoria,idsubcategoria,subcategoria,editorial,titulo,autor,anio_publicacion,paginas from vista_libro where idsubcategoria=? order by idli";
            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, ""+l.getIdsubcategoria());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                libro lb = new libro();
                lb.setIdlibro(rs.getString("idli"));
                lb.setIdcategoria(rs.getString("idcategoria"));
                lb.setIdsubcategoria(rs.getString("idsubcategoria"));
                lb.setSubcategoria(rs.getString("subcategoria"));
                lb.setIdeditorial(rs.getString("editorial"));
                lb.setTitulo(rs.getString("titulo"));
                lb.setIdautor(rs.getString("autor"));
                lb.setAnio_publicacion(rs.getString("anio_publicacion"));
                lb.setPaginas(rs.getString("paginas"));

                consulta.add(lb);
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            try {
                conn.rollback();
                setMError(e.getMessage() + "<br>Transaction is being rolled back");
            } catch (SQLException e2) {
                setMError(e.getMessage());
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            setMError(e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                setMError(e.getMessage());
            }
        }
        return consulta;
    }

    public ArrayList Libros_GeneralesUpdate2() {
        ArrayList consulta = new ArrayList();
        try {
            val = 0;
            int i = 0;
            int e = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select idli,idcategoria,idsubcategoria,subcategoria,ideditorial,titulo,idautor,anio_publicacion,paginas from vista_libro where idli=?";
            PreparedStatement ps = conn.prepareStatement(qry);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                libro l = new libro();
                l.setIdlibro(rs.getString("idli"));
                l.setIdcategoria(rs.getString("idcategoria"));
                l.setIdsubcategoria(rs.getString("idsubcategoria"));
                l.setSubcategoria(rs.getString("subcategoria"));
                l.setIdeditorial(rs.getString("ideditorial"));
                l.setTitulo(rs.getString("titulo"));
                l.setIdautor(rs.getString("idautor"));
                l.setAnio_publicacion(rs.getString("aniop_ublicacion"));
                l.setPaginas(rs.getString("paginas"));

                consulta.add(l);
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            try {
                conn.rollback();
                setMError(e.getMessage() + "<br>Transaction is being rolled back");
            } catch (SQLException e2) {
                setMError(e.getMessage());
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            setMError(e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                setMError(e.getMessage());
            }
        }
        return consulta;
    }
    
    public void Libros_GeneralesUpdate() {
        try {
            val = 0;
            int i = 0;
            int e = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select idli,idsubcategoria, ideditorial,titulo,idautor,anio_publicacion,paginas from vista_libro where idli=?";
            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, ""+l.getIdlibro());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                l.setIdlibro(rs.getString("idli"));
                l.setIdsubcategoria(rs.getString("idsubcategoria"));
                l.setIdeditorial(rs.getString("ideditorial"));
                l.setTitulo(rs.getString("titulo"));
                l.setIdautor(rs.getString("idautor"));
                l.setAnio_publicacion(rs.getString("anio_publicacion"));
                l.setPaginas(rs.getString("paginas"));
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            try {
                conn.rollback();
                setMError(e.getMessage() + "<br>Transaction is being rolled back");
            } catch (SQLException e2) {
                setMError(e.getMessage());
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            setMError(e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                setMError(e.getMessage());
            }
        }
    }

    public void IngresarLibro() {
        val = 0;
        try {

            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "insert into libro (idsubcategoria,ideditorial,titulo,idautor,anio_publicacion,paginas,estado) "
                    + "values (?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + l.getIdsubcategoria());
            ps.setString(++i, "" + l.getIdeditorial());
            ps.setString(++i, "" + l.getTitulo());
            ps.setString(++i, "" + l.getIdautor());
            ps.setString(++i, "" + l.getAnio_publicacion());
            ps.setString(++i, "" + l.getPaginas());

            ps.setString(++i, "1");
            ps.executeQuery();
            val = 1;
            ps.close();
            conn.close();

        } catch (SQLException e) {
            try {
                conn.rollback();
                setMError(e.getMessage() + "<br>Transaction is being rolled back");
            } catch (SQLException e2) {
                setMError(e.getMessage());
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            setMError(e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                setMError(e.getMessage());
            }
        }
    }

    public void BorrarLibro() {
        val = 0;
        try {

            int i = 0, e = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "delete libro where idlibro=?";

            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + l.getIdlibro());
            ps.executeQuery();

            val = 1;
            ps.close();
            conn.close();

        } catch (SQLException e) {
            try {
                conn.rollback();
                setMError(e.getMessage() + "<br>Transaction is being rolled back");
            } catch (SQLException e2) {
                setMError(e.getMessage());
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            setMError(e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                setMError(e.getMessage());
            }
        }
    }

    public void ActualizarLibro() {
        val = 0;
        try {

            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "update libro set idsubcategoria=?,ideditorial=?,titulo=?,idautor=?,anio_publicacion=?,paginas=? where idlibro=?";

            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + l.getIdsubcategoria());
            ps.setString(++i, "" + l.getIdeditorial());
            ps.setString(++i, "" + l.getTitulo());
            ps.setString(++i, "" + l.getIdautor());
            ps.setString(++i, "" + l.getAnio_publicacion());
            ps.setString(++i, "" + l.getPaginas());
            ps.setString(++i, "" + l.getIdlibro());
            ps.executeQuery();
            val = 1;
            ps.close();
            conn.close();

        } catch (SQLException e) {
            try {
                conn.rollback();
                setMError(e.getMessage() + "<br>Transaction is being rolled back");
            } catch (SQLException e2) {
                setMError(e.getMessage());
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            setMError(e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                setMError(e.getMessage());
            }
        }
    }
    
    public ArrayList Libros_Generales_id() {
        ArrayList consulta = new ArrayList();
        try {
            val = 0;
            int i = 0;
            int e = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select idli,idcategoria,idsubcategoria,subcategoria,editorial,"
                    + "titulo,autor,anio_publicacion,paginas "
                    + "from vista_libro where idcategoria=? and idsubcategoria=?";
            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, ""+l.getIdcategoria());
            ps.setString(++i, ""+l.getIdsubcategoria());
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                libro lb = new libro();
                lb.setIdlibro(rs.getString("idli"));
                lb.setIdcategoria(rs.getString("idcategoria"));
                lb.setIdsubcategoria(rs.getString("idsubcategoria"));
                lb.setSubcategoria(rs.getString("subcategoria"));
                lb.setIdeditorial(rs.getString("editorial"));
                lb.setTitulo(rs.getString("titulo"));
                lb.setIdautor(rs.getString("autor"));
                lb.setAnio_publicacion(rs.getString("anio_publicacion"));
                lb.setPaginas(rs.getString("paginas"));

                consulta.add(lb);
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (SQLException e) {
            try {
                conn.rollback();
                setMError(e.getMessage() + "<br>Transaction is being rolled back");
            } catch (SQLException e2) {
                setMError(e.getMessage());
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            setMError(e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                setMError(e.getMessage());
            }
        }
        return consulta;
    }

}
