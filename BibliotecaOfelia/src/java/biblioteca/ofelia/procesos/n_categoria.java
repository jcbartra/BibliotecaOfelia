/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.categoria;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;

public class n_categoria {
    
    DBConn tran=null;
    Connection conn=null;
    String qry;//almacena la transacción
    public static int val;//definir si la transacción tuvo éxito
    
    categoria c=new categoria();

    public n_categoria() {
        tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
   return MError;
    }

    public categoria getC() {
        return c;
    }

    public void setC(categoria c) {
        this.c = c;
    }
    
    public ArrayList Categorias_Generales(){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idcategoria as id, nro nroini, nro+99 nrofin, nombre, descripcion, color, icono from categoria where estado='1' order by idcategoria";
            System.out.println(qry);
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       categoria ct=new categoria();
                       ct.setIdcategoria(rs.getString("id"));
                       ct.setNroini(rs.getString("nroini"));
                       ct.setNrofin(rs.getString("nrofin"));
                       ct.setNombre(rs.getString("nombre"));
                       ct.setDescripcion(rs.getString("descripcion"));
                       ct.setColor(rs.getString("color"));
                       ct.setIcono(rs.getString("icono"));
                       consulta.add(ct);
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
        
public void IngresarCategoria()
   {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="insert into categoria (nro,nombre,descripcion,color,icono,estado) "
                   + "values (?,?,?,?,?,?)";
           
           PreparedStatement ps= conn.prepareStatement(qry);
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
