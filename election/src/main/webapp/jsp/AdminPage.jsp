<!DOCTYPE html>
<html>
<body style='background-color: #E7CFCA;'>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Welcome : <%=session.getAttribute("login")%></title>



</head>

<body>

    <ul>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="logout.jsp">Logout</a>
    </ul>

    <div class="main-content">
	
	<center>
	
	<%
	if(session.getAttribute("login")==null || session.getAttribute("login")==" ") //check condition unauthorize user not direct access welcome.jsp page
	{
		response.sendRedirect("index.jsp"); 
	}
	%>
	
	<br><br>
	<h1> Welcome to your profile page @ <%=session.getAttribute("login")%> </h1>
	<h4>With the Admin Access you can update or delete candidate's information</h4>
	<br><br>
	<hr><hr><h1>
	<a href='/showcandidates'>Candidates Information</a>
	</h1>
	<hr>
	<hr>
	<br><br>

    
	</center>
		
    </div>

</body>

  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
  <br>
<footer>
<center><h4>Courtesy @ Adeniyi Olufunmilola</h4></center>
</footer>
</html>
