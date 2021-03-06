package biblioteca.ofelia.procesos;
import biblioteca.ofelia.entidad.menu;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;

public class n_menu {
    
    DBConn tran=null;
    Connection conn=null;
    String qry,qry2;
    public static int val;
    
    menu m=new menu();

    public n_menu() {
        tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
   return MError;
    }

    public menu getM() {
        return m;
    }

    public void setM(menu m) {
        this.m = m;
    }
    
    public ArrayList Menu_General(){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idmenu,nombre,link,icono,roles,estado from menu "
                   + "order by idmenu";
            System.out.println(qry);
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       menu mn=new menu();
                       mn.setIdmenu(rs.getString("idmenu"));
                       mn.setNombre(rs.getString("nombre"));
                       mn.setLink(rs.getString("link"));
                       mn.setIcono(rs.getString("icono"));
                       mn.setRoles(rs.getString("roles"));
                       mn.setEstado(rs.getString("estado"));
                       consulta.add(mn);
                   }
           rs.close();
           ps.close();
           conn.close(); 
        }
         catch(SQLException e){
                     try{
                    conn.rollback();
                    setMError(e.getMessage()+"<br>Transaction is being rolled back");
                    System.out.println(e.getMessage()+"<br>Transaction is being rolled back");
                    }
                    catch(SQLException e2)
                    {
                        setMError(e.getMessage());
                        System.out.println(e.getMessage()+"----");
                    }
              }
             catch(Exception e){
                    System.out.println(e.getMessage());
                    setMError(e.getMessage());
             }
             finally{
                    try{if(conn!=null) conn.close();}
                    catch(SQLException e){setMError(e.getMessage());
                    System.out.println(e.getMessage()+"*******");
                    }
                    
             }
        return consulta;
    }
    
    public ArrayList ListarMenu(){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idmenu,nombre,link,icono,estado from menu "
                   + "where estado!='0' and roles like ? "
                   + "order by idmenu";
           /* System.out.println("select idmenu,nombre,link,icono,estado from menu "
                   + "where estado!='0' and roles like '%"+m.getRoles()+"%' "
                   + "order by idmenu");*/
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,"%"+m.getRoles()+"%");
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       menu mn=new menu();
                       mn.setIdmenu(rs.getString("idmenu"));
                       mn.setNombre(rs.getString("nombre"));
                       mn.setLink(rs.getString("link"));
                       mn.setIcono(rs.getString("icono"));
                       mn.setEstado(rs.getString("estado"));
                       consulta.add(mn);
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
    
    public ArrayList ListarMenuRol(){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idmenu,nombre,estado from menu "
                   + "where roles like ? "
                   + "order by idmenu";
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,"%"+m.getRoles()+"%");
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       menu mn=new menu();
                       mn.setIdmenu(rs.getString("idmenu"));
                       mn.setNombre(rs.getString("nombre"));
                       mn.setEstado(rs.getString("estado"));
                       consulta.add(mn);
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
    
    public void VefificarLink(){
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select link from link where roles like ? and link=?";
           System.out.println("select link from link where roles like '%"+m.getRoles()+"%' and link='"+m.getLink()+"'");
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,"%"+m.getRoles()+"%");
           ps.setString(++i,""+m.getLink());
           ResultSet rs=ps.executeQuery();
           if(rs.next())
                   {
                       val=1;
                   }
           else if(m.getLink().equals("Inicio.jsp")){val=1;}
           else{val=2;}
           rs.close();
           ps.close();
           conn.close(); 
        }
         catch(SQLException e){
                     try{
                    conn.rollback();
                    setMError(e.getMessage()+"<br>Transaction is being rolled back");
                         //System.out.println(e.getMessage());
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
    
    public void IngresarMenu()
    {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="insert into menu (nombre,link,roles,icono,estado) "
                   + "values (?,?,?,?,?)";
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+m.getNombre());
           ps.setString(++i,""+m.getLink());           
           ps.setString(++i,"0001-");
           ps.setString(++i,""+m.getIcono());
           ps.setString(++i,""+m.getEstado());
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
    
    public void BorrarMenu()
    {
       val=0;
       try{
           
           int i=0,e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="delete submenu where idmenu=?";
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+m.getIdmenu());
           ps.executeQuery();
           ps.close();
           
           qry2="delete menu where idmenu=?";
           
           PreparedStatement ps2= conn.prepareStatement(qry2);
           ps2.setString(++e,""+m.getIdmenu());
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
    
    public void ActualizarMenu()
    {
       val=0;
       try{
           
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="update menu set nombre=?,link=?,icono=?,estado=? where idmenu=?";
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+m.getNombre());
           ps.setString(++i,""+m.getLink());
           ps.setString(++i,""+m.getIcono());
           ps.setString(++i,""+m.getEstado());
            ps.setString(++i,""+m.getIdmenu());
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
