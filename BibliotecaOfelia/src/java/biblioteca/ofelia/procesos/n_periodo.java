/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.periodo;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;

/**
 *
 * @author Karol
 */
public class n_periodo {
    
    DBConn tran=null;
    Connection conn=null;
    String qry;//almacena la transacción
    public static int val;//definir si la transacción tuvo éxito
    
    periodo p = new periodo();
    
    public n_periodo() {
        tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
   return MError;
    }

    public periodo getP() {
        return p;
    }
    
    public void setP(periodo p) {
        this.p = p;
    }
    
    
    public ArrayList Periodos(){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idperiodo as id, periodo from periodo where estado='1' order by idperiodo";
            System.out.println(qry);
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       periodo pr=new periodo();
                       pr.setIdperiodo(rs.getString("id"));
                       pr.setPeriodo(rs.getString("periodo"));
                       consulta.add(pr);
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
    
    
    public void IngresarPeriodo()
    {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="insert into periodo (periodo, estado) "
                   + "values (?,?)";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+p.getPeriodo());
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
    
    
    public void EliminarPeriodo()
        {
       val=0;
       try{
           
           int i=0,e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="delete periodo where idperiodo=?";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+p.getIdperiodo());
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
    
    
    public void ActualizarPeriodo()
    {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="update periodo set periodo=? where idperiodo=?";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+p.getPeriodo());
           ps.setString(++i,""+p.getIdperiodo());
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
