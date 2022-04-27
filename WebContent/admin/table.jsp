<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Views list Video</title>
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
					<li><a href="/PS16500_Lab6/VideoServlet/index"><i
							class="fa fa-sitemap"></i> Manager Videos</a></li>
					<li><a href="/PS16500_Lab6/search/userId" class="active-menu"><i
							class="fa fa-table"></i> List Videos</a></li>
					<li><a href="#"><i class="fa fa-edit"></i> Report </a></li>
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
							Tables Page <small>Responsive tables</small>
						</h1>

					</div>
				</div>
				<!-- /. ROW  -->

				<div class="row">
					<div class="col-md-12">
						<!-- Advanced Tables -->
						<div class="panel panel-default">
							<div class="panel-heading">All like to video</div>
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
							<div class="panel-heading">Random</div>
							<form action="${url}/random" method="post">
								<button formaction="${url}/random" id="random">Random</button>
							</form>
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
							<div class="panel-heading">Search title video</div>
							<br>
							<form action="${url}/titleVideo" method="post">
								<input type="text" name="keyword" placeholder="Keywork.."
									id="inKey"><br> <br>
								<button formaction="${url}/titleVideo" id="keyword">Search</button>
							</form>
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
				<!-- /. ROW  -->
				<div class="row">
					<div class="col-md-6">
						<!--    Striped Rows Table  -->
						<div class="panel panel-default">
							<div class="panel-heading">Search by month</div>
							<%--month to video nq  --%>
							<form action="${url}/month-to-video-nq" method="post"
								class="formMonth">
								<%
								for (int i = 1; i < 13; i++) {
								%>
								<div>
									<input type="radio" name="month" value="<%=i%>">
								</div>
								<%
								}
								%>
								<br>

								<button formaction="${url}/month-to-video-nq" id="searchMonth">Search</button>
							</form>
							<div class="month">
								<%
								for (int i = 1; i < 13; i++) {
								%>
								<div class="">
									<p><%=i%></p>
								</div>
								<%
								}
								%>
							</div>
							<br> <br>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table table-striped">
										<c:forEach var="item" items="${videosMonth}">
											<tr>
												<td>${item.id}</td>
												<td>${item.title}</td>
												<td>${item.views}</td>
												<td>${item.active}</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</div>
						</div>
						<!--  End  Striped Rows Table  -->
					</div>
					<div class="col-md-6">
						<!--    Bordered Table  -->
						<div class="panel panel-default">
							<div class="panel-heading">Search from date to date</div>
							<c:url var="url1" value="/search1" />
							<br>
							<form action="${url}/date" method="post" class="formDate">
								<p>Start date</p>
								<input type="date" name="startDate" class="dateChooser">
								<p>End date</p>
								<input type="date" name="endDate" class="dateChooser">
								<button formaction="${url1}/date" id="searchForm">Search!</button>
							</form>
							<!-- /.panel-heading -->
							<div class="panel-body">
								<div class="table-responsive table-bordered">
									<table class="table">
										<thead>
											<tr>
												<th>Id</th>
												<th>Favorite count</th>
												<th>Newest Date</th>
												<th>Oldest Date</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${videosDate }">
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
						<!--  End  Bordered Table  -->
					</div>
				</div>
				<!-- /. ROW  -->
				<div class="row">


					<div class="col-md-6">
						<!--    Context Classes  -->
						<div class="panel panel-default">
							<div class="panel-heading">Combobox by year</div>
							<form action="${url}/comboBox" method="post" class="formCbo">
								<select name="years" class="cboYear">
									<%
									for (int i = 2010; i < 2022; i++) {
									%>
									<option value="<%=i%>"><%=i%></option>
									<%
									}
									%>
								</select> <br> <br>
								<button formaction="${url}/comboBox" id="show">Show</button>
							</form>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>Id</th>
												<th>Count views</th>
												<th>Newdest day</th>
												<th>Olddest day</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${videosCbo }">
												<tr>
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
						<!--  end  Context Classes  -->
					</div>
					<div class="col-md-6">
						<!--    Context Classes  -->
						<div class="panel panel-default">
							<div class="panel-heading">Search by Video Id</div>
							<form action="${url}/videoId" method="post" class="formVdId">
								<input type="text" name="videoId" placeholder="Video Id"><br>
								<br>
								<button formaction="${url}/videoId" id="searchIdVd">Search</button>
							</form>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>Id username</th>
												<th>Fullname</th>
												<th>Email</th>
												<th>Admin</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${users }">
												<tr>
													<td>${item.id}</td>
													<td>${item.fullname}</td>
													<td>${item.email}</td>
													<td>${item.admin}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

						</div>
						<!--  end  Context Classes  -->
					</div>

					<div class="col-md-6">
						<!--    Context Classes  -->
						<div class="panel panel-default">
							<div class="panel-heading">Display video favortie or not
								favorite</div>
							<br>
							<form action="${url}/favorite" method="post" class="formFav">
								&ensp;&ensp;Favorite&ensp; <input type="radio" name="favorite"
									value="true"> Not Favorite &ensp;<input type="radio"
									name="favorite" value="false">
								<button type="submit" id="check">Check</button>
							</form>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>Id video</th>
												<th>Title video</th>
												<th>Views video</th>
												<th>Active</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${videosFavorite }">
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
						<!--  end  Context Classes  -->
					</div>

					<div class="col-md-6">
						<!--    Context Classes  -->
						<div class="panel panel-default">
							<div class="panel-heading">Dislay userId like video</div>
							<br>
							<%--User Id --%>
							<form action="${url}/userIds" method="post" class="form">
								<input type="text" name="usernameId" id="inputIdUser"
									placeholder="User Id"><br>
								<button formaction="${url}/userIds" id="display">Search</button>
							</form>
							<div class="panel-body">
								<div class="table-responsive">
									<table class="table">
										<thead>
											<tr>
												<th>Id video</th>
												<th>Title video</th>
												<th>Views video</th>
												<th>Active</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item" items="${favoritesId}">
												<tr>
													<td>${item.video.id}</td>
													<td>${item.video.title}</td>
													<td>${item.video.views}</td>
													<td>${item.video.active}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
							</div>

						</div>
						<!--  end  Context Classes  -->
					</div>
				</div>
				<!-- /. ROW  -->
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