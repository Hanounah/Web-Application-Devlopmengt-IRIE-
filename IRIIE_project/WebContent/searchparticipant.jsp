<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Participant </title>
<link rel="stylesheet" href="main.css" type="text/css" >
</head>
<body>
<%@ page import="java.sql.*" %>

<div class="content">

<div id ="side">
	<br><br>
	<a href="index.html">Back Home Page</a>	 <br><br>
	<a href="searchparticipant.html">Search Participant</a>	<br><br>
	</div>

<div class="box">
 

<%
Class.forName("com.mysql.jdbc.Driver");
Connection c = null;
Statement s = null;
ResultSet r = null;


try
{
    c=DriverManager.getConnection("jdbc:mysql://localhost:3306/project","root","root");
    s=c.createStatement();
   
   	String tableName = "participant"; 
   	String participant_name = request.getParameter("participant_name");
   	//String ParameterName = "poster_id";
   	String query = "select * from " + tableName +
			   " where participant_name LIKE \"" + participant_name +"%\"" ;
   	
   		%>	
   	<h1>Participant Search</h1>
	<% 
	r = s.executeQuery(query);
	
	int found = 0;
	while(r.next()) {
    	%>
   	
   		<hr>
   		<label>
   		<span>Participant Name</span>
   		<%= r.getString( "participant_name" ) %>
   		   		</label>
   		   			<label>
   		<span>Affiliation</span>
   		<%= r.getString( "affiliation" ) %>
   		   		</label>
   		   			<label>
   		<span>Phone No</span>
   		<%= r.getString( "phone_no" ) %>
   		   		</label>
   		   				<label>
   		<span>Phone No</span>
   		<%= r.getString( "email" ) %>
   		   		</label>
   		   		
   		   			<label>
   		<span>Category</span>
   		<%= r.getString( "category" ) %>
   		   		</label>
   		   		<button> Register </button>
   		<% 
    	
    	found = 1;	
    }	
	
	if( found == 0 ) {
		%>
		
		<div class="error"> <label>
		No such record exists!
		</label>
		</div> 
		
		<%
	}
	
}catch (Exception e){
	%>
		<div class="error">
		<label>
		 <b>Something went terribly wrong!</b> <br><br>
			<%= e.toString() %>
		</label> 
		</div>
		
	<% 
}
%>

</div>
</div>

</body>
</html>