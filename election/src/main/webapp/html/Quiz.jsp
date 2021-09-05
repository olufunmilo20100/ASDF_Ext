<%@page contentType="text/html" language="java" import="java.sql.*"%>

<html>
<body style='background-color: #E7CFCA;'>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Result : <%=session.getAttribute("login")%></title>

	<link rel="stylesheet" type="text/css" href="css/style.css" />

</head>
	<%
//	if(session.getAttribute("login")==null || session.getAttribute("login")==" ") //check condition unauthorize user not direct access welcome.jsp page
//	{
//		response.sendRedirect("index.html"); 
//	}
	%>
<br><br>	
<h4> &nbsp;&nbsp;&nbsp; Current Login @ <%=session.getAttribute("login")%> </h4>
<br><br><br><br><br><br>
<body>
<hr/>
<br><br><br>
<center>
<%
String str1=request.getParameter("ans1");
String str2=request.getParameter("ans2");
String str3=request.getParameter("ans3");
String str4=request.getParameter("ans4");
String str5=request.getParameter("ans5");
String str6=request.getParameter("ans6");
String str7=request.getParameter("ans7");
String str8=request.getParameter("ans8");
String str9=request.getParameter("ans9");
String str10=request.getParameter("ans10");

int mark=0;

Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/electionmachine","testuser","password");
Statement stmt=con.createStatement();
ResultSet rs=stmt.executeQuery("SELECT * FROM answers");


int i=1;
while(rs.next())
{
 if(i==1)
 {
  String dbans1=rs.getString(1);
  if(str1.equals(dbans1))
  {
   mark=mark+1;
  }
 }
 if(i==2)
 {
  String dbans2=rs.getString(1);
  if(str2.equals(dbans2))
  {
   mark=mark+1;
  }
 }
 if(i==3)
 {
  String dbans3=rs.getString(1);
  if(str3.equals(dbans3))
  {
   mark=mark+1;
  }
 }
 if(i==4)
 {
  String dbans4=rs.getString(1);
  if(str4.equals(dbans4))
  {
   mark=mark+1;
  }
 }
 if(i==5)
 {
  String dbans5=rs.getString(1);
  if(str5.equals(dbans5))
  {
   mark=mark+1;
  }
 }
 if(i==6)
 {
  String dbans6=rs.getString(1);
  if(str6.equals(dbans6))
  {
   mark=mark+1;
  }
 }
 if(i==7)
 {
  String dbans7=rs.getString(1);
  if(str7.equals(dbans7))
  {
   mark=mark+1;
  }
 }
 if(i==8)
 {
  String dbans8=rs.getString(1);
  if(str8.equals(dbans8))
  {
   mark=mark+1;
  }
 }
 if(i==9)
 {
  String dbans9=rs.getString(1);
  if(str9.equals(dbans9))
  {
   mark=mark+1;
  }
 }
 if(i==10)
 {
  String dbans10=rs.getString(1);
  if(str10.equals(dbans10))
  {
   mark=mark+1;
  }
 }
 i++;
}

out.println("<h1>Thank you for your participation in the Election Questionnaire</h1>");

out.println("<h1>YOU HAVE SCORED: "+mark+"</h1>");

out.println("<h1>Your Score is now Updated against your record.</h1>");
%>
<br><br>
<hr>



<%
PreparedStatement pstmt=null; //create statement
pstmt=con.prepareStatement("UPDATE SCORES SET SCORE = "+mark+" WHERE username = '"+session.getAttribute("login")+"'");
pstmt.executeUpdate();

request.setAttribute("successMsg","Score Successfully updated to Database"); //register success messeage
con.close(); //close connection
%>

</center>
</form>
</body>
<br><br><br>
<p>
<center><a href="/jsp/welcome.jsp">Exit Page</a></center>
</p>

  <br>
  <br>
  <br>
  <br>
<footer>
<center><h4>Courtesy @ Adeniyi Olufunmilola</h4></center>
</footer>
</html>
