<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Remove Registered Poster</title>

<link rel="stylesheet" href="main.css" type="text/css" >
</head>

<%@ page import="java.sql.*" %>

<div class="content">


<div id ="side">
	<br><br>
	
	<a href="index.html">Back Home Page</a>	 <br><br>
	<a href="remove_participant.html">Remove Visitor</a>	<br><br>
	
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
    String participant_id = request.getParameter( "participant_id" );
   	String query = "delete from " + tableName + 
   					" where participant_id" + " = " + participant_id;
   				
	%>	
   	<h1>Remove Registered Visitor</h1>
	<% 
	int result = s.executeUpdate(query);
	

	if( result == 0 ) {
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

</div>
</div>

</body>
</html>