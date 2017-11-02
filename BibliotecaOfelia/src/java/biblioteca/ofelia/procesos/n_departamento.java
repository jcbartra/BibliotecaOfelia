/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package biblioteca.ofelia.procesos;
import biblioteca.ofelia.entidad.departamento;
import biblioteca.ofelia.util.DBConn;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import biblioteca.ofelia.entidad.*;
import biblioteca.ofelia.util.*;
import java.sql.*;
import java.util.*;
/**
 *
 * @author SORALUZ
 */
public class n_departamento {
    DBConn tran=null;
    Connection conn=null;
    String qry,qry2;//almacena la transacción
    public static int val;//definir si la transacción tuvo éxito

    departamento dep=new departamento();
    public n_departamento() {
        tran=new DBConn();
    }
    
    private String MError= new String();
    public void setMError(String mensaje)
    {MError=mensaje;}
    public String getMError()
    {
   return MError;
    }

    public departamento getDep() {
        return dep;
    }

    public void setDep(departamento dep) {
        this.dep = dep;
    }
    
    public ArrayList Listar_departamento()
    {
        ArrayList consulta=new ArrayList();
        try
        {
           int i=0;
           conn=tran.getConnection();
           conn.setAutoCommit(false);
           qry="select iddepartamento, nombre, cod, idpais from departamento";
           PreparedStatement ps= conn.prepareStatement(qry);
           ResultSet rs=ps.executeQuery();
           while(rs.next())
                   {
                       
                       departamento dep=new departamento();
                       dep.setIddepartamento(rs.getString("iddepartamento"));
                       dep.setNombre(rs.getString("nombre"));
                       dep.setCod(rs.getString("cod"));
                       dep.setIdpais(rs.getString("idpais"));
                       consulta.add(dep);
                   }
           rs.close();
           ps.close();
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
        return consulta;
    }
}