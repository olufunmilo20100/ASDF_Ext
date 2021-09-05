<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
 <%@ page import="java.util.ArrayList" %>   
 <%@ page import="data.Candidates" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
	<%
	if(session.getAttribute("login")==null || session.getAttribute("login")==" ") //check condition unauthorize user not direct access welcome.jsp page
	{
		response.sendRedirect("index.jsp"); 
	}
	%>

	<%

String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3308/";
String database = "electionmachine";
String userid = "testuser";
String password = "password";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<!DOCTYPE html>
<html>
<body style='background-color: #E7CFCA;'>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Welcome @ <%=session.getAttribute("login")%></title>

	<link rel="stylesheet" href="html/css/style.css">

</head>

<body>

<div align="center">
    <style>
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.15);
}
.styled-table thead tr {
    background-color: #009879;
    color: #ffffff;
    text-align: left;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
}
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}

.styled-table tbody tr:nth-of-type(even) {
    background-color: #f3f3f3;
}

.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #009879;
}
.styled-table tbody tr.active-row {
    font-weight: bold;
    color: #009879;
}
</style>

    <ul>
        <h3><a href="logout.jsp">Logout</a></h3>
    </ul>
    <br><br>

    <div class="main-content">
	
	<center>
	
	<h1> Welcome to your profile page @ <%=session.getAttribute("login")%> </h1>
	<br><br>

</center>
<center>
<table border="1">
<tr>
                <th>ID</th>
                <th>FULL NAME</th>
                <th>EMAIL</th>
                <th>AGE</th>
                <th>PARTY</th>
                <th>PROFESSION</th>
                <th>SCORE</th>
				<th>QUESTIONNAIRE</th>
            </tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql = "SELECT candidates.*, scores.score from scores INNER JOIN candidates on scores.email = candidates.email WHERE scores.username = '"+session.getAttribute("login")+"'";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("id") %></td>
<td><%=resultSet.getString("fullname") %></td>
<td><%=resultSet.getString("email") %></td>
<td><%=resultSet.getString("age") %></td>
<td><%=resultSet.getString("party") %></td>
<td><%=resultSet.getString("proffesion") %></td>
<td><%=resultSet.getString("score") %></td>
<td><a href='/html/index.html'>Questionnaire</a></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

    </div>  
    <br><br>
    	<h1>Is your score 0? Kindly Attempt the Questionnaire to update your score.</h1> </center>
		<h2> <%=session.getAttribute("login")%>, this is your greatest opportunity to show case yourself and be known to people. 
		The questionnaire is a guide to score your interest and intension's towards your Party and the nation.</h2>
		
    </div>
    </center>

</body>

  <br>
  <br>
  <br>
  <br>
<footer>
<center><h4>Courtesy @ Adeniyi Olufunmilola</h4></center>
</footer>

</html>
