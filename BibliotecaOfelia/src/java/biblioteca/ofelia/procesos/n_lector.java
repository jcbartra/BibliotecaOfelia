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
            qry = "select idlector, persona, genero, tipo, turno, periodo, estado_habil, nivel, grado, seccion, condicion, nro_doc, estado_periodo, estado "
                    + " from vista_lectores";
            System.out.println(qry);
            PreparedStatement ps = conn.prepareStatement(qry);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lector l = new lector();
                l.setIdlector(rs.getString("idlector"));
                l.setIdpersona(rs.getString("persona"));
                l.setGenero(rs.getString("genero"));
                l.setIdtipo(rs.getString("tipo"));
                l.setIdturno(rs.getString("turno"));
                l.setIdperiodo(rs.getString("periodo"));
                l.setEstado_habil(rs.getString("estado_habil"));
                l.setEstado(rs.getString("estado"));
                l.setNivel(rs.getString("nivel"));
                l.setGrado(rs.getString("grado"));
                l.setSeccion(rs.getString("seccion"));
                l.setCondicion(rs.getString("condicion"));
                l.setNdoc(rs.getString("nro_doc"));
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
  
    public void add_Lector()
    {
        val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="insert into lector (idpersona,idtipo,idturno,idperiodo,estado_habil,nivel, grado,seccion, condicion, estado_periodo,estado) "
                   + "values (?,?,?,?,?,?,?,?,?,?,?)";
           
          /*System.out.println("insert into lector (idpersona,idtipo,idturno,idperiodo,estado_habil,nivel, grado,seccion, condicion, estado_periodo,estado) "
                   + "values ('"+l.getIdpersona()+"','"+l.getIdtipo()+"','"+l.getIdturno()+"',"
                   + "'"+l.getIdperiodo()+"','"+l.getEstado_habil()+"','"+l.getNivel()+"','"+l.getGrado()+"'"
                   + ",'"+l.getSeccion()+"','"+l.getCondicion()+"','"+l.getEstado_periodo()+"','"+l.getEstado()+"')");
           */
          
          PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+l.getIdpersona());
           ps.setString(++i,""+l.getIdtipo());
           ps.setString(++i,""+l.getIdturno());
           ps.setString(++i,""+l.getIdperiodo());
           ps.setString(++i,"1");
           ps.setString(++i,""+l.getNivel());
           ps.setString(++i,""+l.getGrado());
           ps.setString(++i,""+l.getSeccion());
           ps.setString(++i,""+l.getCondicion());
           ps.setString(++i,"1");
           ps.setString(++i,"1");
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
    }  

    public void Eliminar() {
        val = 0;

        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "delete lector where idlector=?";

            PreparedStatement ps = conn.prepareStatement(qry);
            ps.setString(++i, "" + l.getIdlector());
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
    
    public ArrayList Mostrar_LectorUpdate() {
        ArrayList consulta = new ArrayList();
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);
            qry = "select idlector,idpersona,idtipo,idturno,idperiodo,nivel, grado,seccion, condicion "
                    + "from lector";
            System.out.println(qry);
            PreparedStatement ps = conn.prepareStatement(qry);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                lector le = new lector();
                le.setIdlector(rs.getString("idlector"));
                le.setIdpersona(rs.getString("idpersona"));
                le.setIdtipo(rs.getString("idtipo"));
                le.setIdturno(rs.getString("idturno"));
                le.setIdperiodo(rs.getString("idperiodo"));
                le.setNivel(rs.getString("nivel"));
                le.setGrado(rs.getString("grado"));
                le.setSeccion(rs.getString("seccion"));
                le.setCondicion(rs.getString("condicion"));
                consulta.add(le);
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
    
    public void Actualizar_Lector() {
        val = 0;
        try {
            int i = 0;
            conn = tran.getConnection();
            conn.setAutoCommit(false);

            qry = "update lector set idpersona=?, idtipo=?, idturno=?, idperiodo=?, nivel=?,grado=?,seccion=?,condicion=?  where idlector=?";
            
            PreparedStatement ls = conn.prepareStatement(qry);
            ls.setString(++i, "" + l.getIdpersona());
            ls.setString(++i, "" + l.getIdtipo());
            ls.setString(++i, "" + l.getIdturno());
            ls.setString(++i, "" + l.getIdperiodo());
            ls.setString(++i, "" + l.getNivel());
            ls.setString(++i, "" + l.getGrado());
            ls.setString(++i, "" + l.getSeccion());
            ls.setString(++i, "" + l.getCondicion());
            ls.setString(++i, "" + l.getIdlector());
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