package predict;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.enterprise.context.RequestScoped;

@RequestScoped
public class Dummy {
		static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		static final String DB_URL = "jdbc:mysql://localhost:3306/duplicate";
		
	   //  Database credentials
	   static final String USER = "root";
	   static final String PASS = "root";
	public Dummy() {
		// TODO Auto-generated constructor stub
	}
	public String sampleTable()
	{
		 	Connection conn = null;
		 	Statement stmt = null;
		 	int i=0;
		   try{
		      //STEP 2: Register JDBC driver
		      Class.forName("com.mysql.jdbc.Driver");

		      //STEP 3: Open a connection
		      System.out.println("Connecting to database...");
		      conn = DriverManager.getConnection(DB_URL,USER,PASS);

		      //STEP 4: Execute a query
		      System.out.println("Creating statement...");
		      stmt = conn.createStatement();
		      String sql;
		      sql = "SELECT model FROM laptop";
		      ResultSet rs = stmt.executeQuery(sql);
		      rs.next();
		      //while(rs.next())
		      //{
		    	   i=(rs.getInt("model"));
		      //}
		   }
		   catch(Exception e)
		   {
			   System.out.println("caught"+e.toString());
		   }
		return new Integer(i).toString();
	}
	public String helloWorld()
	{
		return "Hello World";
	}

}
