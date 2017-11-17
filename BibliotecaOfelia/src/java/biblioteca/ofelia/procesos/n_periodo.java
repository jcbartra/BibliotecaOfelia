/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.periodo;
import biblioteca.ofelia.util.DBConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import biblioteca.ofelia.entidad.*;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;
/**
 * 
 * @author Alex Maluquish
 */
public class n_periodo {
    
    DBConn tran=null;
    Connection conn=null;
    String qry,qry2;//almacena la transacción
    public static int val;//definir si la transacción tuvo éxito
 
    periodo pe=new periodo();
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
    

    public periodo getPe() {
        return pe;
    }

    public void setPe(periodo pe) {
        this.pe = pe;
    }
    
    public ArrayList Buscar_periodo()
    {
        ArrayList consulta=new ArrayList();
        try
        {
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idperiodo,periodo from periodo order by idperiodo";
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       
                       periodo pe=new periodo();
                       pe.setIdperiodo(rs.getString("idperiodo"));
                       pe.setPeriodo(rs.getString("periodo"));
                       consulta.add(pe);
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
    
    public ArrayList Periodos(){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idperiodo,periodo from periodo order by idperiodo";
            System.out.println(qry);
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       
                       periodo per=new periodo();
                       per.setIdperiodo(rs.getString("idperiodo"));
                       per.setPeriodo(rs.getString("periodo"));
                       consulta.add(per);
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
           ps.setString(++i,""+pe.getPeriodo());
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
           ps.setString(++i,""+pe.getIdperiodo());
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
           ps.setString(++i,""+pe.getPeriodo());
           ps.setString(++i,""+pe.getIdperiodo());
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
