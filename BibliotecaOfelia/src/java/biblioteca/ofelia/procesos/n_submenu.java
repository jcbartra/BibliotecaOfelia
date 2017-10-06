package biblioteca.ofelia.procesos;
import biblioteca.ofelia.entidad.submenu;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;

public class n_submenu {
    
    DBConn tran=null;
    Connection conn=null;
    String qry;
    public static int val;
    
    submenu sm=new submenu();

    public n_submenu() {
        tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
   return MError;
    }

    public submenu getSm() {
        return sm;
    }

    public void setSm(submenu sm) {
        this.sm = sm;
    }
    
    public ArrayList ListarSubMenu(){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select nombre,link,icono from submenu "
                   + "where roles like '*%' or roles like ? and idmenu=? and estado='1' "
                   + "order by idsubmenu";
            /*System.out.println("select nombre,link,icono from submenu "
                   + "where roles like '*%' or roles like '%"+sm.getRoles()+"%' and idmenu='"+sm.getIdmenu()+"' and estado='1' "
                   + "order by idsubmenu");*/
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,"%"+sm.getRoles()+"%");
           ps.setString(++i,""+sm.getIdmenu());
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       submenu smn=new submenu();
                       smn.setNombre(rs.getString("nombre"));
                       smn.setLink(rs.getString("link"));
                       smn.setIcono(rs.getString("icono"));
                       consulta.add(smn);
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
