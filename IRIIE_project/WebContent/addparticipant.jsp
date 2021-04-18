<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Participant</title>
<link rel="stylesheet" href="main.css" type="text/css" >
</head>
<body>
<%@ page import="java.sql.*" %>

<div class="content">

<div id ="side">
	<br><br>
	<a href="index.html">Back Main Page</a>	 <br><br>
	<a href ="addparticipant.html"> Add New Visitor</a>
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
    
    String type = "participant";
    
   	String participant_name =  request.getParameter("participant_name" );
   //	String poster_title = request.getParameter("poster_title");
   	String affiliation =  request.getParameter("affiliation" );
   	String phone_no =  request.getParameter("phone_no" );
   	String category = request.getParameter( "type" );
   	String email = request.getParameter("email");
   	
   	 	 	
   	if ((participant_name == null ) || (participant_name.trim().equals("")) && (affiliation == null ) || (affiliation.trim().equals("")) && (category == null ) || (category.trim().equals(""))&& (email == null ) || (email.trim().equals("")))
   	{
   		response.sendRedirect("addparticipant.html"); 
   	}
   	else
   	{
  	//  This part is for first data entry 	
  	
  	String query =  "insert into " + type + " " +
  		    "(participant_name, affiliation, phone_no, email, category)" +
  		    " values( '" + participant_name + "', '" + affiliation + "', '" + phone_no + "', '" +  email + "', '"+ category + "' )"; 			
  	System.out.println( query );
   				
	%>	
   	<h1>Add New Visitor</h1>
	<% 
	int result = s.executeUpdate(query);

	if( result == 0 ) {
		%>
		<label>
		 Database Error 
		</label>
		<%
	}
	else 
		 {	
	    	%>
			<label>
			
			Successfully added the participant to the database.
			
			</label>
			<%
		}

   	}
} catch (Exception e){
	%>
		<label>
		 Something went terribly wrong! <br><br>
			<%= e.toString() %>
		
		</label> 
		<%
}

%>

</div>
</div>
</body>
</html>