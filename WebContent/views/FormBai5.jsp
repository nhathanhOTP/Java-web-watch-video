<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bài 5 Send Mail</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" type="image/x-icon"
	href="https://f9-zfcloud.zdn.vn/fcfe4f3fbbcb54950dda/3604217847962339063">
<!-- Bootstrap CSS CDN -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
	integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4"
	crossorigin="anonymous">
<!-- Our Custom CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/Bai5.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">

<!-- Scrollbar Custom CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">

<!-- Font Awesome JS -->
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/solid.js"
	integrity="sha384-tzzSw1/Vo+0N5UhStP3bvwWPq+uvzCMfrN1fEFe+xBmv1C/AtVX5K0uZtmcHitFZ"
	crossorigin="anonymous"></script>
<script defer
	src="https://use.fontawesome.com/releases/v5.0.13/js/fontawesome.js"
	integrity="sha384-6OIrr52G08NpOFSZdxxz1xdNSndlD4vdcf/q2myIUVO0VsqaGHJsB0RaBE01VTOY"
	crossorigin="anonymous"></script>
<script>
	function myFunctionBCC() {
		document.getElementById("bcc").style.display = "flex";
		document.getElementById("maubcc").style.display = "none";
	}
	function myFunctionCC() {
		document.getElementById("cc").style.display = "flex";
		document.getElementById("maucc").style.display = "none";
	}
</script>
</head>
<body>

	<div class="wrapper">
		<!-- Sidebar  -->
		<nav id="sidebar">
			<div class="sidebar-header">
				<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40"
					fill="currentColor" class="bi bi-pie-chart" viewBox="0 0 16 16">
                        <path
						d="M7.5 1.018a7 7 0 0 0-4.79 11.566L7.5 7.793V1.018zm1 0V7.5h6.482A7.001 7.001 0 0 0 8.5 1.018zM14.982 8.5H8.207l-4.79 4.79A7 7 0 0 0 14.982 8.5zM0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8z" />
                      </svg>
				<h3>Nha Thanh</h3>
				<strong>NT</strong>
			</div>

			<ul class="list-unstyled components">
				<li><a href="/PS16500_VoThanhNha_Lab3/HomeWork_1"> <svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-vinyl" viewBox="0 0 16 16">
                                <path
								d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                <path
								d="M8 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM4 8a4 4 0 1 1 8 0 4 4 0 0 1-8 0z" />
                                <path
								d="M9 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
                              </svg> Bài 1
				</a></li>
				<li><a href="/PS16500_VoThanhNha_Lab3/HomeWork_2"> <svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-vinyl" viewBox="0 0 16 16">
                                <path
								d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                <path
								d="M8 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM4 8a4 4 0 1 1 8 0 4 4 0 0 1-8 0z" />
                                <path
								d="M9 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
                              </svg> Bài 2
				</a></li>
				<li><a href="/PS16500_VoThanhNha_Lab3/HomeWork_3"> <svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-vinyl" viewBox="0 0 16 16">
                                <path
								d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                <path
								d="M8 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM4 8a4 4 0 1 1 8 0 4 4 0 0 1-8 0z" />
                                <path
								d="M9 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
                              </svg> Bài 3
				</a></li>
				<li><a href="/PS16500_VoThanhNha_Lab3/HomeWork_4"> <svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-vinyl" viewBox="0 0 16 16">
                                <path
								d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                <path
								d="M8 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM4 8a4 4 0 1 1 8 0 4 4 0 0 1-8 0z" />
                                <path
								d="M9 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
                              </svg> Bài 4
				</a></li>
				<li><a href="/PS16500_VoThanhNha_Lab3/HomeWork_5"> <svg
							xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="currentColor" class="bi bi-vinyl" viewBox="0 0 16 16">
                                <path
								d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14zm0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16z" />
                                <path
								d="M8 6a2 2 0 1 0 0 4 2 2 0 0 0 0-4zM4 8a4 4 0 1 1 8 0 4 4 0 0 1-8 0z" />
                                <path
								d="M9 8a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
                              </svg> Bài 5
				</a></li>
			</ul>

			<ul class="list-unstyled CTAs">
				<li><a href="" class="download">Close web</a></li>
			</ul>
		</nav>

		<!-- Page Content -->
		<div id="content">
			<nav class="navbar navbar-dark bg-dark">
				<div class="container-fluid">
					<button type="button" id="sidebarCollapse" class="btn btn-warning">
						<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
							fill="currentColor" class="bi bi-list" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
								d="M2.5 12a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4a.5.5 0 0 1 .5-.5h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z" />
                          </svg>
						<span>Bài tập</span>
					</button>
					<button class="btn btn-dark d-inline-block d-lg-none ml-auto"
						type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fas fa-align-justify"></i>
					</button>
				</div>
			</nav>
			<div class="from">
				<form action="/PS16500_Lab6/testSend" method="post"
					enctype="multipart/form-data">
					<div class="margin">
						<div class="title">
							<h1>Send mail</h1>
						</div>
						Sender:
						<p>
							<input name="from" placeholder="From" class="form-control">
						</p>
						Receiver:
						<p>
							<input name="to" placeholder="To" class="form-control">
						</p>
							<a onclick="myFunctionBCC()" id="maubcc"><u>BCC</u></a> 
							<input id="bcc" placeholder="BCC" class="form-control" style="display: none;" name="bcc"> 
							<a onclick="myFunctionCC()" id="maucc"><u>CC</u></a> 
							<br>
							<input id="cc" placeholder="CC" class="form-control" style="display: none;" name="cc"> <br>
						Subject:
						<p>
							<input name="subject" placeholder="Subject" class="form-control">
						</p>
						Content:
						<p>
							<textarea name="body" placeholder="Body" rows="3" cols="30"
								class="form-control"></textarea>
						</p>
						File: <input name="photo_file" type="file" class="form-control"><br>
						<div id="button-margin">
							<button class="btn btn-block btn-warning">Send</button>
						</div>
					</div>
				</form>
				<script>
					if ("${message}" != "") {
						alert("${message}");
					}
				</script>
			</div>
			<!-- jQuery CDN - Slim version (=without AJAX) -->
			<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js "
				integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo "
				crossorigin="anonymous "></script>
			<!-- Popper.JS -->
			<script
				src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js "
				integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ "
				crossorigin="anonymous "></script>
			<!-- Bootstrap JS -->
			<script
				src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js "
				integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm "
				crossorigin="anonymous "></script>
			<div class="counter "></div>
			<!-- partial -->
			<script
				src='https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.12.0/lodash.min.js'></script>
			<script src="${pageContext.request.contextPath}/js/header.js "></script>
			<script
				src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</body>
</html>