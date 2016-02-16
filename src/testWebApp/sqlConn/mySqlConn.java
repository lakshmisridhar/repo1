package testWebApp.sqlConn;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class mySqlConn {

 private static final String url= "jdbc:mysql://localhost/test";
 private static final String user ="root";
 private static final String password ="sesame";
 public static void main (String args[]) {
	
	 try{
		 Class.forName("com.mysql.jdbc.Driver").newInstance();
		 
		 Connection con = DriverManager.getConnection(url, user, password);
		 System.out.println("Connection Successful");
		  Statement stmt = con.createStatement();
		  ResultSet rs;
		  rs = stmt.executeQuery("SELECT * FROM student");
		  System.out.println(rs.getMetaData().getColumnName(1) +"\t" +  rs.getMetaData().getColumnName(2));
		  
		  while(rs.next()){
			  
			  int id = rs.getInt("id");
			  String name = rs.getString("name");
			  System.out.println(id +"\t" + name);
		  
		  }
		  con.close();
	 }catch(Exception e){
		 e.printStackTrace();
	 }
 }
}
