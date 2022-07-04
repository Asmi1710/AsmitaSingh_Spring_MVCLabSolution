<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<!--  Bootstrap css -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">


<!--  This provide the UI for the list of students and their details -->


<title>Students Portal</title>
</head>
<body style="background-color:#F7E2D6;text-align:center;">
	<div class="container">
		<h2 style="font-size:46px;color:#A084CF;padding:15px;">Students Portal</h2>
		<hr style="color:black;position:relative;margin-top:-15px;margin-bottom:30px;">
		
		
		<!-- This will add/update the students list. -->

		<form action="/StudentManagement/students/search" class="form-inline">

			<!-- Add a button -->
			<a style="margin-left:500px" href="/StudentManagement/student/begin-add"
				class="btn btn-primary btn-sm mb-3"> Add Student </a> 
			
		</form>
		
		<!-- adding the table to display the list of students and their details -->
		<div class="table  table-striped" style="margin-left:250px;align-items:center;padding:20px;">
			<table class="thead-dark">
				<thead>
					<tr>
						<th>FirstName</th>
						<th>LastName</th>
						<th>Department</th>
						<th>Country</th>
						<th>Action</th>
					</tr>
				</thead>
				
				<tbody>
					<c:forEach items="${students}" var="tempStudent">
						<tr>
							<td><c:out value="${tempStudent.firstName }"/></td>
							<td><c:out value="${tempStudent.lastName }"/></td>
							<td><c:out value="${tempStudent.department }"/></td>
							<td><c:out value="${tempStudent.country }"/></td>
							<td>
							<!-- Add "update" button/link --> 
							
							<a
							href="/StudentManagement/student/begin-update?studentId=${tempStudent.id}"
							class="btn btn-info btn-sm"> Update 
							</a> 
							
							<!-- Add "delete" button/link --> 
							
							<a href="/StudentManagement/student/delete?studentId=${tempStudent.id}"
							class="btn btn-danger btn-sm"
							onclick="if (!(confirm('Are you sure you want to delete this Student?'))) return false">
								Delete 
							</a>
						</td>
						</tr>
					</c:forEach>
					
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>