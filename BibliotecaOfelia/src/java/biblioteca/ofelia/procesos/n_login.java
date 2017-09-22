/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.procesos;

import biblioteca.ofelia.entidad.*;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;

public class n_login {
    
    DBConn tran=null;
    Connection conn=null;
    String qry,qry2;//almacena la transacción
    public static int val;//definir si la transacción tuvo éxito
    
    usuario us=new usuario();
    
    public n_login(){
           tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
   return MError;
    }

    public usuario getUs() {
        return us;
    }

    public void setUs(usuario us) {
        this.us = us;
    }
    
    public void Buscar_usuario()
    {
        try
        {
           int i=0;
           int e=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select usuario from usuario where usuario=? and estado='1'";
           PreparedStatement ps1= conn.prepareStatement(qry);
           ps1.setString(++i,""+us.getUsuario());
           ResultSet rs1=ps1.executeQuery();
           if(rs1.next())
                   {
                       val=1;
                       qry2="select rol,persona from login where usuario=? and clave=? ";
                       PreparedStatement ps2= conn.prepareStatement(qry2);
                       ps2.setString(++e,""+us.getUsuario());
                       ps2.setString(++e,""+us.getClave());
                       ResultSet rs2=ps2.executeQuery();
                       if(rs2.next())
                       {
                           us.setIdrol(rs2.getString("rol"));
                           us.setIdpersona(rs2.getString("persona"));
                           val=2;
                       }
                       rs2.close();
                       ps2.close();
                   }
           rs1.close();
           ps1.close();
           conn.close(); 
           /*
           for(int n=0;n<consulta.size();n++){
                   auto aus= (auto) consulta.get(n);
           }*/
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
