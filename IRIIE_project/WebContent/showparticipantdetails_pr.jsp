<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>All Pre-Registered Poster Details</title>
<link rel="stylesheet" href="main.css" type="text/css" >
</head>
<body>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection c = null;
Statement s = null;
ResultSet r = null;


try
{
    c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
    s=c.createStatement();
   
   	String tableName = "Prereg" ;
   	String query = "select * from " + tableName + "" ;
   
   	%>	
	
	
<div id ="side">
	<a href="index.html">Back Home Page</a>	 <br> 
	
</div>
   <br> <br> <br> <br> <br><center> <h2>All Pre-Registered Poster Details </h2> </center>
	<% 
	r = s.executeQuery(query);
	
	
	 out.println("<CENTER> <TABLE BORDER =1>");
		ResultSetMetaData r_s_m_d = r.getMetaData();
		int columnCount = r_s_m_d.getColumnCount();
		out.println("<TR>");
		
		for (int i = 1 ; i <= columnCount; i++){
			out.println("<TH>" + r_s_m_d.getColumnName(i));
			
		}
		out.println();
		while (r.next()){
			out.println("<TR>");
			for (int i = 1 ; i <= columnCount; i++){
				out.println("<TD>" +r.getString(i));
			}
			out.println();
		}
		out.println("</TABLE> </CENTER>");
		c.close();	


}catch (Exception e){
	%>
		<div class="error">
		<label>
		<b> Something went terribly wrong!</b> <br><br>
			<%= e.toString() %>
		</label>
		</div>
		 
	<% 
}

%>

</body>
</html>