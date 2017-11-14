/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.turno;
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
public class n_turnos {
    
    
    DBConn tran = null;
    Connection conn = null;
    String qry, qry2;
    public static int val;

    turno t = new turno();

    public n_turnos() {
        tran = new DBConn();
    }

    private String MError = new String();

    public void setMError(String mensaje) {
        MError = mensaje;
    }

    public String getMError() {
        return MError;
    }

    public turno getT() {
        return t;
    }

    public void setT(turno t) {
        this.t = t;
    }

    public ArrayList turnos() {
        ArrayList consulta = new ArrayList();
        try {
            val = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select idturno,turno from turno";
            //System.out.println(qry+" hola");
            PreparedStatement ps = conn.prepareStatement(qry);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                turno tu = new turno();
                tu.setIdturno(rs.getString("idturno"));
                tu.setTurno(rs.getString("turno"));
                
                consulta.add(tu);
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
    
    

    public void IngresarTurno() {
        val = 0;
        try {

            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "insert into turno (idturno,turno,estado) "
                    + "values (?,?,?)";
            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + t.getIdturno());
            ps.setString(++i, "" + t.getTurno());
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

    public void BorrarTurno() {
        val = 0;
        try {

            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "delete turno where idturno=?";

            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + t.getIdturno());
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

    public void ActualizarTurno() {
        val = 0;
        try {

            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "update turno set turno=? where idturno=?";

            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + t.getTurno());
            ps.setString(++i, "" + t.getIdturno());
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
