package biblioteca.ofelia.procesos;
import biblioteca.ofelia.entidad.rolp;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;

public class n_rolp {
    
    DBConn tran=null;
    Connection conn=null;
    String qry,qry2;
    public static int val;
    
    rolp r=new rolp();

    public n_rolp() {
        tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
   return MError;
    }

    public rolp getR() {
        return r;
    }

    public void setR(rolp r) {
        this.r = r;
    }
    
    public ArrayList Roles_Generales(){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idrol,rol,estado from rol "
                   + "order by idrol";
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       rolp rp=new rolp();
                       rp.setIdrol(rs.getString("idrol"));
                       rp.setRol(rs.getString("rol"));
                       rp.setEstado(rs.getString("estado"));
                       consulta.add(rp);
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
