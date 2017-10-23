/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.*;
import static biblioteca.ofelia.procesos.n_persona.val;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Alex Maluquish
 */
public class n_usuario {
    DBConn tran = null;
    Connection conn = null;
    String qry, qry2;//almacena la transacción
    public static int val;//definir si la transacción tuvo éxito

    usuario us= new usuario();

    public n_usuario() {
        tran = new DBConn();
    }

    private String MError = new String();

    public void setMError(String mensaje) {
        MError = mensaje;
    }
    
     public String getMError() {
        return MError;
    }

    public usuario getUs() {
        return us;
    }

    public void setUs(usuario us) {
        this.us = us;
    }
    
    
    public ArrayList MostrarUsuarios() {
        ArrayList consulta = new ArrayList();
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select idu,rol,persona,usuario,estado from lista_usserid";
            System.out.println(qry);
            PreparedStatement ps = conn.prepareStatement(qry);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                usuario us = new usuario();
                us.setIdusuario(rs.getString("idu"));
                us.setIdrol(rs.getString("rol"));
                us.setIdpersona(rs.getString("persona"));
                us.setUsuario(rs.getString("usuario"));
                us.setEstado(rs.getString("estado"));

                consulta.add(us);
            }
            rs.close();
            ps.close();
            conn.close();
            /*
             for(int n=0;n<consulta.size();n++){
             auto aus= (auto) consulta.get(n);
             }*/
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
    
    
    public void InsertarUsuario() {
        val = 0;
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "insert into usuario (idrol,idpersona,usuario,clave,estado"

                    + "values (?,?,?,?,?)";
            System.out.println("estas aqui");
//            System.out.println("insert into persona (idtipodoc,idubigeo,nombres,ape_paterno,ape_materno,genero,"
//                    + "fecha_nacimiento,nro_doc,direccion,telefono,foto,estado) "
//                    + "values ('"+p.getIdtipodoc()+"','"+p.getIdubigeo()+"','"+p.getNombres()+"','"+p.getApe_paterno()+"',"
//                    + "'"+p.getApe_materno()+"','"+p.getGenero()+"','"+p.getFecha_nacimiento()+"','"+p.getNro_doc()+"','"+p.getDireccion()+"',"
//                    + "'"+p.getTelefono()+"','"+p.getFoto()+"','1')");

            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + us.getIdrol());
            ps.setString(++i, "" + us.getIdpersona());
            ps.setString(++i, "" + us.getUsuario());
            ps.setString(++i, "" + us.getClave());
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
    
    public void EliminarUsuario() {
        val = 0;

        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "delete usuario where idusuario=?";

            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + us.getIdusuario());
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
