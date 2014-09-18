package com.predict.entity;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import com.predict.context.RunServletContextClass;

public class LoginEntity {
	private String userName;
	private String password;
	
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	
	public boolean check(String userName, String password) throws ClassNotFoundException, SQLException, ServletException, IOException
	{
		Class.forName("com.mysql.jdbc.Driver");
		RunServletContextClass servletContextClass= new RunServletContextClass(new RunServletContextClass().isLocal());
		//servletContextClass.init();
		Connection con = (Connection) DriverManager.getConnection(servletContextClass.getLocalConnectionString(),servletContextClass.getLocalUserName(),servletContextClass.getLocalPassword());
        Statement st = (Statement) con.createStatement();
        ResultSet rs= st.executeQuery("select * from Authentication where username='"+userName+"' and password='"+password+"'");
        if(rs.next())
        {
        	return true;
        }
        else
        {
        	return false;
        }
	}
	

}
