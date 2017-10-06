package biblioteca.ofelia.procesos;
import biblioteca.ofelia.entidad.menu;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;

public class n_menu {
    
    DBConn tran=null;
    Connection conn=null;
    String qry;
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
                   + "where roles like '*%' or roles like ? and estado!='0' "
                   + "order by idmenu";
            System.out.println("select nombre,link,icono,estado from menu "
                   + "where roles like '*%' or roles like '%"+m.getRoles()+"%' and estado!='0' "
                   + "order by idmenu");
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
    
}
