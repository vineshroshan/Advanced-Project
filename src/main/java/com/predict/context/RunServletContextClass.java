package com.predict.context;


public class RunServletContextClass
{
 private boolean local=false;
 private String openShiftConnectionString="jdbc:mysql://127.1.249.130:3306/predict";
 private String localConnectionString="jdbc:mysql://localhost:3306/duplicate";
 private String localPassword="root";
 private String localUserName="root";
 private String openShiftUserName="adminCpFR6Pr";
 private String openShiftPassword="MZh18gWxnNMJ";
 private String userName,password,connectionString;
 public RunServletContextClass() {
	// TODO Auto-generated constructor stub
}
 public RunServletContextClass(boolean local) {
	// TODO Auto-generated constructor stub
	 this.local=local;
	 if(local)
	 {
		 connectionString=localConnectionString;
		 userName=localUserName;
		 password=localPassword;
		 
	 }
	 else
	 {
		 connectionString=openShiftConnectionString;
		 userName=openShiftUserName;
		 password=openShiftPassword;
	 }
}
public boolean isLocal() {
	return local;
}
public void setLocal(boolean local) {
	this.local = local;
}
public String getOpenShiftConnectionString() {
	return openShiftConnectionString;
}
public void setOpenShiftConnectionString(String openShiftConnectionString) {
	this.openShiftConnectionString = openShiftConnectionString;
}
public String getLocalConnectionString() {
	return localConnectionString;
}
public void setLocalConnectionString(String localConnectionString) {
	this.localConnectionString = localConnectionString;
}
public String getLocalPassword() {
	return localPassword;
}
public void setLocalPassword(String localPassword) {
	this.localPassword = localPassword;
}
public String getLocalUserName() {
	return localUserName;
}
public void setLocalUserName(String localUserName) {
	this.localUserName = localUserName;
}
public String getOpenShiftUserName() {
	return openShiftUserName;
}
public void setOpenShiftUserName(String openShiftUserName) {
	this.openShiftUserName = openShiftUserName;
}
public String getOpenShiftPassword() {
	return openShiftPassword;
}
public void setOpenShiftPassword(String openShiftPassword) {
	this.openShiftPassword = openShiftPassword;
}
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
public String getConnectionString() {
	return connectionString;
}
public void setConnectionString(String connectionString) {
	this.connectionString = connectionString;
}
 
}