<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit profile</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel='stylesheet' type='text/css' media='screen'
	href='${pageContext.request.contextPath}/css/editProfile.css'>
<style>
.form {
	width: 400px;
	height: 300px;
	color: baclk;
}

.form .col-2 {
	
}

.col-2 .input-group input {
	width: 400px;
	margin-bottom: 10px;
}

.form .roli {
	margin-left: 25px;
	font-size: 15px;
}

.col-2 .input-group .label {
	color: black;
}

.roli .input-group .label {
	color: black;
}

.form .btnedit {
	margin: auto;
	padding-left: 15px;
}

.form .btnedit button {
	background-color: orange;
	color: white;
	font-weight: bold;
}

.form .btnedit button:hover {
	border: 2px solid gray;
}
</style>
</head>
<body>
	<div class="container rounded bg-white mt-5 mb-5">
		<div class="row">
			<div class="col-md-3 border-right">
				<div
					class="d-flex flex-column align-items-center text-center p-3 py-5">
					<a href="/PS16500_Lab6/loadVideo"> <img src="${pageContext.request.contextPath}/images/tiltle.png"
						alt="FlatShop" width="80px"></a><span class="font-weight-bold">Service
						OE</span><span class="text-black-50">nhavtps16500@fpt.edu.vn</span><span>Vietnamese</span>
				</div>
			</div>
			<div class="col-md-5 border-right">
				<div class="p-3 py-5">
					<c:url var="url" value="/account" />
					<form action="${url}/index" method="post" class="form">
						<div
							class="d-flex justify-content-between align-items-center mb-3">
							<h6 class="text-right">Edit your profile</h6>
						</div>
						<div class="col-2">
							<div class="input-group">
								<label class="label">ID</label> <input class="input--style-4"
									type="text" name="id" value="${user.id}"
									placeholder="ex:ThanhNha">
							</div>
						</div>
						<div class="col-2">
							<div class="input-group">
								<label class="label">Password</label> <input
									class="input--style-4" type="password" name="password"
									value="${user.password}" placeholder="ex:456">
							</div>
						</div>
						<div class="col-2">
							<div class="input-group">
								<label class="label">Fullname</label>
								<div class="input-group-icon">
									<input placeholder="ex:Võ Thanh Nhã"
										class="input--style-4 js-datepicker" type="text"
										name="fullname" value="${user.fullname}"> <i
										class="zmdi zmdi-calendar-note input-icon js-btn-calendar"></i>
								</div>
							</div>
						</div>
						<div class="roli">
							<div class="input-group">
								<label class="label">Role</label>
								<div class="p-t-10">
									<label class="radio-container m-r-45">Admin <input
										type="radio" checked="checked" name="admin"
										value="${user.admin}"> <span class="checkmark"></span>
									</label> <label class="radio-container">User <input
										type="radio" name="admin" value="${user.admin}"> <span
										class="checkmark"></span>
									</label>
								</div>
							</div>
						</div>
						<br>
						<div class="col-2">
							<div class="row row-space">
								<div class="col-2">
									<div class="input-group">
										<label class="label">Email</label> <input
											class="input--style-4" type="email" name="email"
											value="${user.email}" placeholder="ex:nhatt@gmail.com">
									</div>
								</div>
							</div>
						</div>
						<div class="btnedit">
							<button class="" formaction="${url}/edit-profile">Edit
								Profile</button>
						</div>
					</form>
				</div>
			</div>
			<div class="col-md-4">
				<div class="p-3 py-5">
					<div
						class="d-flex justify-content-between align-items-center experience">
						<span>Edit Experience</span><span
							class="border px-3 p-1 add-experience"><i
							class="fa fa-plus"></i>&nbsp;Experience</span>
					</div>

					<div class="d-flex flex-row mt-3 exp-container">
						<img src="https://img.icons8.com/color/100/000000/facebook.png"
							width="45" height="45">
						<div class="work-experience ml-1">
							<span class="font-weight-bold d-block">Senior UI/UX
								Designer</span><span class="d-block text-black-50 labels">Facebook
								Inc.</span><span class="d-block text-black-50 labels">March,2017
								- May 2020</span>
						</div>
					</div>
					<hr>
					<div class="d-flex flex-row mt-3 exp-container">
						<img src="https://img.icons8.com/color/50/000000/google-logo.png"
							width="45" height="45">
						<div class="work-experience ml-1">
							<span class="font-weight-bold d-block">UI/UX Designer</span><span
								class="d-block text-black-50 labels">Google Inc.</span><span
								class="d-block text-black-50 labels">March,2017 - May
								2020</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>