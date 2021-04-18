<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Participant (Pre-registration)</title>
<link rel="stylesheet" href="main.css" type="text/css" >
</head>
<body>
<%@ page import="java.sql.*" %>

<div class="content">

<div id ="side">
	<br><br>
	<a href="index.html">Back Home Page</a>	 <br><br>
	<a href="searchparticipant_pr.html">Search Pre-Registered Poster</a>	<br><br>
	
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
   
   	String tableName = "prereg"; 
   	String author_1_name = request.getParameter("author_1_name");
   	String query = "select * from " + tableName +
   				   " where author_1_name LIKE \"" + author_1_name+ "%\"";
   	
 		%>	
   	<h1>Participant Search</h1>
	<% 
	r = s.executeQuery(query);
	
	int found = 0;
	while(r.next()) {
    	%>
   	
   		<hr>
   			 <label>
   		
   	<span>ID</span>
   		<%= r.getString("poster_id")  %>
   		</label>
   		<label>
   		<span> Poster Title</span>
   		<%= r.getString( "poster_title" ) %>
   		   		</label>	
   		   		 <label>
   		<span> Type of Exhibit</span>
   		<%= r.getString( "type_of_exhibit" ) %>
   		   		</label>  	
   		   <label>
   		<span> Topic of the Poster</span>
   		<%= r.getString( "topic" ) %>
   		   		</label>
   			<label>
   		<span> First Author Name</span>
   		<%= r.getString( "Author_1_name" ) %>
   		   		</label> 
   		   		
   		   <label>
   		<span> First Author Affiliation</span>
   		<%= r.getString( "Author_1_affiliation" ) %>
   		   		</label> 
   		   	 <label>	<span> Poster Region</span>
   		<%= r.getString( "region" ) %>
   		   		</label> 
   <label>	<span> Poster Location ID</span>
   		<%= r.getString( "poster_location_id" ) %>
   		   		</label> 
   		 
   		<% 
    
    	found = 1;	
    }	
	
	if( found == 0 ) {
		%>
		
		<div class="error">
		<label>
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
<form action="register.jsp" method="POST">
 <input type="submit" class="button" value="Register" />

</form>
</div>
</div>

</body>
</html>