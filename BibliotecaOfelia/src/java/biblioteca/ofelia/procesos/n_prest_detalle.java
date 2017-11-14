package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.*;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;

public class n_prest_detalle {
    
    DBConn tran=null;
    Connection conn=null;
    String qry,qry2,qry3,qry4;
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
           qry="select dato,idprestamo, idprest_detalle, lector, ejemplar, idejemplar, usuario, fecha_prestamo, "
                   + "estado,substr(fech_dev,0,10) as fech_dev "
                   + "from detalle_prestamo where dato like ? and estado=? order by fech_dev";
            //System.out.println(qry);
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i, "%"+pd.getDato());
           ps.setString(++i, ""+pd.getEstado());
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       prest_detalle pdt=new prest_detalle();
                       pdt.setDato(rs.getString("dato"));
                       pdt.setIdprestamo(rs.getString("idprestamo"));
                       pdt.setIdprest_detalle(rs.getString("idprest_detalle"));
                       pdt.setLector(rs.getString("lector"));
                       pdt.setEjemplar(rs.getString("ejemplar"));
                       pdt.setIdejemplar(rs.getString("idejemplar"));
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
    
    public ArrayList detalle_prestamo_especifico(){
        ArrayList consulta=new ArrayList();
        try
        {
           val=0; 
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select dato,idprestamo, idprest_detalle, lector, ejemplar, idejemplar, usuario, fecha_prestamo, "
                   + "estado,substr(fech_dev,0,10) as fech_dev "
                   + "from detalle_prestamo where dato like ? and estado=? and idlector=?  order by fech_dev";
            //System.out.println(qry);
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i, "%"+pd.getDato());
           ps.setString(++i, ""+pd.getEstado());
           ps.setString(++i, ""+pd.getIdlector());
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       prest_detalle pdt=new prest_detalle();
                       pdt.setDato(rs.getString("dato"));
                       pdt.setIdprestamo(rs.getString("idprestamo"));
                       pdt.setIdprest_detalle(rs.getString("idprest_detalle"));
                       pdt.setLector(rs.getString("lector"));
                       pdt.setEjemplar(rs.getString("ejemplar"));
                       pdt.setIdejemplar(rs.getString("idejemplar"));
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
    
    public void IngresarPrestamo()
    {
       val=0;
       try{
           
           int i=0;
           int e=0;
           int o=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="insert into prestamo (idlector,idejemplar,idusuario,fecha_prestamo,estado) "
                   + "values (?,?,?,to_char(sysdate,'DD/MM/YYYY'),?)";
           System.out.println("insert into prestamo (idlector,idejemplar,idusuario,fecha_prestamo,estado) "
                   + "values ('"+pd.getIdlector()+"','"+pd.getIdejemplar()+"','"+pd.getIdusuario()+"',to_char(sysdate,'DD/MM/YYYY'),'1')");
           
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+pd.getIdlector());
           ps.setString(++i,""+pd.getIdejemplar());
           ps.setString(++i,""+pd.getIdusuario());
           ps.setString(++i,"1");
           ps.executeQuery();
           
           qry2="select max(idprestamo) as id from prestamo";
           
           PreparedStatement ps2= conn.prepareStatement(qry2);
           ResultSet rs=ps2.executeQuery();
           if(rs.next()){
                String maxid=rs.getString("id");
                qry3="insert into prest_detalle (idprestamo,fecha_dev_programada,hora_dev_programada,estado) "
                    + "values (?,?,?,?)";
           
                PreparedStatement ps3= conn.prepareStatement(qry3);
                ps3.setString(++e,""+maxid);
                ps3.setString(++e,""+pd.getFech_dev());
                ps3.setString(++e,""+pd.getHora_dev());
                ps3.setString(++e,"1");
                ps3.executeQuery();
                
                qry4="update ejemplar set estado_prestamo='1' where idejemplar=?";
           
                PreparedStatement ps4= conn.prepareStatement(qry4);
                ps4.setString(++o,""+pd.getIdejemplar());
                ps4.executeQuery();
                
                ps3.close();
                ps4.close();
           }
           
           
           
           val=1;   
           ps.close();
           ps2.close();
           rs.close();
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
    
    public void DevolverLibro()
    {
        System.out.println("--------------------");
       val=0;
       try{
           
           int i=0;
           int e=0;
           int o=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="update prestamo set estado='2' where idprestamo=?";
           System.out.println("update prestamo set estado='2' where idprestamo='"+pd.getIdprestamo()+"'");
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+pd.getIdprestamo());
           ps.executeQuery();
           
           qry2="update prest_detalle set estado='2', fecha_dev_efectiva=to_char(sysdate,'DD/MM/YYY'),"
                   + "hora_dev_efectiva=to_char(sysdate,'hh:mm'), devuelta=? where idprestamo=?";
           
           PreparedStatement ps2= conn.prepareStatement(qry2);
           ps2.setString(++e,""+pd.getDevuelta());
           ps2.setString(++e,""+pd.getIdprestamo());
           ps2.executeQuery();
           
            qry3="update ejemplar set estado_prestamo='0' where idejemplar=?";

            PreparedStatement ps3= conn.prepareStatement(qry3);
            ps3.setString(++o,""+pd.getIdejemplar());
            ps3.executeQuery();
           val=1;   
           ps.close();
           ps2.close();
           ps3.close();
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
    
    public void UpdateLibro()
    {
       val=0;
       try{
           
           int i=0;
           int e=0;
           int o=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           
           qry="update prest_detalle set fecha_dev_programada=?, hora_dev_programada=? where idprest_detalle=?";
           PreparedStatement ps= conn.prepareStatement(qry);
           ps.setString(++i,""+pd.getFech_dev());
           ps.setString(++i,""+pd.getHora_dev());
           ps.setString(++i,""+pd.getIdprest_detalle());
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
