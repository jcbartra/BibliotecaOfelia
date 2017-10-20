/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.rol;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Karol
 */
public class n_rol {
    
    DBConn tran=null;
    Connection conn=null;
    String qry;//almacena la transacción
    public static int val;//definir si la transacción tuvo éxito
    
    rol r = new rol();

    public n_rol() {
        tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
   return MError;
    }

    public rol getR() {
        return r;
    }

    public void setR(rol r) {
        this.r = r;
    }
    
    
    public ArrayList Roles(){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idrol as id, rol from rol where estado='1' order by idrol";
            System.out.println(qry);
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       rol rl=new rol();
                       rl.setIdrol(rs.getString("id"));
                       rl.setRol(rs.getString("rol"));
                       consulta.add(rl);
                   }
           rs.close();
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
        return consulta;
    }
    
    
    
    public void IngresarRol()
   {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="insert into rol (rol, estado) "
                   + "values (?,?)";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+r.getRol());
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
    
       
       public void EliminarRol()
    {
       val=0;
       try{
           
           int i=0,e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="delete rol where idrol=?";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+r.getIdrol());
           ps.executeQuery();
           ps.close();
           
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
       
       
       public void ActualizarRol()
    {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="update rol set rol=? where idrol=?";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+r.getRol());
           ps.setString(++i,""+r.getIdrol());
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
}
