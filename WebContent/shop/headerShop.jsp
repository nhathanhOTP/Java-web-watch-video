<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/favicon.png">
<title>Welcome to FlatShop</title>
<link href="${pageContext.request.contextPath}/css/bootstrap.css"
	rel="stylesheet">
<link
	href='http://fonts.googleapis.com/css?family=Roboto:400,300,300italic,400italic,500,700,500italic,100italic,100'
	rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath}/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/flexslider.css"
	type="text/css" media="screen" />
<link
	href="${pageContext.request.contextPath}/css/sequence-looptheme.css"
	rel="stylesheet" media="all" />
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet">
<!--[if lt IE 9]><script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script><script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script><![endif]-->
</head>
<body>
	<c:url var="url" value="/account" />
	<div class="header">
		<div class="container">
			<div class="row">
				<div class="col-md-2 col-sm-2">
					<div class="logo">
						<a href="/PS16500_Lab6/loadVideo"><img
							src="${pageContext.request.contextPath}/images/tiltle.png"
							alt="FlatShop" width="80px"></a>
					</div>
				</div>
				<div class="col-md-10 col-sm-10">
					<div class="header_top">
						<div class="row">
							<div class="col-md-3">
								<ul class="option_nav">
									<li class="dorpdown"><a href="#">Eng</a>
										<ul class="subnav">
											<li><a href="#">Eng</a></li>
											<li><a href="#">Vns</a></li>
											<li><a href="#">Fer</a></li>
											<li><a href="#">Gem</a></li>
										</ul></li>
									<li class="dorpdown"><a href="#">USD</a>
										<ul class="subnav">
											<li><a href="#">USD</a></li>
											<li><a href="#">UKD</a></li>
											<li><a href="#">FER</a></li>
										</ul></li>
								</ul>
							</div>
							<div class="col-md-6">
								<ul class="topmenu">
									<li><a href="#">About Us</a></li>
									<li><a href="#">News</a></li>
									<li><a href="#">Service</a></li>
									<li><a href="#">Recruiment</a></li>
									<li><a href="#">Media</a></li>
									<li><a href="#">Support</a></li>
								</ul>
							</div>
							<div class="col-md-3" style="display: ${display2}">
								<ul class="usermenu">
									<li><a href="/PS16500_Lab6/shop/checkout.jsp" class="log">Login</a></li>
									<li><a href="/PS16500_Lab6/shop/checkout2.jsp" class="reg">Register</a></li>
								</ul>
							</div>
						</div>

						<div id="wellcome" style="display: ${display1}">
							<form action="${url}/sign-out" method="post">
								<ul class="come">
									<li><h6>
											<button formaction="${url}/loadProfile" id="loadSession">
												Wellcome, ${sessionScope.fullname}</button>
										</h6></li>
									<%--<li><a href="${url}/sign-out">Log out</a></li>--%>
								</ul>
							</form>
						</div>

					</div>
					<div class="clearfix"></div>
					<div class="header_bottom">
						<ul class="option">
							<li id="search" class="search">
								<form>
									<input class="search-submit" type="submit" value=""><input
										class="search-input" placeholder="Enter your search term..."
										type="text" value="" name="search">
								</form>
							</li>

						</ul>
						<div class="navbar-header">
							<button type="button" class="navbar-toggle"
								data-toggle="collapse" data-target=".navbar-collapse">
								<span class="sr-only">Toggle navigation</span><span
									class="icon-bar"></span><span class="icon-bar"></span><span
									class="icon-bar"></span>
							</button>
						</div>
						<div class="navbar-collapse collapse">
							<ul class="nav navbar-nav"> 
								<li><a href="/PS16500_Lab6/favoriteVideo/index">My video favorite</a></li>
								<li class="active dropdown"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown">My account</a>
									<div class="dropdown-menu">
										<ul class="mega-menu-links">
											<li><a href="#">Forgot Password</a></li>
											<li><a href="#">Edit Profile</a></li>
											<li><a href="#">Change Password</a></li>
											<li><a href="${url}/sign-out">Log out</a></li>

										</ul>
									</div></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>