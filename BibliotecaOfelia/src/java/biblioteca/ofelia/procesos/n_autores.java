/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.autor;
import static biblioteca.ofelia.procesos.n_categoria.val;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;


/**
 *
 * @author GADEA-JADE
 */
public class n_autores {
 
    DBConn tran=null;
    Connection conn=null;
    String qry;//almacena la transacción
    public static int val;//definir si la transacción tuvo éxito
    
    autor a = new autor();
    public n_autores(){
        tran = new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
   return MError;
    }

    public autor getA() {
        return a;
    }

    public void setA(autor a) {
        this.a = a;
    }
    
    public ArrayList autore(){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
            qry="select idautor as id,nombre as nombre, estado as estado from autor where estado='1' order by idautor";
             System.out.println(qry);
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       autor aut=new autor();
                       aut.setIdAutor(rs.getString("id"));
                       aut.setNombre(rs.getString("nombre"));
                       aut.setEstado(rs.getString("estado"));
                       consulta.add(aut);
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
    
    public void IngresarAutor()
    {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="insert into autor (nombre,estado) "
                   + "values (?,?)";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+a.getNombre());
           ps.setString(++i,""+a.getEstado());
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
    
    public void BorrarAutor()
    {
       val=0;
       try{
           
           int i=0,e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
            
           qry="delete autor where idautor=?";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+a.getIdAutor());
           ps.executeQuery();
           ps.close();
           /*
           qry2="delete categoria where idcategoria=?";
           
           PreparedStatement ps2= conn.prepareStatement(qry2);
           ps2.setString(++e,""+c.getIdcategoria());
           ps2.executeQuery();
           */
           val=1;   
        //   ps2.close();
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
    
    public void ActualizarAutor()
    {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="update autor set nombre=?,estado=? where idautor=?";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+a.getNombre());
           ps.setString(++i,""+a.getEstado());
           ps.setString(++i,""+a.getIdAutor());
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
