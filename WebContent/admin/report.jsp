<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Report page</title>
<!-- Bootstrap Styles-->
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet" />
<!-- FontAwesome Styles-->
<link
	href="${pageContext.request.contextPath}/assets/css/font-awesome.css"
	rel="stylesheet" />
<!-- Morris Chart Styles-->

<!-- Custom Styles-->
<link
	href="${pageContext.request.contextPath}/assets/css/custom-styles.css"
	rel="stylesheet" />
<!-- Google Fonts-->
<link href='http://fonts.googleapis.com/css?family=Open+Sans'
	rel='stylesheet' type='text/css' />
<!-- TABLE STYLES-->
<link
	href="${pageContext.request.contextPath}/assets/js/dataTables/dataTables.bootstrap.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/css/table.css"
	rel="stylesheet" />
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
						class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
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
						class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
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
						class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
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
						class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User
								Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
						</li>
						<li class="divider"></li>
						<li><a href="${url3}/sign-out"><i
								class="fa fa-sign-out fa-fw"></i> Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
		</nav>
		<!--/. NAV TOP  -->
		<nav class="navbar-default navbar-side" role="navigation">
			<div class="sidebar-collapse">
				<ul class="nav" id="main-menu">
					<li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
					<li><a href="/PS16500_Lab6/user/index"><i
							class="fa fa-qrcode"></i> Manager User</a></li>
					<li><a href="/PS16500_Lab6/VideoServlet/index" " ><i
							class="fa fa-sitemap"></i> Manager Videos</a></li>
					<li><a href="/PS16500_Lab6/search/userId"><i
							class="fa fa-table"></i> List Videos</a></li>
					<li><a href="#"class="active-menu"><i class="fa fa-edit"></i> Report </a></li>
					<li><a><i class="fa fa-paper-plane-o"></i> Count visit <small>${applicationScope.visitors}</small></a></li>
				</ul>


			</div>

		</nav>
		<!-- /. NAV SIDE  -->
		<div id="page-wrapper">
			<div id="page-inner">
				<div class="row">
					<div class="col-md-12">
						<h1 class="page-header">
							REPORT <small> STATISTICAL</small>
						</h1>

					</div>
				</div>
				<!-- /. ROW  -->
				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-default">
							<div class="panel-heading">STATISTICS OF THE NUMBER OF
								FAVORITE PEOPLE FROM PICTURES</div>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover"
										id="dataTables-example">
										<thead>
											<tr>
												<th>#</th>
												<th>Id</th>
												<th>Favorite count</th>
												<th>Newest Date</th>
												<th>Oldest Date</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${reportAll }">
												<tr>
													<td></td>
													<td>${item.group}</td>
													<td>${item.likes}</td>
													<td>${item.newest}</td>
													<td>${item.oldest}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</div>
						</div>
						<!--End Advanced Tables -->
					</div>
				</div>
				<!-- /. ROW  -->
				<c:url var="url" value="/search" />
				<div class="row">
					<div class="col-md-6">
						<!--   Kitchen Sink -->
						<div class="panel panel-default">
							<div class="panel-heading">FAVORITES USERS</div>

							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped table-bordered table-hover">
										<thead>
											<tr>
												<th>Id video</th>
												<th>Title video</th>
												<th>Views video</th>
												<th>Active</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${videos }">
												<tr>
													<td>${item.id}</td>
													<td>${item.title}</td>
													<td>${item.views}</td>
													<td>${item.active}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- End  Kitchen Sink -->
					</div>
					<div class="col-md-6">
						<!--   Basic Table  -->
						<div class="panel panel-default">
							<div class="panel-heading">SHARE FRIEND</div>
							<br>

							<div class="panel-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>Id</th>
												<th>Title video</th>
												<th>Views video</th>
												<th>Active</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${videosTitle }">
												<tr>
													<td>${item.id}</td>
													<td>${item.title}</td>
													<td>${item.views}</td>
													<td>${item.active}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- End  Basic Table  -->
					</div>
				</div>
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
	<!-- DATA TABLE SCRIPTS -->
	<script
		src="${pageContext.request.contextPath}/assets/js/dataTables/jquery.dataTables.js"></script>
	<script
		src="${pageContext.request.contextPath}/assets/js/dataTables/dataTables.bootstrap.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTables-example').dataTable();
		});
	</script>
	<!-- Custom Js -->
	<script
		src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>

</body>
</html>