<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<!--  This provide the UI for adding new student to the list or -->
<!--  updating the info of any existing student in the list -->


<title>Save Student</title>
</head>
<body style="background-color:#F7E2D6;text-align:center;">

<div class="container">

		<h2 style="font-size:46px;color:#A084CF;padding:15px;">Add/Update Student Details</h2>
		<hr style="color:black;position:relative;margin-top:-15px;margin-bottom:30px;">

		<p class="h4 mb-4">Student Details</p>

		<form action="/StudentManagement/student/save" style="align-items:center;margin:auto" method="POST">

			<!-- Add hidden form field to handle update -->
			<input type="hidden" name="id" value="${student.id}" />

			<div class="form-inline">
				<input style="align-items:center;margin:auto" type="text" name="firstName" value="${student.firstName}"
					class="form-control mb-4 col-4" placeholder="FirstName">

			</div>

			<div class="form-inline">

				<input style="align-items:center;margin:auto" type="text" name="lastName" value="${student.lastName}"
					class="form-control mb-4 col-4" placeholder="LastName">


			</div>

			<div class="form-inline">

				<input style="align-items:center;margin:auto" type="text" name="department" value="${student.department}"
					class="form-control mb-4 col-4" placeholder="Department">


			</div>
			<div class="form-inline">

				<input style="align-items:center;margin:auto" type="text" name="country" value="${student.country}"
					class="form-control mb-4 col-4" placeholder="Country">

			</div>
			
			<!--  This saves the entered details -->

			<button type="submit" class="btn btn-info col-2">Save</button>

		</form>

		<hr>
		
		<!--  This link brings us back to the list of students -->
		
		<a href="/StudentManagement/students/list">Back to Students List</a>

	</div>


</body>
</html>