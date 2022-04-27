<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Your video favorite</title>
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
<link href="${pageContext.request.contextPath}/css/popup.css"
	rel="stylesheet">

</head>
<body>
	<!-- Thông báo -->
	<script>
		if ("${message}" != "") {
			alert("${message}");
		}
	</script>
	<div class="wrapper">
		<%--Header --%>
		<jsp:include page="/shop/headerShop.jsp"></jsp:include>
		<div class="clearfix"></div>
		<div class="container_fullwidth">
			<div class="container">
				<h3 class="title">
					<strong>Video your</strong> favorites
				</h3>
				<div class="hot-products">
					<ul id="hot">
						<li>
							<div class="row">
								<form class="form-detail" action="/PS16500_Lab6/videoMain"
									method="post">
									<c:forEach var="item" items="${videoLike}" varStatus="hihi">
										<div class="col-md-3 col-sm-6">
											<div class="products" name="btnmain">
												<div class="thumbnail">
													<button formaction="/PS16500_Lab6/videoMain"
														value="${item.id}" name="btnmain"
														id="btnload${hihi.count}" class="btnNone">
														<img
															src="https://img.youtube.com/vi/${item.video.id}/maxresdefault.jpg"
															alt="Product Name">
													</button>
												</div>
												<div class="productname">
													<p>${item.video.title}</p>
												</div>
												<h4 class="price">${item.video.views}&ensp;views</h4>
												<div class="button_group">
													<button class="fa fa-clock-o" type="button">&ensp;Watch
														latter</button>
													<button class="button wishlist" type="button"
														style="background-color:${backgroundColor}">
														<i class="fa fa-heart-o" style="color:${color}"></i>
													</button>
													<button class="button compare" type="button"
														data-toggle="modal" data-target="#myModal"
														onclick="gfg_Run(${hihi.count})"
														id="btnloadShare${hihi.count}" value="${item.video.id}">
														<i class="fa fa-share"></i>
													</button>
												</div>
											</div>
										</div>
									</c:forEach>
								</form>
							</div>

						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="clearfix"></div>
		<%--Footer --%>
		<jsp:include page="/shop/footerShop.jsp"></jsp:include>
		<%--Popup --%>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="modal-box">
						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel">
							<div class="modal-dialog" role="document">
								<div class="modal-content clearfix">
									<button type="button" class="close" data-dismiss="modal"
										aria-label="Close">
										<span aria-hidden="true">×</span>
									</button>
									<div class="modal-body">
										<h3 class="title">Share</h3>
										<form action="" method="post">
										<p class="description">You can share with your friend</p>
										<div class="form-group">
											<span class="input-icon"></span> <input type="text"
												class="form-control" id="id2"
												name="link">
										</div>
										<div class="form-group">
											<span class="input-icon"><i class="fa fa-user"></i></span> <input
												type="email" class="form-control" placeholder="Enter email"
												name="toSend">
										</div>	
											<button class="btn"
												formaction="/PS16500_Lab6/video/share">Share</button>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
    var inputF2 = document.getElementById("id2");
    function gfg_Run(values) {
        // Selecting the input element and get its value 
        let inputVal = "";	
        inputVal = document.getElementById("btnloadShare"+values).value;
        console.log(inputVal);
        inputF2.value = "https://www.youtube.com/watch?v="+inputVal;
    } 
	</script>
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
	</div>
</body>
</html>