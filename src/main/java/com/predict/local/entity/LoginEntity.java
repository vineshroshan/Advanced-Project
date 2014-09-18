package com.predict.local.entity;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSetMetaData;
import com.mysql.jdbc.Statement;

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
	
	public boolean check(String userName, String password) throws ClassNotFoundException, SQLException
	{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = (Connection) DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/predict", "adminCpFR6Pr", "MZh18gWxnNMJ");
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
