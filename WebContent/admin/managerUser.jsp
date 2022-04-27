<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="url" value="/user" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link
	href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700'
	rel='stylesheet' type='text/css'>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/userMana.css">
<style>
<%--<%@includefile="/css/Fix.css"%>--%>
<%@includefile="/css/Fix.css"%>
</style>
</head>
<body>
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-12">
					<div class="wrapper">
						<div class="row no-gutters">
							<div class="col-lg-6">
								<div class="contact-wrap w-100 p-md-5 p-4">
									<h3>Contact us</h3>
									<p class="mb-4">We're open for any suggestion or just to
										have a chat</p>
									<div id="form-message-warning" class="mb-4"></div>
									<div id="form-message-success" class="mb-4">Your message
										was sent, thank you!</div>
									<div class="row mb-4">
										<div class="col-md-4">
											<div class="dbox w-100 d-flex align-items-start">
												<div class="text">
													<p>
														<span>Address:</span> 198 West 21th Street, Suite 721 New
														York NY 10016
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<div class="dbox w-100 d-flex align-items-start">
												<div class="text">
													<p>
														<span>Email:</span> <a href="mailto:info@yoursite.com">info@yoursite.com</a>
													</p>
												</div>
											</div>
										</div>
										<div class="col-md-4">
											<div class="dbox w-100 d-flex align-items-start">
												<div class="text">
													<p>
														<span>Phone:</span> <a href="tel://1234567920">+ 1235
															2355 98</a>
													</p>
												</div>
											</div>
										</div>
									</div>
									<!-- Form -->

									<c:if test="${not empty form}">
										<form method="POST" action="${url}/index" id="contactForm"
											name="contactForm" class="contactForm">
											<div class="row">
												<div class="col-md-12">
													<div class="form-group">
														<input class="form-control" value="${form.id}" name="id"
															placeholder="Username">
													</div>
												</div>

												<div class="col-md-12">
													<div class="form-group">
														<input class="form-control" value="${form.password}"
															name="password" placeholder="Password">
													</div>
												</div>

												<div class="col-md-12">
													<div class="form-group">
														<input value="${form.fullname}" class="form-control"
															name="fullname" placeholder="Fullname">
													</div>
												</div>

												<div class="col-md-12">
													<div class="form-group">
														<input class="form-control" value="${form.email}"
															name="email" placeholder="Email or Address?">
													</div>
												</div>

												<div class="col-md-12">
													<label class="radio-container m-r-45">Admin <input
														type="radio" checked="checked" name="admin" value="true"
														${form.admin?'checked':''}> &ensp;&ensp;&ensp;<span
														class="checkmark"></span>
													</label> <label class="radio-container">User <input
														type="radio" name="admin" value="false"
														${form.admin?'':'checked'}> <span
														class="checkmark"></span>
													</label>
												</div>
												<div id="magsss">
													<div class="col-md-12">
														<button formaction="${url}/create" class="btn btn-primary">Create</button>
														&ensp;&ensp;&ensp;
														<button formaction="${url}/update" class="btn btn-primary">Update</button>
														&ensp;&ensp;&ensp;
														<button formaction="${url}/delete" class="btn btn-primary">Delete</button>
														&ensp;&ensp;&ensp;<a href="${url}/index">Reset</a>
													</div>
												</div>
											</div>
										</form>
									</c:if>

									<div class="w-100 social-media mt-5">
										<h3>Follow us here</h3>
										<p>
											<a href="#">Facebook</a> <a href="#">Twitter</a> <a href="#">Instagram</a>
											<a href="#">Dribbble</a>
										</p>
									</div>
								</div>
							</div>
							<div id="Contact" class="tabcontent">
								<div class="rowTabel">
									<c:if test="${not empty items }">
										<table id="customers" class="table sticky">
											<thead class="headeTable">
												<tr>
													<th>ID</th>
													<th>Password</th>
													<th>Fullname</th>
													<th>Email</th>
													<th>Role</th>
													<th></th>
												</tr>
											</thead>

											<c:forEach var="item" items="${items }">
												<tr>
													<td>${item.id}</td>
													<td>${item.password}</td>
													<td>${item.fullname}</td>
													<td>${item.email}</td>
													<td>${item.admin?'Admin':'User'}</td>
													<td><a href="${url}/edit/${item.id}">Edit</a></td>
												</tr>
											</c:forEach>
										</table>
									</c:if>
								</div>
								<form class="form-detail" action="${url}/index" method="post">
									<c:forEach var="num" items="${number}">
										<button type="submit" value="${num}" name="numberPage"
											formaction="${url}/page" class="soPage active">${num}</button>
									</c:forEach>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>