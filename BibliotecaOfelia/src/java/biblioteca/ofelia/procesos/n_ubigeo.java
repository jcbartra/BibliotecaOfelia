
package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.ubigeo;
import biblioteca.ofelia.util.DBConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;
import java.util.*;

public class n_ubigeo {
    DBConn tran=null;
    Connection conn=null;
    String qry,qry2;//almacena la transacción
    public static int val;//definir si la transacción tuvo éxito

    ubigeo ub=new ubigeo();
    public n_ubigeo() {
        tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
   return MError;
    }

    public ubigeo getUb() {
        return ub;
    }

    public void setUb(ubigeo ub) {
        this.ub = ub;
    }
    
    public ArrayList Buscar_ubigeo()
    {
        ArrayList consulta=new ArrayList();
        try
        {
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idubigeo,nombre from ubigeo order by idubigeo";
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       
                       ubigeo ub=new ubigeo();
                       ub.setIdubigeo(rs.getString("idubigeo"));
                       ub.setNombre(rs.getString("nombre"));
                       consulta.add(ub);
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
   public ArrayList Listar_Ubigeo()
    {
        ArrayList consulta=new ArrayList();
        try
        {
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           //qry="select idubigeo, ubigeo, codigo, departamento, pais from v_ubigeo";
           qry="select ub.idubigeo, ub.nombre as ubigeo, ub.cod as codigo, de.nombre as departamento, pa.nombre as pais from departamento de, ubigeo ub, pais pa where ub.iddepartamento=de.iddepartamento and de.idpais=pa.idpais";
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {  
                       ubigeo ub=new ubigeo();
                       ub.setIdubigeo(rs.getString("idubigeo"));
                       ub.setNombre(rs.getString("ubigeo"));
                       ub.setCod(rs.getString("codigo"));
                       ub.setIddepartamento(rs.getString("departamento"));
                       ub.setIdpais(rs.getString("pais"));
                       consulta.add(ub);

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
   public void IngresarUbigeo()
    {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry=" insert into ubigeo (iddepartamento,nombre,cod,estado) "
                   + " values (?,?,?,?)";
 
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+ub.getIddepartamento());
           ps.setString(++i,""+ub.getNombre());
           ps.setString(++i,""+ub.getCod());
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
 public void BorrarUbigeo(){
        val=0;
        try{
            int i=0;
            conn=tran.getConnection();
            conn.setAutoCommit(false);
            qry="delete ubigeo where idubigeo=?";
            PreparedStatement ps=conn.prepareStatement(qry);
            ps.setString(++i,""+ub.getIdubigeo());
            ps.executeQuery();
            val=1;
            ps.close();
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
 public void actualizar()
    {
        val=0;
        try{

            int i=0;
            conn=tran.getConnection();//empezar conección
            conn.setAutoCommit(false);
        
            qry="update ubigeo set nombre=? ,cod=?, iddepartamento=?  where idubigeo=? ";// el ? sirve para aumentar la veracidad de la conección de la BD
            PreparedStatement ps= conn.prepareStatement(qry);
            
            ps.setString(++i,""+ub.getNombre());
            ps.setString(++i,""+ub.getCod());
            ps.setString(++i,""+ub.getIddepartamento());
            ps.setString(++i,""+ub.getIdubigeo());           
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
 public ArrayList Ubigeos_Especifica(String id){
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
           qry="select departamento,idubigeo,ubigeo from v_ubigeo where iddepartamento=?";
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+id);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                        ubigeo ubi=new ubigeo();
                        ubi.setIddepartamento(rs.getString("departamento"));
                        ubi.setIdubigeo(rs.getString("idubigeo"));
                        ubi.setNombre(rs.getString("ubigeo"));
                        consulta.add(ubi);
                       
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
