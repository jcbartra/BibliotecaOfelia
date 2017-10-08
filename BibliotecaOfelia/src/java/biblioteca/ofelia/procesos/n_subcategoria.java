package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.subcategoria;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;
public class n_subcategoria {
    
    DBConn tran=null;
    Connection conn=null;
    String qry,qry2;
    public static int val;
    
    subcategoria sc=new subcategoria();

    public n_subcategoria() {
        tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
   return MError;
    }

    public subcategoria getSc() {
        return sc;
    }

    public void setSc(subcategoria sc) {
        this.sc = sc;
    }
    
        
    public ArrayList Subcategorias_Generales(){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select id,categoria, nro, nombre from vista_subcategoria";
            //System.out.println(qry);
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       subcategoria sct=new subcategoria();
                       sct.setIdsubcategoria(rs.getString("id"));
                       sct.setIdcategoria(rs.getString("categoria"));
                       sct.setNro(rs.getString("nro"));
                       sct.setNombre(rs.getString("nombre"));
                       consulta.add(sct);
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
    
    public ArrayList Subcategorias_Especifica(String id){
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
           qry="select id,categoria, nro, nombre from vista_subcategoria where subid=?";
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+id);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                        subcategoria sct=new subcategoria();
                        sct.setIdsubcategoria(rs.getString("id"));
                        sct.setIdcategoria(rs.getString("categoria"));
                        sct.setNro(rs.getString("nro"));
                        sct.setNombre(rs.getString("nombre"));
                        consulta.add(sct);
                       
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
    
    public void IngresarSubCategoria()
    {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="insert into subcategoria (idcategoria,nro,nombre,estado) "
                   + "values (?,?,?,?)";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+sc.getIdcategoria());
           ps.setString(++i,""+sc.getNro());
           ps.setString(++i,""+sc.getNombre());
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
    
    public void BorrarSubCategoria()
    {
       val=0;
       try{
           
           int i=0,e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="delete subcategoria where idsubcategoria=?";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+sc.getIdsubcategoria());
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
    
    public void ActualizarSubCategoria()
    {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="update subcategoria set idcategoria=?,nro=?,nombre=? where idsubcategoria=?";
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+sc.getIdcategoria());
           ps.setString(++i,""+sc.getNro());
           ps.setString(++i,""+sc.getNombre());
           ps.setString(++i,""+sc.getIdsubcategoria());
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
