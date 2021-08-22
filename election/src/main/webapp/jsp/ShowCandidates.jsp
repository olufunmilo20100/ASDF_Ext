

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     
 <%@ page import="java.util.ArrayList" %>   
 <%@ page import="data.Candidates" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<body style='background-color: #E7CFCA;'>
<head>
    <title>Candidates List</title>
</head>
<body>
<br>
<ul>
<a href="/jsp/AdminPage.jsp">Home</a>
</ul>
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>Candidate's Information Admin Use</h2></caption>
            <tr>
                <th>ID</th>
                <th>FULL NAME</th>
                <th>EMAIL</th>
                <th>AGE</th>
                <th>PARTY</th>
                <th>PROFESSION</th>
                <th>UPDATE</th>
                <th>DELETE</th>

            </tr>
            <c:forEach var="candidates" items="${candidateslist}">
                <tr>
                    <td><c:out value="${candidates.id}" /></td>
                    <td><c:out value="${candidates.fullname}" /></td>
                    <td><c:out value="${candidates.email}" /></td>
                    <td><c:out value="${candidates.age}" /></td>
                    <td><c:out value="${candidates.party}" /></td>
                    <td><c:out value="${candidates.proffesion}" /></td>
                    <td>
                        <a href='/readtoupdate?id=${candidates.id}'>Update</a>
                    </td>
                    <td>
                        <a href='/delete?id=${candidates.id}'>Delete</a>                   
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>  

</body>
</html>
