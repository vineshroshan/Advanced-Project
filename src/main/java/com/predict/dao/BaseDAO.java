package com.predict.dao;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.predict.context.RunServletContextClass;

public class BaseDAO {
	
	public ResultSet selectClause(String sqlquery) throws SQLException, ClassNotFoundException
	{
		Class.forName("com.mysql.jdbc.Driver");
		RunServletContextClass runServletContextClass= new RunServletContextClass(new RunServletContextClass().isLocal());
		Connection conn=(Connection) DriverManager.getConnection(runServletContextClass.getConnectionString(), runServletContextClass.getUserName(), runServletContextClass.getPassword());
		Statement st= (Statement) conn.createStatement();
		ResultSet rs=st.executeQuery(sqlquery);
		
		return rs;
	}
	

}
