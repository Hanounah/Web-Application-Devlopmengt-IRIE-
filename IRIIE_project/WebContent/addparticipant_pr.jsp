<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Poster</title>
<link rel="stylesheet" href="main.css" type="text/css" >
</head>
<body>
<%@ page import="java.sql.*" %>

<div class="content">

<div id ="side">
	<br><br>
	<a href="index.html">Back Home Page</a>	 <br>
	
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
  	
    int incomplete = 0;
    
    String type = "Prereg";
    // String parameter = type.toLowerCase() + "_id";
    String exhibit =  request.getParameter("exhibit" );
    String topic = request.getParameter ("topic");
    String title =  request.getParameter("title" );
   	String abstract_1 =  request.getParameter("abstract" );
   	String author_1 = request.getParameter( "author_1" );
   	String affiliation_1 = request.getParameter( "affiliation_1" );	
  	String author_2 = request.getParameter( "author_2" );
   	String affiliation_2 = request.getParameter( "affiliation_2" );	
 	String author_3 = request.getParameter( "author_3" );
   	String affiliation_3 = request.getParameter( "affiliation_3" );	
 	String author_4 = request.getParameter( "author_4" );
   	String affiliation_4 = request.getParameter( "affiliation_4");	
 	String author_5 = request.getParameter( "author_5" );
   	String affiliation_5 = request.getParameter( "affiliation_5" );	
 	String author_6 = request.getParameter( "author_6" );
   	String affiliation_6 = request.getParameter( "affiliation_6" );	
 	String author_7 = request.getParameter( "author_7" );
   	String affiliation_7 = request.getParameter( "affiliation_7" );	
 	String author_8 = request.getParameter( "author_8" );
   	String affiliation_8 = request.getParameter( "affiliation_8" );	
 	String author_9 = request.getParameter( "author_9" );
   	String affiliation_9 = request.getParameter( "affiliation_9" );	
   	
	 	
	if ((exhibit == null ) || (exhibit.trim().equals("")) && (topic == null ) || (topic.trim().equals(""))&& (title == null ) || (title.trim().equals("")) && (author_1 == null ) || (author_1.trim().equals(""))&& (affiliation_1 == null ) || (affiliation_1.trim().equals("")))
	{
		response.sendRedirect("addparticipant_pr.html"); 
	}
	else
	{
  	//  This is for data entry 	
  	
  	String query =  
  		    "insert into " + type + " " +
  		    "(poster_title, type_of_exhibit, abstract, topic, author_1_name, author_1_affiliation,author_2_name, author_2_affiliation,author_3_name, author_3_affiliation,author_4_name, author_4_affiliation,author_5_name, author_5_affiliation,author_6_name, author_6_affiliation,author_7_name, author_7_affiliation,author_8_name, author_8_affiliation,author_9_name, author_9_affiliation )" +
  		    " values( '" + exhibit + "', '" + title + "', '" + abstract_1 + "', '" + topic+ "', '"+ author_1 +"', '" + affiliation_1 + "', '" + author_2+"', '" + affiliation_2+ "', '"+ author_3+"', '" + affiliation_3+ "', '" + author_4 + "', '" + affiliation_4+ "', '"+ author_5 +"', '" + affiliation_5+ "', '"+ author_6+"', '" + affiliation_6+ "', '"+ author_7+"', '" + affiliation_7+ "', '"+ author_8+"', '" + affiliation_8+ "', '"+ author_9+"', '" + affiliation_9+"' )";
  			
  		 			
  	System.out.println( query );
			
	%>	
   	<h1>Add New Participant (Pre-Registration)</h1>
	<% 
	int result = s.executeUpdate(query);

	if( result == 0 ) {
		%>
		<label>
		 Database Error
		</label>
		<%
	}else {

			
		%>
			<div class="success">
			<label>
			
			Successfully added the participant to the Pre-Registration Table. Thank you for Participation.
			
			</label>
			</div>
			<%
		}
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