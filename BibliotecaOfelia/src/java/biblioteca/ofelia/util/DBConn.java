package biblioteca.ofelia.util;


import java.sql.*;

public class DBConn {

  	Connection conn;
	String str_driver;	
	String str_user;
	String str_pass;
	public String MError =new String();
	STRCrypto crypt;
	
	public DBConn() {
		this.str_driver=JNDINames.STRING_DRIVER;		
	}


	public DBConn(String str_driver) {
		this.str_driver	= str_driver;
		
	}
	
  	public Connection getConnection() throws SQLException, Exception {
		crypt=new STRCrypto("ndprVF14Jp8=");
		try{
			
			DriverManager.registerDriver(new oracle.jdbc.driver.OracleDriver());
	        conn = DriverManager.getConnection(crypt.decrypt(str_driver)); 
	        
			System.out.println("Connection Successful to...!!!"/*+crypt.decrypt(str_driver)*/);




			return conn;
	    }catch(SQLException e){
    		throw new SQLException("Connect.getConnection "+e.getMessage()+" try again");
	    }catch(Exception e){
    		throw new Exception("Connect.getConnection "+e.getMessage());
	    }
  	}

	public String close() throws SQLException {
    	try{
       		if(conn!=null) {
       			conn.close(); System.out.println("Close Connection.");
       		}
       		return "Close Connection.";
       	}catch(SQLException e){
    		throw new SQLException("Connect.close "+e.getMessage());
    	}
  	}
  	


	public static void main(String[] args) {
		
	  	DBConn sql=new DBConn( JNDINames.STRING_DRIVER);
	  	try{
	  		sql.getConnection();
	  		sql.close();
	  	}catch(SQLException e){		System.out.println("e2:"+ e.getMessage() );
	  	}catch(Exception e){ 		System.out.println("e1:"+e.getMessage() );
	  	}
	  	
	}
	
}

