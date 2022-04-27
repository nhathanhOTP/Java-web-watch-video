<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search User Id</title>
<style>
.form {
	margin: auto;
}

.search {
	margin: auto;
	position: relative;
}

.search input {
	outline: none;
	border: 1px solid gray;
	box-shadow: 0 0 3px gray;
	border-radius: 30px;
	width: 500px;
	height: 45px;
	padding-left: 20px;
	font-size: 17px;
	margin-left: 500px;
	margin-top: 250px;
}

.search input:focus {
	box-shadow: 0 0 7px blue;
}

.search svg {
	position:
}

.tabcontent {
	color: white;
	height: 100%;
	top: 0px;
	padding-left: 20px;
	padding-right: 20px;
}

.tabcontent .rowTabel {
	width: 60%;
	height: auto;
	margin: auto;
	display: none;
}

#customers {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
}

#customers td, #customers th {
	border: 1px solid #ddd;
	padding: 8px;
}

#customers tr {
	background-color: #f2f2f2;
	color: rgb(44, 44, 44);
}

#customers tr:hover {
	background-color: #ddd;
}

#customers th {
	text-align: left;
	background-color: #04AA6D;
	color: white;
	position: sticky;
}

.find {
	margin-left: 960px;
	position: absolute;
	top: 34%;
}

.find button {
	border: none;
	background-color: transparent;
}

.title {
	width: 100%;
	top: 15%;
	font-size: 40px;
	text-align: center;
	position: absolute;
	font-family: sans-serif;
	background-image: linear-gradient(to right, crimson, lightsalmon, gold, seagreen,
		midnightblue, indigo, violet);
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
}
</style>
</head>
<body>
	<c:url var="url" value="/search" />

	<%--User Id --%>
	<form action="${url}/userId" method="post" class="form">
		<div class="title">
			<h2>Your username</h2>
		</div>
		<div class="search">
			<input type="text" name="username"><br>
		</div>
		<div class="find">
			<button formaction="${url}/userId">
				<svg xmlns="http://www.w3.org/2000/svg" width="35" height="35"
					fill="currentColor" class="bi bi-search-heart" viewBox="0 0 16 16">
  			<path
						d="M6.5 4.482c1.664-1.673 5.825 1.254 0 5.018-5.825-3.764-1.664-6.69 0-5.018Z" />
  			<path
						d="M13 6.5a6.471 6.471 0 0 1-1.258 3.844c.04.03.078.062.115.098l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1.007 1.007 0 0 1-.1-.115h.002A6.5 6.5 0 1 1 13 6.5ZM6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11Z" />
			</svg>
			</button>
		</div>
	</form>
	<br>
	<div id="Contact" class="tabcontent">
		<div class="rowTabel" style="display:${none}">
			<table id="customers" class="table sticky">
				<thead>
					<tr>
						<th>Id video</th>
						<th>Title video</th>
						<th>Views video</th>
						<th>Active</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${favorites}">
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
		<script>
	<!-- Thông báo -->
		if (${user.fullname} != "") {
			alert("Xin chào, "${user.fullname} "\nYour email:" ${user.email}");
		}
	</script>
</body>
</html>