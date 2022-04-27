<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Random</title>
<style>
.tabcontent {
	color: white;
	height: 100%;
	top: 100px;
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 200px;
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

.row {
	width: 100%;
	flex-wrap: wrap;
	margin: auto;
	display: flex;
	height: 800px;
}

#content-padding button {
	margin-right: 25px;
	margin-left: 25px;
}

#random {
	width: 200px;
	font-size: 18px;
	height: 35px;
	border-radius: 20px;
	box-shadow: 0 0 3px gray;
	border: 1px solid gray;
}

#random:hover {
	box-shadow: 0 0 7px blue;
}
</style>
</head>
<body>
	<c:url var="url" value="/search" />
	<%-- random --%>
	<form action="${url}/random" method="post">
		<button formaction="${url}/random" id="random">Random</button>
	</form>
	<ul>
	</ul>
	<hr>
	<div class="row">
		<c:forEach var="item" items="${videos }">
			<div class="hagu" id="content-padding">
				<button formaction="#" value="${item.id}" name="btnmain">
					<a href="#"><img alt="Product Name"
						src="https://img.youtube.com/vi/${item.poster}/maxresdefault.jpg"
						width="280px" height="200px"></a>
				</button>
			</div>
		</c:forEach>
	</div>
	<!-- Bảng -->
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
</body>
</html>