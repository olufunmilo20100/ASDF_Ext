<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ page import="java.util.ArrayList" %>   
 <%@ page import="data.Candidates" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Candidates</title>
</head>
<body>
    <center><h1>Candidate's Page</h1></center>
    <div align="center">
 
        <c:if test="${candidates == null}">
            <form action="/insert" method="post" >
        </c:if>
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    <c:if test="${candidates != null}">
                        Edit Candidate's Information
                    </c:if>
                    <c:if test="${candidates == null}">
                        Enter Candidate's Information
                    </c:if>
                </h2>
            </caption>
                <c:if test="${candidates != null}">
                    <input type="hidden" name="id" value="<c:out value='${candidates.id}' />" />
                </c:if>           
            <tr>
                <th>FULL NAME</th>
                <td>
                    <input type="text" name="fullname" size="45"
                            value="<c:out value='${candidates.fullname}' />"
                        />
                </td>
            </tr>
            <tr>
                <th>EMAIL</th>
                <td>
                    <input type="text" name="email" size="45"
                            value="<c:out value='${candidates.email}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>AGE </th>
                <td>
                <select name="age">
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
				<input type="hidden" value="<c:out value='${candidates.age}' />">

                </td>
            </tr>
                   <tr>
                <th>PARTY </th>
                <td>
                    <select name="party">
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
				<input type="hidden" value="<c:out value='${candidates.party}' />">
                </td>
            </tr>
                   <tr>
                <th>PROFESSION</th>
                <td>
                    <input type="text" name="proffesion" size="5"
                            value="<c:out value='${candidates.proffesion}' />"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save" />
                    <input type="button" value="Cancel" onclick="javascript:history.go(-1);">
                </td>
            </tr>
        </table>
        </form>
    </div>   
</body>
</html>