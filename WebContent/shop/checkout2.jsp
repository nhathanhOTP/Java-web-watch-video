<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign up</title>
</head>
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
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js">
</script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js">
</script>
<![endif]-->
</head>

<body>
	<c:url var="url" value="/account" />
	<div class="wrapper">
		<%--Header --%>
		<jsp:include page="/shop/headerShop.jsp"></jsp:include>
		<div class="clearfix"></div>
		<div class="container_fullwidth">
			<div class="container">
				<div class="row">
					<div class="col-md-3">
						<div class="product-tag leftbar">
							<h3 class="title">
								Products <strong> Tags </strong>
							</h3>
							<ul>
								<li><a href="#"> Lincoln us </a></li>
								<li><a href="#"> SDress for Girl </a></li>
								<li><a href="#"> Corner </a></li>
								<li><a href="#"> Window </a></li>
								<li><a href="#"> PG </a></li>
								<li><a href="#"> Oscar </a></li>
								<li><a href="#"> Bath room </a></li>
								<li><a href="#"> PSD </a></li>
							</ul>
						</div>
						<div class="get-newsletter leftbar">
							<h3 class="title">
								Get <strong> newsletter </strong>
							</h3>
							<p>Casio G Shock Digital Dial Black.</p>
							<form>
								<input class="email" type="text" name=""
									placeholder="Your Email..."> <input class="submit"
									type="submit" value="Submit">
							</form>
						</div>
						<div class="fbl-box leftbar">
							<h3 class="title">Facebook</h3>
							<span class="likebutton"> <a href="#"> <img
									src="images/fblike.png" alt="">
							</a>
							</span>
							<p>12k people like Flat Shop.</p>
							<ul>
								<li><a href="#"> </a></li>
								<li><a href="#"> </a></li>
								<li><a href="#"> </a></li>
								<li><a href="#"> </a></li>
								<li><a href="#"> </a></li>
								<li><a href="#"> </a></li>
								<li><a href="#"> </a></li>
								<li><a href="#"> </a></li>
							</ul>
							<div class="fbplug">
								<a href="#"> <span> <img src="images/fbicon.png"
										alt="">
								</span> Facebook social plugin
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-9">
						<div class="checkout-page">
							<ol class="checkout-steps">
								<li class="steps">
									<div class="step-title">01. LOGIN WITH YOUR ACCOUNT</div>
								</li>
								<li class="steps active"><a href="checkout.html"
									class="step-title"> 02. CREATE NEW YOUR ACCOUNT</a>
									<div class="step-description">
										<form method="post" action="${url}/index">
											<div class="row">
												<div class="col-md-6 col-sm-6">
													<div class="your-details">
														<h5>Your Persional Details</h5>
														<div class="form-row">
															<label class="lebel-abs"> Username <strong
																class="red"> * </strong>
															</label> <input type="text" class="input namefild" name="id">
														</div>
														<div class="pass-wrap">
															<div class="form-row">
																<label class="lebel-abs"> Your Password <strong
																	class="red"> * </strong>
																</label> <input type="password" class="input namefild"
																	name="password">
															</div>
															
														</div>
														<div class="form-row">
															<label class="lebel-abs"> Email <strong
																class="red"> * </strong>
															</label> <input type="text" class="input namefild" name="email">
														</div>
														<div class="form-row">
															<label class="lebel-abs"> Fullname <strong
																class="red"> * </strong>
															</label> <input type="text" class="input namefild"
																name="fullname">
														</div>
														<p>
															<span class="input-radio"> <input type="radio"
																name="role" checked>
															</span> <span class="text"> I am user </span>
														</p>
														<p>
															<span class="input-radio"> <input type="radio"
																name="role">
															</span> <span class="text"> I am admin </span>
														</p>
													</div>
													<button formaction="${url}/sign-up">Continue</button>
												</div>
											</div>
										</form>
									</div></li>
							</ol>
						</div>
					</div>
				</div>
				<div class="clearfix"></div>
				<div class="our-brand">
					<h3 class="title">
						<strong> Our </strong> Brands
					</h3>
					<div class="control">
						<a id="prev_brand" class="prev" href="#"> &lt; </a> <a
							id="next_brand" class="next" href="#"> &gt; </a>
					</div>
					<ul id="braldLogo">
						<li>
							<ul class="brand_item">
								<li><a href="#">
										<div class="brand-logo">
											<img
												src="${pageContext.request.contextPath}/images/envato.png"
												alt="">
										</div>
								</a></li>
								<li><a href="#">
										<div class="brand-logo">
											<img
												src="${pageContext.request.contextPath}/images/themeforest.png"
												alt="">
										</div>
								</a></li>
								<li><a href="#">
										<div class="brand-logo">
											<img
												src="${pageContext.request.contextPath}/images/photodune.png"
												alt="">
										</div>
								</a></li>
								<li><a href="#">
										<div class="brand-logo">
											<img
												src="${pageContext.request.contextPath}/images/activeden.png"
												alt="">
										</div>
								</a></li>
								<li><a href="#">
										<div class="brand-logo">
											<img
												src="${pageContext.request.contextPath}/images/envato.png"
												alt="">
										</div>
								</a></li>
							</ul>
						</li>
						<li>
							<ul class="brand_item">
								<li><a href="#">
										<div class="brand-logo">
											<img
												src="${pageContext.request.contextPath}/images/envato.png"
												alt="">
										</div>
								</a></li>
								<li><a href="#">
										<div class="brand-logo">
											<img
												src="${pageContext.request.contextPath}/images/themeforest.png"
												alt="">
										</div>
								</a></li>
								<li><a href="#">
										<div class="brand-logo">
											<img
												src="${pageContext.request.contextPath}/images/photodune.png"
												alt="">
										</div>
								</a></li>
								<li><a href="#">
										<div class="brand-logo">
											<img
												src="${pageContext.request.contextPath}/images/activeden.png"
												alt="">
										</div>
								</a></li>
								<li><a href="#">
										<div class="brand-logo">
											<img
												src="${pageContext.request.contextPath}/images/envato.png"
												alt="">
										</div>
								</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
		</div>
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
