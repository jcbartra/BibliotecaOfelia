package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.categoria;
import biblioteca.ofelia.entidad.lector;
import biblioteca.ofelia.entidad.persona;
import biblioteca.ofelia.entidad.ubigeo;
import static biblioteca.ofelia.procesos.n_lector.val;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class n_lector {
    
    DBConn tran=null;
    Connection conn=null;
    String qry,qry2;
    public static int val;
    
    lector l=new lector();

    public n_lector() {
        tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
   return MError;
    }

    public lector getL() {
        return l;
    }

    public void setL(lector l) {
        this.l = l;
    }
    

    
    public ArrayList Mostrar_Lector() {
        ArrayList consulta = new ArrayList();
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select idlector,persona,genero,tipo,ndoc, estado"
                    + " from vista_lector";
            System.out.println(qry);
            PreparedStatement ps = conn.prepareStatement(qry);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lector l = new lector();
                l.setIdlector(rs.getString("idlector"));
                l.setIdpersona(rs.getString("persona"));
                l.setGenero(rs.getString("genero"));
                l.setIdtipo(rs.getString("tipo"));
                l.setNdoc(rs.getString("ndoc"));
                l.setEstado(rs.getString("estado"));
                consulta.add(l);
               
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
    
    public ArrayList VerLectorId(String idlec) {
        ArrayList consulta = new ArrayList();
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select id,nombres||' '||paterno||' '||materno AS ncompleto,genero,ubigeo,tipo_doc,documento,nacimiento,direccion,"
                    + "telefono,foto,estado from datos_persona where id=?";
            System.out.println("select id,nombres,paterno,materno,genero,ubigeo,tipo_doc,documento,nacimiento,direccion,"
                    + "telefono,foto,estado from datos_persona where id='"+idlec+"'");
            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + idlec);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lector l = new lector();
                l.setIdlector(rs.getString("id"));
                l.setIdpersona(rs.getString("persona"));
                l.setIdtipo(rs.getString("tipo"));
                l.setIdturno(rs.getString("turno"));
                l.setIdperiodo(rs.getString("periodo"));
                l.setEstado(rs.getString("estado"));
                l.setNivel(rs.getString("nivel"));
                l.setGrado(rs.getString("grado"));
                l.setSeccion(rs.getString("seccion"));
                l.setCondicion(rs.getString("condicion"));
                l.setEstado_periodo(rs.getString("estado_periodo"));
                l.setEstado(rs.getString("estado"));
                consulta.add(l);
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
    
    
    
    
    public void IngresarLector()
    {
        val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="insert into lector (idpersona,idtipo,idturno,idperiodo,estado_habil,nivel, grado,seccion, condicion, estado_periodo,estado) "
                   + "values (?,?,?,?,?,?,?,?,?,?,?)";
           
           /*PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+c.getNroini());
           ps.setString(++i,""+c.getNombre());
           ps.setString(++i,""+c.getDescripcion());
           ps.setString(++i,""+c.getColor());
           ps.setString(++i,""+c.getIcono());
           ps.setString(++i,"1");
           ps.executeQuery();
           val=1;   
           ps.close();
           conn.close();
*/  
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
    }  

    public void Eliminar() {
        val = 0;

        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "delete lector where idlector=?";

            PreparedStatement ps = conn.prepareStatement(qry);
 //           ps.setString(++i, "" + l.getIdlector());
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
/*
    public void actualizarlector() {
        val = 0;
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "Update persona set nombres=?, ape_paterno=?, ape_materno=?, idtipodoc=?, idubigeo=?,genero=?,fecha_nacimiento=?,nro_doc=?,direccion=? ,telefono=?, estado=? where idanimales=?";

            PreparedStatement ls = conn.prepareStatement(qry);
            ls.setString(++i, "" + l.getNombres());
            ls.setString(++i, "" + l.getApe_paterno());
            ls.setString(++i, "" + l.getIdtipodoc());
            ls.setString(++i, "" + l.getIdubigeo());
            ls.setString(++i, "" + l.getGenero());
            ls.setString(++i, "" + l.getFecha_nacimiento());
            ls.setString(++i, "" + l.getNro_doc());
            ls.setString(++i, "" + l.getDireccion());
            ls.setString(++i, "" + l.getTelefono());
            ls.setString(++i, "" + l.getEstado());
            ls.setString(++i, "" + l.getIdpersona());
            ls.executeQuery();
            val = 1;
            ls.close();

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
    
    public void ActualizarLector()
    {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="update categoria set nro=?,nombre=?,descripcion=?,color=?,icono=? where idcategoria=?";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+c.getNroini());
           ps.setString(++i,""+c.getNombre());
           ps.setString(++i,""+c.getDescripcion());
           ps.setString(++i,""+c.getColor());
           ps.setString(++i,""+c.getIcono());
           ps.setString(++i,""+c.getIdcategoria());
           ps.executeQuery();
           val=1;   
           ps.close();
           conn.close();
  
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
    }  */
    
}
