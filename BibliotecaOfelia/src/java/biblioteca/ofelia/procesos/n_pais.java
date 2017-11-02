/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.pais;
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
 * @author SORALUZ
 */
public class n_pais {
    DBConn tran=null;
    Connection conn=null;
    String qry,qry2;//almacena la transacción
    public static int val;//definir si la transacción tuvo éxito

    pais pa=new pais();
    public n_pais() {
        tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
   return MError;
    }

    public pais getPa() {
        return pa;
    }

    public void setPa(pais pa) {
        this.pa = pa;
    }
    
    public ArrayList Listar_pais()
    {
        ArrayList consulta=new ArrayList();
        try
        {
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idpais,nombre, cod from pais order by idpais";
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       
                       pais pa=new pais();
                       pa.setIdpais(rs.getString("idpais"));
                       pa.setNombre(rs.getString("nombre"));
                       pa.setCod(rs.getString("cod"));
                       consulta.add(pa);
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
    public void IngresarPais()
    {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="insert into pais (nombre,cod,estado) "
                   + "values (?,?,?)";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+pa.getNombre());
           ps.setString(++i,""+pa.getCod());
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
    public void BorrarPais()
    {
       val=0;
       try{
           
           int i=0,e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="delete subcategoria where idcategoria=?";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+pa.getIdpais());
           ps.executeQuery();
           ps.close();
           
           qry2="delete categoria where idcategoria=?";
           
           PreparedStatement ps2= conn.prepareStatement(qry2);
           ps2.setString(++e,""+pa.getIdpais());
           ps2.executeQuery();
           
           val=1;   
           ps2.close();
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
    public void actualizarPais()
    {
        val=0;
        try{

            int i=0;
            conn=tran.getConnection();//empezar conección
            conn.setAutoCommit(false);
        
            qry="update ubigeo set ubigeo=?, codigo=?, departamento=?, pais=? idubigeo=?";// el ? sirve para aumentar la veracidad de la conección de la BD
            PreparedStatement ps= conn.prepareStatement(qry);
            ps.setString(++i,""+pa.getIdpais());
            ps.setString(++i,""+pa.getNombre());
            ps.setString(++i,""+pa.getCod());
            ps.setString(++i,""+pa.getEstado());            
            ps.executeQuery();
            val=1;
            ps.close();
            
            conn.close();//cerrar conexión
      }
      catch(SQLException e){
                     try{//pongo todo lo que voy a hacer
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
    public ArrayList Buscar_pais()
    {
        ArrayList consulta=new ArrayList();
        try
        {
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idpais, nombre from pais";
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       
                       pais pa=new pais();
                       pa.setIdpais(rs.getString("idpais"));
                       pa.setNombre(rs.getString("nombre"));
                       consulta.add(pa);
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
