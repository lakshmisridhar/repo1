<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Retrieve Data from MySql server</title>
</head>
<body>
<%

Class.forName("com.mysql.jdbc.Driver").newInstance();

Connection con = DriverManager.getConnection("jdbc:mysql://localhost/test", "root", "sesame");
System.out.println("Connection Successful");
 Statement stmt = con.createStatement();
 ResultSet rs;
 rs = stmt.executeQuery("SELECT * FROM student");
 System.out.println(rs.getMetaData().getColumnName(1) +"\t" +  rs.getMetaData().getColumnName(2));%>
<table border="1" cellpadding="5">
<tr>
<th><% out.println(rs.getMetaData().getColumnName(1)); %></th>
<th><% out.println(rs.getMetaData().getColumnName(2)); %></th>
</tr>
<% while(rs.next()){
	   int id = rs.getInt("id");
	  String name = rs.getString("name");
	  System.out.println(id +"\t" + name); %>
<tr>
<td><%out.println(id); %> </td>
<td><%out.println(name); }%> </td>
</tr>
</table>  
<% 
 con.close();
%>
</body>
</html>