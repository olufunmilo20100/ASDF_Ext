<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>   
<%@ page import="data.Candidates" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
if(session.getAttribute("login")!=null) //check login session user not access or back to register.jsp page
{
	response.sendRedirect("welcome.jsp");
}
%>

<center>
<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3308/electionmachine","testuser","password"); //create connection
	
	if(request.getParameter("btn_register")!=null) //check register button click event not null
	{
		String firstname,lastname,email,password,username,fullname, age,party, proffesion;
		
		firstname=request.getParameter("txt_firstname"); //txt_firstname
		lastname=request.getParameter("txt_lastname"); //txt_lastname
		email=request.getParameter("txt_email"); //txt_email
		password=request.getParameter("txt_password"); //txt_password
		fullname=request.getParameter("txt_fullname"); //txt_fullname
		username=request.getParameter("txt_username"); //txt_username
		age=request.getParameter("txt_age"); //txt_age
		party=request.getParameter("txt_party"); //txt_party
		proffesion=request.getParameter("txt_proffesion"); //txt_proffesion
		
		PreparedStatement pstmt=null; //create statement
		
		pstmt=con.prepareStatement("insert into login(firstname,lastname,username,email,password) values(?,?,?,?,?)");//sql insert query
		pstmt.setString(1,firstname);
		pstmt.setString(2,lastname);
		pstmt.setString(3,username);
		pstmt.setString(4,email);
		pstmt.setString(5,password);
		
		PreparedStatement pstmt1=null; //create statement
		pstmt1=con.prepareStatement("insert into candidates(fullname,age,email,party,proffesion) values(?,?,?,?,?)");//sql insert query
		pstmt1.setString(1,fullname);
		pstmt1.setString(2,age);
		pstmt1.setString(3,email);
		pstmt1.setString(4,party);
		pstmt1.setString(5,proffesion);
		
		PreparedStatement pstmt2=null; //create statement
		pstmt2=con.prepareStatement("insert into scores(email,username) values(?,?)");//sql insert query
		pstmt2.setString(1,email);
		pstmt2.setString(2,username);
		
		
		
		pstmt.executeUpdate(); //execute query
		pstmt1.executeUpdate(); //execute query
		pstmt2.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Register Completed...! Please Go to Login Page"); //register success messeage

		con.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%>  
</center>

<!DOCTYPE html>
<html>
<body style='background-color: #E7CFCA;'>
<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<title>Registration Page</title>

	<link rel="stylesheet" href="html/css/style.css">
	
	<!-- javascript for registeration form validation-->
	<script>	
	
		function validate()
		{
			var first_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var last_name= /^[a-z A-Z]+$/; //pattern allowed alphabet a-z or A-Z 
			var email_valid= /^[\w\d\.]+\@[a-zA-Z\.]+\.[A-Za-z]{1,4}$/; //pattern valid email validation
			var password_valid=/^[A-Z a-z 0-9 !@#$%&*()<>]{6,12}$/; //pattern password allowed A to Z, a to z, 0-9, !@#$%&*()<> charecter 
			
			var fname = document.getElementById("fname"); //textbox id fname
            var lname = document.getElementById("lname"); //textbox id lname
            var email = document.getElementById("email"); //textbox id email
            var password = document.getElementById("password"); //textbox id password
			
			if(!first_name.test(fname.value) || fname.value=='') 
            {
				alert("Enter Firstname Alphabet Only....!");
                fname.focus();
                fname.style.background = '#f08080';
                return false;                    
            }
			if(!last_name.test(lname.value) || lname.value=='') 
            {
				alert("Enter Lastname Alphabet Only....!");
                lname.focus();
                lname.style.background = '#f08080';
                return false;                    
            }
			if(!email_valid.test(email.value) || email.value=='') 
            {
				alert("Enter Valid Email....!");
                email.focus();
                email.style.background = '#f08080';
                return false;                    
            }
			if(!password_valid.test(password.value) || password.value=='') 
            {
				alert("Password Must Be 6 to 12 and allowed !@#$%&*()<> character");
                password.focus();
                password.style.background = '#f08080';
                return false;                    
            }
		}
		
	</script>	

</head>

<body>

    <ul>
        <a href="/index.html">Home Page</a>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="index.jsp"> <b> Login </b></a>

    </ul>

    <div class="main-content">

        <form class="form-register" method="post" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">
					<center>
                    <div class="form-title-row">
                        <h1>Candidates Registration</h1>
                    </div>
				   </center>
					<p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
					%>
					</p>
				   
				   </br>
				   <center>
                    <div class="form-row">
                        <label>
                            <span>First Name</span>
                            <input type="text" name="txt_firstname" id="fname" placeholder="enter firstname">
                        </label>
                        <br><br>
                    </div>
					<div class="form-row">
                        <label>
                            <span>Last Name</span>
                            <input type="text" name="txt_lastname" id="lname" placeholder="enter lastname">
                        </label>
                        <br><br>
                    </div>
                                        
                    <div class="form-row">
                        <label>
                            <span>Full Name</span>
                            <input type="text" name="txt_fullname" id="fullname" placeholder="enter fullname">
                        </label>
                        <br><br>
                    </div>
                    
                    <div class="form-row">
                        <label>
                            <span>User Name</span>
                            <input type="text" name="txt_username" id="username" placeholder="enter username">
                        </label>
                        <br><br>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Email</span>
                            <input type="text" name="txt_email" id="email" placeholder="enter email">
                        </label>
                        <br><br>
                    </div>
                    
                <div class="form-row">
                <label>
                <span>Profession</span>
                <input type="text" name="txt_proffesion" id="proffesion" placeholder="enter profession">
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
                    
                    <div class="form-row">
                        <label>
                            <span>Age</span>
                <select name="txt_age">
                <option value=""> Select Age</option> 
    			<option value="18"> 18 </option>
   				<option value="19"> 19 </option>
    			<option value="20"> 20 </option>
    			<option value="21"> 21 </option>
    			<option value="22"> 22 </option>
    			<option value="23"> 23 </option>
    			<option value="24"> 24 </option>
    			<option value="25"> 25 </option>
    			<option value="26"> 26 </option>
    			<option value="27"> 27 </option>
    			<option value="28"> 28 </option>
    			<option value="29"> 29 </option>
    			<option value="30"> 30 </option>
    			<option value="31"> 31 </option>
    			<option value="32"> 32 </option>
    			<option value="33"> 33 </option>
    			<option value="34"> 34 </option>
    			<option value="35"> 35 </option>
    			<option value="36"> 36 </option>
    			<option value="37"> 37 </option>
    			<option value="38"> 38 </option>
    			<option value="39"> 39 </option>
    			<option value="40"> 40 </option>
    			<option value="41"> 41 </option>
    			<option value="42"> 42 </option>
    			<option value="43"> 43 </option>
    			<option value="44"> 44 </option>
    			<option value="45"> 45 </option>
    			<option value="46"> 46 </option>
    			<option value="47"> 47 </option>
    			<option value="48"> 48 </option>
    			<option value="49"> 49 </option>
    			<option value="50"> 50 </option>
    			<option value="51"> 51 </option>
    			<option value="52"> 52 </option>
    			<option value="53"> 53 </option>
    			<option value="54"> 54 </option>
    			<option value="55"> 55 </option>
    			<option value="56"> 56 </option>
    			<option value="57"> 57 </option>
    			<option value="58"> 58 </option>
    			<option value="59"> 59 </option>
    			<option value="60"> 60 </option>
				</select>
				<input type=hidden name="txt_age" id="age">
                        </label>
                        <br><br>
                    </div>
                    
                 <div class="form-row">
                        <label>
                            <span>Party</span>
                <select name="txt_party" id="party">
                <option value=""> Select Party </option> 
    			<option value="National Coalition Party – KOK"> National Coalition Party – KOK </option>
   				<option value="The Social Democratic Party of Finland - SDP"> The Social Democratic Party of Finland - SDP </option>
    			<option value="The Finns – PS"> The Finns – PS </option>
    			<option value="Centre Party – KESK"> Centre Party – KESK </option>
    			<option value="Left Alliance of Finland – VAS"> Left Alliance of Finland – VAS </option>
    			<option value="The Greens of Finland – VIHR"> The Greens of Finland – VIHR </option>
    			<option value="The Swedish People’s Party – RKP"> The Swedish People’s Party – RKP </option>
    			<option value="Christian Democrats – KD"> Christian Democrats – KD </option>
				</select>  
				<input type=hidden name="txt_party" id="party">      
                    </label>
                    <br><br><br><br>
                    </div>  
                        
                               

					<input type="submit" name="btn_register" value="Submit">
					
                </div>
				
                

            </div>

        </form>

    </div>

</body>

</html>
