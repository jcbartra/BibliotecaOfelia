package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.*;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;

public class n_prest_detalle {
    
    DBConn tran=null;
    Connection conn=null;
    String qry,qry2;
    public static int val;
    
    prest_detalle pd=new prest_detalle();
    
    
    public n_prest_detalle(){
           tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
        return MError;
    }

    public prest_detalle getPd() {
        return pd;
    }

    public void setPd(prest_detalle pd) {
        this.pd = pd;
    }
    
    public ArrayList detalle_prestamo_general(){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select idprestamo, idprest_detalle, lector, ejemplar, usuario, fecha_prestamo, "
                   + "estado,substr(fech_dev,0,10) as fech_dev "
                   + "from detalle_prestamo where estado='1' order by idprestamo";
            //System.out.println(qry);
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       prest_detalle pdt=new prest_detalle();
                       pdt.setIdprestamo(rs.getString("idprestamo"));
                       pdt.setIdprest_detalle(rs.getString("idprest_detalle"));
                       pdt.setLector(rs.getString("lector"));
                       pdt.setEjemplar(rs.getString("ejemplar"));
                       pdt.setUsuario(rs.getString("usuario"));
                       pdt.setFecha_prestamo(rs.getString("fecha_prestamo"));
                       pdt.setEstado(rs.getString("estado"));
                       pdt.setFech_dev(rs.getString("fech_dev"));
                       consulta.add(pdt);
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
