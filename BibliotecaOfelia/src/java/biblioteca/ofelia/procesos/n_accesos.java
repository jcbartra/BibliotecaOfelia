package biblioteca.ofelia.procesos;
import biblioteca.ofelia.entidad.accesos;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;

public class n_accesos {
    
    DBConn tran=null;
    Connection conn=null;
    String qry,qry2;
    public static int val;
    
    accesos ac=new accesos();

    public n_accesos() {
        tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
        return MError;
    }

    public accesos getAc() {
        return ac;
    }

    public void setAc(accesos ac) {
        this.ac = ac;
    }
    
    public void ActualizarAccesos(){
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idmenu from menu where idmenu=? and roles like ?";
            System.out.println("select idmenu from menu where idmenu='"+ac.getIdmenu()+"' and roles like '%"+ac.getIdrol()+"%'");
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i, ""+ac.getIdmenu());
           ps.setString(++i, ""+ac.getIdrol()+"-");
           ResultSet rs=ps.executeQuery();
           if(!rs.next())
                   {
                       qry2="update menu set roles=roles||? where idmenu=?";
                       System.out.println("update menu set roles=roles||'"+ac.getIdrol()+"-' where idmenu='"+ac.getIdmenu()+"'");
                        PreparedStatement ps2= conn.prepareStatement(qry2);
                        ps2.setString(++e, ""+ac.getIdrol()+"-");
                        ps2.setString(++e, ""+ac.getIdmenu());
                        ps2.executeQuery();
                        val=2;   
                        ps2.close();
                   }
           else{
               val =2;
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
    }
    
    public void ActualizarSubAccesos(){
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idsubmenu from submenu where idsubmenu=? and roles like ?";
            System.out.println("select idsubmenu from submenu where idsubmenu='"+ac.getIdsubmenu()+"' and roles like '%"+ac.getIdrol()+"%'");
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i, ""+ac.getIdsubmenu());
           ps.setString(++i, ""+ac.getIdrol()+"-");
           ResultSet rs=ps.executeQuery();
           if(rs.next())
                   {
                      val=2; 
                   }
           else{
               qry2="update submenu set roles=roles||? where idsubmenu=?";
                System.out.println("update submenu set roles=roles||'"+ac.getIdrol()+"-' where idsubmenu='"+ac.getIdsubmenu()+"'");
                 PreparedStatement ps2= conn.prepareStatement(qry2);
                 ps2.setString(++e, ""+ac.getIdrol()+"-");
                 ps2.setString(++e, ""+ac.getIdsubmenu());
                 ps2.executeQuery();
                 val=2;   
                 ps2.close();
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
    }
    
    public void BorrarAccesos(){
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="update menu set roles=replace(roles,?,'')";
           System.out.println("update menu set roles=replace(roles,'"+ac.getIdrol()+"-',''");
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i, ""+ac.getIdrol()+"-");
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
    public void BorrarSubAccesos(){
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idsubmenu from submenu where idsubmenu=? and roles like ?";
           System.out.println("select idsubmenu from submenu where idsubmenu='"+ac.getIdsubmenu()+"' and roles like '%"+ac.getIdrol()+"%'");
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i, ""+ac.getIdsubmenu());
           ps.setString(++i, "%"+ac.getIdrol()+"%");
           ResultSet rs=ps.executeQuery();
           if(rs.next())
                   {
                       qry2="update submenu set roles=replace(roles,?,'') where idsubmenu=?";
                       System.out.println("update submenu set roles=replace(roles,'"+ac.getIdrol()+"-','') where idsubmenu='"+ac.getIdsubmenu()+"'");
                        PreparedStatement ps2= conn.prepareStatement(qry2);
                        ps2.setString(++e, ""+ac.getIdrol()+"-");
                        ps2.setString(++e, ""+ac.getIdsubmenu());
                        ps2.executeQuery();
                        val=2;   
                        ps2.close();
                   }
           else{
               val =2;
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
    }
    
}
