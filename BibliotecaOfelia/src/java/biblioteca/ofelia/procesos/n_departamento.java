/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.procesos;
import biblioteca.ofelia.entidad.departamento;
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
public class n_departamento {
    DBConn tran=null;
    Connection conn=null;
    String qry,qry2;//almacena la transacción
    public static int val;//definir si la transacción tuvo éxito

    departamento dep=new departamento();
    public n_departamento() {
        tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
   return MError;
    }

    public departamento getDep() {
        return dep;
    }

    public void setDep(departamento dep) {
        this.dep = dep;
    }
    
    public ArrayList Listar_departamento()    {
        ArrayList consulta=new ArrayList();
        try
        {
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select iddepartamento, nombre, cod, idpais from departamento";
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       
                       departamento dep=new departamento();
                       dep.setIddepartamento(rs.getString("iddepartamento"));
                       dep.setNombre(rs.getString("nombre"));
                       dep.setCod(rs.getString("cod"));
                       dep.setIdpais(rs.getString("idpais"));
                       consulta.add(dep);
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
    public ArrayList Mostrar_departamento(String id)    {
        ArrayList consulta=new ArrayList();
        try
        {
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select pais,iddepartamento, departamento from v_departamento where idpais=?";
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+id);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       
                       departamento dep=new departamento();
                       dep.setIdpais(rs.getString("pais"));
                       dep.setIddepartamento(rs.getString("iddepartamento"));
                       dep.setNombre(rs.getString("departamento"));
                       consulta.add(dep);
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
    
    public void IngresarDepartamento()
    {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="insert into departamento (nombre,cod,idpais,estado) "
                   + "values (?,?,?,?)";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+dep.getNombre());
           ps.setString(++i,""+dep.getCod());
           ps.setString(++i,""+dep.getIdpais());
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
    
    public void BorrarDepartamento()
    {
       val=0;
       try{
           
           int i=0,e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
                    
           qry2="delete departamento where iddepartamento=?";
           
           PreparedStatement ps2= conn.prepareStatement(qry2);
           ps2.setString(++e,""+dep.getIddepartamento());
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
    

    public ArrayList Buscar_departamento()
    {
        ArrayList consulta=new ArrayList();
        try
        {
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select iddepartamento, nombre, idpais  from departamento";
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       
                       departamento dep=new departamento();
                       dep.setIddepartamento(rs.getString("iddepartamento"));
                       dep.setNombre(rs.getString("nombre"));
                       dep.setIdpais(rs.getString("idpais"));
                       consulta.add(dep);
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
    public void ActualizarDepartamento()
    {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="update departamento set iddepartamento=?,nombre=?,cod=?,idpais=?";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+dep.getIddepartamento());
           ps.setString(++i,""+dep.getNombre());
           ps.setString(++i,""+dep.getCod());
           ps.setString(++i,""+dep.getIdpais());
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
    public ArrayList Departamentos_Especifica(String id){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0;
           int i=0;
           int e=0;
           String cat="";
           conn=tran.getConnection();
           conn.setAutoCommit(false);
            //System.out.println("select id,categoria, nro, nombre from vista_subcategoria where subid='"+id+"'");
           qry="select iddepartamento, departamento, codigodepartamento from v_ubigeo where idpais=?";
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+id);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                        departamento dep=new departamento();
                        dep.setIddepartamento(rs.getString("iddepartamento"));
                        dep.setNombre(rs.getString("departamento"));
                        dep.setCod(rs.getString("codigodepartamento"));
                        consulta.add(dep);
                       
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
}
