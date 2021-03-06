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
            qry = "select id,nombres,paterno,materno,genero,ubigeo,tipo_doc,documento,nacimiento,"
                    + "direccion,telefono,foto,estado from datos_persona where estado like ?";
            System.out.println(qry);
            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "%"+p.getEstado());
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

    public ArrayList Mostrar_PersonaUpdate() {
        ArrayList consulta = new ArrayList();
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select id, nombres ,paterno, materno ,tipo_doc,ubigeo,genero,nacimiento,documento,  direccion, telefono,foto, estado from datos_personas";
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

    public void Eliminar() {
        val = 0;

        try {
            int i=0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "update persona set estado='0' where idpersona=?";

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

            qry = "Update persona set nombres=?, ape_paterno=?, ape_materno=?, idtipodoc=?, idubigeo=?,genero=?,fecha_nacimiento=?,nro_doc=?,direccion=? ,telefono=? where idpersona=?";
            System.out.println("Update persona set nombres='" + p.getNombres() + "', ape_paterno='" + p.getApe_paterno() + "', "
                    + "ape_materno='" + p.getApe_materno() + "', idtipodoc='" + p.getIdtipodoc() + "', idubigeo='" + p.getIdubigeo() + "',"
                    + "genero='" + p.getGenero() + "',fecha_nacimiento='" + p.getFecha_nacimiento() + "',nro_doc='" + p.getNro_doc() + "',"
                    + "direccion='" + p.getDireccion() + "' ,telefono='" + p.getTelefono() + "' where idpersona='" + p.getIdpersona() + "'");
            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + p.getNombres());
            ps.setString(++i, "" + p.getApe_paterno());
            ps.setString(++i, "" + p.getApe_materno());
            ps.setString(++i, "" + p.getIdtipodoc());
            ps.setString(++i, "" + p.getIdubigeo());
            ps.setString(++i, "" + p.getGenero());
            ps.setString(++i, "" + p.getFecha_nacimiento());
            ps.setString(++i, "" + p.getNro_doc());
            ps.setString(++i, "" + p.getDireccion());
            ps.setString(++i, "" + p.getTelefono());
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

    public ArrayList Buscar_Persona() {
        ArrayList consulta = new ArrayList();
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select idpersona,nombres,ape_paterno,ape_materno from persona where estado='1' order by nombres";
            PreparedStatement ps = conn.prepareStatement(qry);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {

                persona p = new persona();
                p.setIdpersona(rs.getString("idpersona"));
                p.setNombres(rs.getString("nombres"));
                p.setApe_paterno(rs.getString("ape_paterno"));
                p.setApe_materno(rs.getString("ape_materno"));
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
    
    public void Buscar_Persona_dni() {
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select idpersona,idlector, nombre, nro_doc, foto, tipo from vista_lector where nro_doc=? and estado='1'";
            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, ""+p.getNro_doc());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                p.setIdpersona(rs.getString("idpersona"));
                p.setIdlector(rs.getString("idlector"));
                p.setNombres(rs.getString("nombre"));
                p.setNro_doc(rs.getString("nro_doc"));
                p.setFoto(rs.getString("foto"));
                p.setTipo_lector(rs.getString("tipo"));
                val=1;
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
    
    public void Buscar_Persona_datos() {
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select idpersona,idlector, nombre, nro_doc, foto, tipo from vista_lector "
                    + "where nombres like ? and ape_paterno like ? and ape_materno like ? and estado='1'";
            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, ""+p.getNombres()+"%");
            ps.setString(++i, ""+p.getApe_paterno()+"%");
            ps.setString(++i, ""+p.getApe_materno()+"%");
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {

                p.setIdpersona(rs.getString("idpersona"));
                p.setIdlector(rs.getString("idlector"));
                p.setNombres(rs.getString("nombre"));
                p.setNro_doc(rs.getString("nro_doc"));
                p.setFoto(rs.getString("foto"));
                p.setTipo_lector(rs.getString("tipo"));
                val=1;
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
    
    public ArrayList Buscar_Persona_Lector()
    {
        ArrayList consulta=new ArrayList();
        try
        {
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idpersona,nombres,ape_paterno,ape_materno from vista_persona_lector";
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       
                       persona p=new persona();
                       p.setIdpersona(rs.getString("idpersona"));
                       p.setNombres(rs.getString("nombres"));
                       p.setApe_paterno(rs.getString("ape_paterno"));
                       p.setApe_materno(rs.getString("ape_materno"));
                       consulta.add(p);
                   }
           rs.close();
           ps.close();
           conn.close(); 
           /*
           for(int n=0;n<consulta.size();n++){
                   auto aus= (auto) consulta.get(n);
           }*/
        }
         catch(SQLException e){
                     try{
                    conn.rollback();
                    setMError(e.getMessage()+"<br>Transaction is being rolled back");
                    }
                    catch(SQLException e2)
                    {
                        setMError(e.getMessage());
                    }
              }
             catch(Exception e){
                    System.out.println(e.getMessage());
                    setMError(e.getMessage());
             }
             finally{
                    try{if(conn!=null) conn.close();}
                    catch(SQLException e){setMError(e.getMessage());}
             }
        return consulta;
    }

}
