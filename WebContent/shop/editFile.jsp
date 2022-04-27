<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/images/favicon.png">
<title>Edit nè má</title>
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
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js">
</script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js">
</script>
<![endif]-->
</head>
<body style="background-color: rgba(0, 0, 0, 0.377);">
	<!-- Thông báo -->
	<script>
		if ("${message}" != "") {
			alert("${message}");
		}
	</script>
	<c:url var="url" value="/account" />
	<div class="wrapper">
		<%--Header
		<jsp:include page="/shop/headerShop.jsp"></jsp:include> --%>
		<div class="clearfix"></div>
		<%--Edit --%>
		<jsp:include page="/shop/editProfile.jsp"></jsp:include>
		<div class="clearfix"></div>
		<%--Footer --%>
		<jsp:include page="/shop/footerShop.jsp"></jsp:include>
	</div>
	<!-- Bootstrap core JavaScript==================================================-->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery-1.10.2.min.js">
		
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/bootstrap.min.js">
		
	</script>
	<script defer
		src="${pageContext.request.contextPath}/js/jquery.flexslider.js">
		
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.carouFredSel-6.2.1-packed.js">
		
	</script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/script.min.js">
		
	</script>
</body>
</html>