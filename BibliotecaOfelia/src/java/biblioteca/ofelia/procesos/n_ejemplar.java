package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.*;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;
public class n_ejemplar {
    
    DBConn tran=null;
    Connection conn=null;
    String qry,qry2;
    public static int val;
    
    ejemplar e=new ejemplar();
    
    
    public n_ejemplar(){
           tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
        return MError;
    }

    public ejemplar getE() {
        return e;
    }

    public void setE(ejemplar e) {
        this.e = e;
    }
    
    public ArrayList ejemplar_prestamo(){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idejemplar, titulo, autor, estado_libro, idcategoria, idsubcategoria "
                   + "from vista_ejemplar where estado='1' and estado_prestamo='0'";
            //System.out.println(qry);
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       ejemplar ej=new ejemplar();
                       ej.setIdejemplar(rs.getString("idejemplar"));
                       ej.setTitulo(rs.getString("titulo"));
                       ej.setAutor(rs.getString("autor"));
                       ej.setEstado_libro(rs.getString("estado_libro"));
                       ej.setIdcategoria(rs.getString("idcategoria"));
                       ej.setIdsubcategoria(rs.getString("idsubcategoria"));
                       consulta.add(ej);
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
