/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.editorial;
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
public class n_editorial {
    
    DBConn tran = null;
    Connection conn = null;
    String qry, qry2;
    public static int val;

    editorial e = new editorial();

    public n_editorial() {
        tran = new DBConn();
    }

    private String MError = new String();

    public void setMError(String mensaje) {
        MError = mensaje;
    }

    public String getMError() {
        return MError;
    }

    public editorial getE() {
        return e;
    }

    public void setE(editorial e) {
        this.e = e;
    }

    public ArrayList editoriales() {
        ArrayList consulta = new ArrayList();
        try {
            val = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select id,ubigeo,editorial from vista_editorial";
            //System.out.println(qry+" hola");
            PreparedStatement ps = conn.prepareStatement(qry);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                editorial ed = new editorial();
                ed.setIdeditorial(rs.getString("id"));
                ed.setIdubigeo(rs.getString("ubigeo"));
                ed.setNombre(rs.getString("editorial"));
                
                consulta.add(ed);
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
    
    public ArrayList editoriales_update() {
        ArrayList consulta = new ArrayList();
        try {
            val = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select id,idubigeo,editorial from vista_editorial";
            //System.out.println(qry+" hola");
            PreparedStatement ps = conn.prepareStatement(qry);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                editorial ed = new editorial();
                ed.setIdeditorial(rs.getString("id"));
                ed.setIdubigeo(rs.getString("idubigeo"));
                ed.setNombre(rs.getString("editorial"));
                
                consulta.add(ed);
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

    public void IngresarEditorial() {
        val = 0;
        try {

            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "insert into editorial (idubigeo,nombre,estado) "
                    + "values (?,?,?)";
            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + e.getIdubigeo());
            ps.setString(++i, "" + e.getNombre());
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

    public void BorrarEditorial() {
        val = 0;
        try {

            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "delete editorial where ideditorial=?";

            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + e.getIdeditorial());
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

    public void ActualizarEditorial() {
        val = 0;
        try {

            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "update editorial set idubigeo=?,nombre=? where ideditorial=?";

            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + e.getIdubigeo());
            ps.setString(++i, "" + e.getNombre());
            ps.setString(++i, "" + e.getIdeditorial());
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
}
