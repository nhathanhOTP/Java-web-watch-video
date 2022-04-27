<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<c:url var="url" value="/video" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Manager Videos</title>
<!-- Bootstrap Styles-->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet" />
<!-- FontAwesome Styles-->
<link
	href="${pageContext.request.contextPath}/assets/css/font-awesome.css"
	rel="stylesheet" />
<!-- Custom Styles-->
<link
	href="${pageContext.request.contextPath}/assets/css/custom-styles.css"
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/userMana.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Fix.css">
</head>
<body>
<!-- Thông báo -->
	<script>
		if ("${message}" != "") {
			alert("${message}");
		}
	</script>
	<div id="wrapper">
		<nav class="navbar navbar-default top-navbar" role="navigation">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><i class="fa fa-gear"></i> <strong>Service
						OE</strong></a>
			</div>

			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown">
					<p id="wellcomeName" style="display:${display1}">
						<a href="#"> Wellcome, ${sessionScope.fullname}</a>
					</p>
				</li>

				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> <i
						class="fa fa-envelope fa-fw"></i> </i>
				</a>

					<ul class="dropdown-menu dropdown-messages">
						<li><a href="#">
								<div>
									<strong>John Doe</strong> <span class="pull-right text-muted">
										<em>Today</em>
									</span>
								</div>
								<div>Lorem Ipsum has been the industry's standard dummy
									text ever since the 1500s...</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<strong>John Smith</strong> <span class="pull-right text-muted">
										<em>Yesterday</em>
									</span>
								</div>
								<div>Lorem Ipsum has been the industry's standard dummy
									text ever since an kwilnw...</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<strong>John Smith</strong> <span class="pull-right text-muted">
										<em>Yesterday</em>
									</span>
								</div>
								<div>Lorem Ipsum has been the industry's standard dummy
									text ever since the...</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>Read
									All Messages</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-messages --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> <i
						class="fa fa-tasks fa-fw"></i> </i>
				</a>
					<ul class="dropdown-menu dropdown-tasks">
						<li><a href="#">
								<div>
									<p>
										<strong>Task 1</strong> <span class="pull-right text-muted">60%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-success"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: 60%">
											<span class="sr-only">60% Complete (success)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 2</strong> <span class="pull-right text-muted">28%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-info" role="progressbar"
											aria-valuenow="28" aria-valuemin="0" aria-valuemax="100"
											style="width: 28%">
											<span class="sr-only">28% Complete</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 3</strong> <span class="pull-right text-muted">60%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-warning"
											role="progressbar" aria-valuenow="60" aria-valuemin="0"
											aria-valuemax="100" style="width: 60%">
											<span class="sr-only">60% Complete (warning)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 4</strong> <span class="pull-right text-muted">85%
											Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="85" aria-valuemin="0"
											aria-valuemax="100" style="width: 85%">
											<span class="sr-only">85% Complete (danger)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>See
									All Tasks</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-tasks --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> <i
						class="fa fa-bell fa-fw"></i> </i>
				</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i> New Comment <span
										class="pull-right text-muted small">4 min</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span
										class="pull-right text-muted small">12 min</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-envelope fa-fw"></i> Message Sent <span
										class="pull-right text-muted small">4 min</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-tasks fa-fw"></i> New Task <span
										class="pull-right text-muted small">4 min</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-upload fa-fw"></i> Server Rebooted <span
										class="pull-right text-muted small">4 min</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>See
									All Alerts</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-alerts --></li>
				<!-- /.dropdown -->
				<c:url var="url3" value="/account" />
				<li class="dropdown"><a class="dropdown-toggle"
					data-toggle="dropdown" href="#" aria-expanded="false"> <i
						class="fa fa-user fa-fw"></i> </i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="${url3}/sign-out" ><i
								class="fa fa-sign-out fa-fw" ></i> Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
		</nav>
		<!--/. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li><a href="#"><i class="fa fa-dashboard"></i>
							Home</a></li>
					<li><a href="/PS16500_Lab6/user/index"><i class="fa fa-qrcode"></i> Manager User</a></li>
					<li><a href="/PS16500_Lab6/VideoServlet/index" class="active-menu"><i
							class="fa fa-sitemap"></i> Manager Videos</a></li>
					<li><a href="/PS16500_Lab6/search/userId"><i class="fa fa-table"></i> List Videos</a></li>
					<li><a href="#"><i class="fa fa-edit"></i> Report </a></li>
				</ul>
			</div>
		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h1 class="page-header">
							Video Page <small>Manager video and edit.</small>
						</h1>
					</div>
				</div>
				<!-- /. ROW  -->
				<div class="row">
					<div class="col-lg-12">
						<div class="panel panel-default">
							<div class="panel-heading">Review all videos in the list</div>
							<section class="ftco-section">
								<div class="container">
									<div class="row justify-content-center">
										<div class="col-md-12">
											<div class="wrapper">
												<div class="row no-gutters">
													<div class="col-lg-6">
														<div class="contact-wrap w-100 p-md-5 p-4">
															<h3>Contact us</h3>
															<p class="mb-4">We're open for any suggestion or just
																to have a chat</p>
															<div id="form-message-warning" class="mb-4"></div>
															<div id="form-message-success" class="mb-4">Your
																message was sent, thank you!</div>
															<div class="row mb-4">
																<div class="col-md-4">
																	<div class="dbox w-100 d-flex align-items-start">
																		<div class="text">
																			<p>
																				<span>Address:</span> 198 West 21th Street, Suite
																				721 New York NY 10016
																			</p>
																		</div>
																	</div>
																</div>
																<div class="col-md-4">
																	<div class="dbox w-100 d-flex align-items-start">
																		<div class="text">
																			<p>
																				<span>Email:</span> <a
																					href="mailto:info@yoursite.com">info@yoursite.com</a>
																			</p>
																		</div>
																	</div>
																</div>
																<div class="col-md-4">
																	<div class="dbox w-100 d-flex align-items-start">
																		<div class="text">
																			<p>
																				<span>Phone:</span> <a href="tel://1234567920">+
																					1235 2355 98</a>
																			</p>
																		</div>
																	</div>
																</div>
															</div>
															<!-- Form -->

															<c:if test="${not empty form}">
																<form method="POST" action="${url}/index"
																	id="contactForm" name="contactForm" class="contactForm">
																	<div class="row">

																		<div class="col-md-12">
																			<div class="form-group">
																				<input class="form-control" value="${form.id}" name="id"
																					placeholder="Video ID">
																			</div>
																		</div>
																		<div class="col-md-12">
																			<div class="form-group">
																				<input value="${form.poster}" class="form-control" name="poster"
																					placeholder="Poster for video">
																			</div>
																		</div>
																		<div class="col-md-12">
																			<div class="form-group">
																				<input class="form-control" value="${form.title}" name="title"
																					placeholder="Video Title">
																			</div>
																		</div>

																		<div class="col-md-12">
																			<div class="form-group">
																				<input value="${form.views}" class="form-control" name="views"
																					placeholder="Views by video start 0 default">
																			</div>
																		</div>

																		<div class="col-md-12">
																			<div class="form-group">
																				<label>Desreption</label> <br>
																				<textarea id="w3review" name="description" rows="4"
																					cols="50" >${form.description}
																				</textarea>
																			</div>
																		</div>

																		<div class="col-md-12">
																			<label class="radio-container m-r-45">Active
																				<input type="radio" checked="checked" name="active"
																				value="true" ${form.active?'checked':''}>
																				&ensp;&ensp;&ensp;<span class="checkmark"></span>
																			</label> <label class="radio-container">Inactive <input
																				type="radio" name="active" value="false"
																				${form.active?'':'checked'}> <span
																				class="checkmark"></span>
																			</label>
																		</div>
																		<div id="magsss">
																			<div class="col-md-12">
																				<button formaction="${url}/create"
																					class="btn btn-primary">Create</button>
																				&ensp;&ensp;&ensp;
																				<button formaction="${url}/update"
																					class="btn btn-primary">Update</button>
																				&ensp;&ensp;&ensp;
																				<button formaction="${url}/delete"
																					class="btn btn-primary">Delete</button>
																				&ensp;&ensp;&ensp;<a href="/PS16500_Lab6/VideoServlet/index">Reset</a>
																			</div>
																		</div>
																	</div>
																</form>
															</c:if>

															<div class="w-100 social-media mt-5">
																<h3>Follow us here</h3>
																<p>
																	<a href="#">Facebook</a> <a href="#">Twitter</a> <a
																		href="#">Instagram</a> <a href="#">Dribbble</a>
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
																			<th>Youtube ID</th>
																			<th>Video Title</th>
																			<th>Views Count</th>
																			<th>Status</th>
																			<th></th>

																		</tr>
																	</thead>
																	<c:forEach var="item" items="${items }">
																		<tr>
																			<td>${item.id}</td>
																			<td>${item.title}</td>
																			<td>${item.views}</td>
																			<td>${item.active?'Active':'Inactive'}</td>
																			<td><a href="${url}/edit/${item.id}">Edit</a></td>
																		</tr>
																	</c:forEach>
																</table>
															</c:if>
														</div>
														<form class="form-detail" action="${url}/index"
															method="post">
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

						</div>
						<!-- /.panel-body -->
					</div>
					<!-- /.panel -->
				</div>
				<!-- /.col-lg-12 -->
			</div>
			<footer>
				<p>
					All right reserved. Template by: <a href="http://webthemez.com">WebThemez</a>
				</p>
			</footer>
		</div>
		<!-- /. PAGE INNER  -->
	</div>
	<!-- /. PAGE WRAPPER  -->
	</div>
	<!-- /. WRAPPER  -->
	<!-- JS Scripts-->
	<!-- jQuery Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
	<!-- Bootstrap Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
	<!-- Metis Menu Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/jquery.metisMenu.js"></script>
	<!-- Custom Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
</body>
</html>