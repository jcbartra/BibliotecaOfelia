/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.*;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Alex Maluquish
 */
public class n_persona {

    DBConn tran = null;
    Connection conn = null;
    String qry, qry2;//almacena la transacción
    public static int val;//definir si la transacción tuvo éxito

    persona p = new persona();

    public n_persona() {
        tran = new DBConn();
    }

    private String MError = new String();

    public void setMError(String mensaje) {
        MError = mensaje;
    }

    public String getMError() {
        return MError;
    }

    public persona getP() {
        return p;
    }

    public void setP(persona p) {
        this.p = p;
    }

    public void InsertarPersona() {
        val = 0;
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "insert into persona (idtipodoc,idubigeo,nombres,ape_paterno,ape_materno,genero,"
                    + "fecha_nacimiento,nro_doc,direccion,telefono,foto,estado) "
                    + "values (?,?,?,?,?,?,?,?,?,?,?,?)";
//            
//            System.out.println("insert into persona (idtipodoc,idubigeo,nombres,ape_paterno,ape_materno,genero,"
//                    + "fecha_nacimiento,nro_doc,direccion,telefono,foto,estado) "
//                    + "values ('"+p.getIdtipodoc()+"','"+p.getIdubigeo()+"','"+p.getNombres()+"','"+p.getApe_paterno()+"',"
//                    + "'"+p.getApe_materno()+"','"+p.getGenero()+"','"+p.getFecha_nacimiento()+"','"+p.getNro_doc()+"','"+p.getDireccion()+"',"
//                    + "'"+p.getTelefono()+"','"+p.getFoto()+"','1')");

            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + p.getIdtipodoc());
            ps.setString(++i, "" + p.getIdubigeo());
            ps.setString(++i, "" + p.getNombres());
            ps.setString(++i, "" + p.getApe_paterno());
            ps.setString(++i, "" + p.getApe_materno());
            ps.setString(++i, "" + p.getGenero());
            ps.setString(++i, "" + p.getFecha_nacimiento());
            ps.setString(++i, "" + p.getNro_doc());
            ps.setString(++i, "" + p.getDireccion());
            ps.setString(++i, "" + p.getTelefono());
            ps.setString(++i, "" + p.getFoto());
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

    public ArrayList Mostrar_Persona() {
        ArrayList consulta = new ArrayList();
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select id,nombres,paterno,materno,genero,ubigeo,tipo_doc,documento,nacimiento,direccion,"
                    + "telefono,foto,estado from datos_persona";
            System.out.println(qry);
            PreparedStatement ps = conn.prepareStatement(qry);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                persona p = new persona();
                p.setIdpersona(rs.getString("id"));
                p.setNombres(rs.getString("nombres"));
                p.setApe_paterno(rs.getString("paterno"));
                p.setApe_materno(rs.getString("materno"));
                p.setGenero(rs.getString("genero"));
                p.setIdubigeo(rs.getString("ubigeo"));
                p.setIdtipodoc(rs.getString("tipo_doc"));
                 p.setNro_doc(rs.getString("documento"));
                p.setFecha_nacimiento(rs.getString("nacimiento"));
                p.setDireccion(rs.getString("direccion"));
                p.setTelefono(rs.getString("telefono"));
                p.setFoto(rs.getString("foto"));
                p.setEstado(rs.getString("estado"));
                consulta.add(p);
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

   public ArrayList VerPersonaId(String idper) {
        ArrayList consulta = new ArrayList();
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select id,nombres||' '||paterno||' '||materno AS ncompleto,genero,ubigeo,tipo_doc,documento,nacimiento,direccion,"
                    + "telefono,foto,estado from datos_persona where id=?";
            System.out.println("select id,nombres,paterno,materno,genero,ubigeo,tipo_doc,documento,nacimiento,direccion,"
                    + "telefono,foto,estado from datos_persona where id='"+idper+"'");
            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + idper);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                persona p = new persona();
                p.setIdpersona(rs.getString("id"));
                p.setNombres(rs.getString("nombres"));
                p.setApe_paterno(rs.getString("paterno"));
                p.setApe_materno(rs.getString("materno"));
                p.setGenero(rs.getString("genero"));
                p.setIdubigeo(rs.getString("ubigeo"));
                p.setIdtipodoc(rs.getString("tipo_doc"));
                 p.setNro_doc(rs.getString("documento"));
                p.setFecha_nacimiento(rs.getString("nacimiento"));
                p.setDireccion(rs.getString("direccion"));
                p.setTelefono(rs.getString("telefono"));
                p.setFoto(rs.getString("foto"));
                p.setEstado(rs.getString("estado"));
                consulta.add(p);
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

//    public void Ver_persona_Id() {
//        try {
//            int i = 0;
//            conn = tran.getConnection();
//            conn.setAutoCommit(false);
//            qry = "select p.idpersona as id,p.nombres,p.ape_paterno||' '||p.ape_materno as apellidos ,t.idtipodoc,u.idubigeo,p.genero,p.fecha_nacimiento,p.nro_doc,\n"
//                    + "p.direccion,p.telefono,p.estado from persona p, tipo_doc t ,ubigeo u \n"
//                    + "where p.idtipodoc=t.idtipodoc and p.idubigeo=u.idubigeo and idpersona=?";
//            PreparedStatement ps = conn.prepareStatement(qry);
//            ps.setString(++i, "" + p.getIdpersona());
//            ResultSet rs = ps.executeQuery();
//            if (rs.next()) {
//
//                p.setNombres(rs.getString("nombres"));
//                p.setApe_paterno(rs.getString("ape_paterno"));
//                p.setApe_materno(rs.getString("ape_materno"));
//                p.setIdtipodoc(rs.getString("idtipodoc"));
//                p.setIdubigeo(rs.getString("idubigeo"));
//                p.setGenero(rs.getString("genero"));
//                p.setFecha_nacimiento(rs.getString("fecha_nacimiento"));
//                p.setNro_doc(rs.getString("nro_doc"));
//                p.setDireccion(rs.getString("direccion"));
//                p.setTelefono(rs.getString("telefono"));
//                p.setEstado(rs.getString("estado"));
//                p.setIdpersona(rs.getString("id"));
//            }
//            rs.close();
//            ps.close();
//            conn.close();
//            /*
//             for(int n=0;n<consulta.size();n++){
//             auto aus= (auto) consulta.get(n);
//             }*/
//        } catch (SQLException e) {
//            try {
//                conn.rollback();
//                setMError(e.getMessage() + "<br>Transaction is being rolled back");
//            } catch (SQLException e2) {
//                setMError(e.getMessage());
//            }
//        } catch (Exception e) {
//            System.out.println(e.getMessage());
//            setMError(e.getMessage());
//        } finally {
//            try {
//                if (conn != null) {
//                    conn.close();
//                }
//            } catch (SQLException e) {
//                setMError(e.getMessage());
//            }
//        }
//
//    }

    public void Eliminar() {
        val = 0;

        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "delete persona where idpersona=?";

            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + p.getIdpersona());
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

    public void actualizar() {
        val = 0;
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "Update persona set nombres=?, ape_paterno=?, ape_materno=?, idtipodoc=?, idubigeo=?,genero=?,fecha_nacimiento=?,nro_doc=?,direccion=? ,telefono=?, estado=? where idanimales=?";

            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + p.getNombres());
            ps.setString(++i, "" + p.getApe_paterno());
            ps.setString(++i, "" + p.getIdtipodoc());
            ps.setString(++i, "" + p.getIdubigeo());
            ps.setString(++i, "" + p.getGenero());
            ps.setString(++i, "" + p.getFecha_nacimiento());
            ps.setString(++i, "" + p.getNro_doc());
            ps.setString(++i, "" + p.getDireccion());
            ps.setString(++i, "" + p.getTelefono());
            ps.setString(++i, "" + p.getEstado());
            ps.setString(++i, "" + p.getIdpersona());
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
