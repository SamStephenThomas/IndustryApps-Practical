<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!-- Importing the package of DbConnection -->   
<%@ page import="com.question2.connection.DbConnection" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	table{
		border-collapse:collapse;
	}
</style>
<body>
	
	<table border="1">
		<tr>
			<th>StudentName</th>
			<th>EC1</th>
			<th>EC2</th>
			<th>EC3</th>
			<th>EC4</th>
			<th>EC5</th>
			<th>Total</th>
			
		</tr>
	
	
	
<!-- we use scriplet tags to write java code inside jsp.-->
<%
	//creating the object of DbConnection.
	DbConnection db = new DbConnection();
	//my sql version is old so there is a problem occured in GROUP BY.
	String qry = "SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''))";
	db.update(qry);
	//This is my main query to select table content.
	String qry1 = "SELECT concat(FirstName,' ',LastName) as StudentName, EC1,EC2,EC3,EC4,EC5 , SUM((EC1)+(EC2)+(EC3)+(EC4)+(EC5)) AS TOTAL From Student_Details join Mark_info on Student_Details.StudentId = Mark_info.StudentId GROUP BY StudentName";
	ResultSet rs = db.select(qry1);
	while(rs.next()){
%>
<!-- we use expression tag to print -->
<tr>
	<td><%= rs.getString(1)%></td>
	<td><%= rs.getInt(2)%></td>
	<td><%= rs.getInt(3)%></td>
	<td><%= rs.getInt(4)%></td>
	<td><%= rs.getInt(5)%></td>
	<td><%= rs.getInt(6)%></td>
	<td><%= rs.getInt(7)%></td>
</tr>

<% } %>

</table>
</body>
</html>