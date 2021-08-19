<%@ page import="java.sql.*" %>  

<%
if(session.getAttribute("login")!=null) //check login session user not access or back to index.jsp page
{
	response.sendRedirect("welcome.jsp");
}
%>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/electionmachine","testuser","password"); //create connection
	
	if(request.getParameter("btn_login")!=null) //check login button click event not null
	{
		String dbusername,dbpassword;
		
		String username,password;
		
		username=request.getParameter("txt_username"); //txt_username
		password=request.getParameter("txt_password"); //txt_password
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("select * from login where username=? AND password=?"); //sql select query 
		pstmt.setString(1,username);
		pstmt.setString(2,password);
		
		ResultSet rs=pstmt.executeQuery(); //execute query and store in resultset object rs.
		
		if(rs.next())
		{
			dbusername=rs.getString("username");
			dbpassword=rs.getString("password");
			
			if(username.equals("username") && password.equals("password"))
			{
				session.setAttribute("login","username"); //session name is login and store fetchable database username
				response.sendRedirect("welcome.jsp"); //after login success redirect to welcome.jsp page
			}
		}
		else
		{
			request.setAttribute("errorMsg","Invalid Login Information"); //invalid error message for email or password wrong
		}
		
		con.close(); //close connection	
	}
	
}
catch(Exception e)
{
	out.println(e);
}
%>

<!DOCTYPE html>
<html>
<body style='background-color: #E7CFCA;'>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Login Page</title>

	<link rel="stylesheet" href="html/css/style.css">
	
	<script>
		
		function validate()
		{
			var username = document.myform.txt_username;
			var password = document.myform.txt_password;
				
			if (username.value == null || username.value == "") //check username textbox not blank
			{
				window.alert("please enter username ?"); //alert message
				username.style.background = '#f08080';
				username.focus();
				return false;
			}
			if (password.value == null || password.value == "") //check password textbox not blank
			{
				window.alert("please enter password ?"); //alert message
				password.style.background = '#f08080'; 
				password.focus();
				return false;
			}
		}
			
	</script>
	
</head>

<body>
<center>
    <ul>
        <a href="/index.html">Home Page</a>
    </ul>
<br><br><br>
    <div class="main-content">

        <form class="form-register" method="post" name="myform" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Login</h1>
                    </div>
					
					<p style="color:red">				   		
					<%
					if(request.getAttribute("errorMsg")!=null)
					{
						out.println(request.getAttribute("errorMsg")); //error message for email or password 
					}
					%>
					</p>
				   
				   </br>

                    <div class="form-row">
                        <label>
                            <span>User Name</span>
                            <input type="text" name="txt_username" id="username" placeholder="enter username">
                        </label>
                        <br><br>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Password</span>
                            <input type="password" name="txt_password" id="password" placeholder="enter password">
                        </label>
                        <br><br>
                    </div>

					<input type="submit" name="btn_login" value="Login">
                    
                </div>

            </div>

        </form>

    </div>
</center>
</body>

</html>
