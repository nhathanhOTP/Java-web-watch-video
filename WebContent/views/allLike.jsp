<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All like</title>
</head>
<style>
.tabcontent {
	color: white;
	height: 100%;
	top: 0px;
	padding-left: 20px;
	padding-right: 20px;
	padding-top: 150px;
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
	margin-left: 250px;
}

#display {
	font-size: 17px;
	border: 1px solid gray;
	margin: auto;
	width: 250px;
	height: 50px;
	border-radius: 30px;
	box-shadow: 0 0 5px gray;
	position: absolute;
	top: 180px;
}

#display:hover {
	box-shadow: 0 0 7px blue;
}
</style>
<body>
	<c:url var="url" value="/search" />

	<form action="${url}/favortieX" method="post">
		<button formaction="${url}/favortieX" id="display">Display
			information video</button>
	</form>
	<div id="Contact" class="tabcontent">
		<div class="rowTabel" style="display:${none}">
			<table id="customers" class="table sticky">
				<thead>
					<tr>
						<th>Id</th>
						<th>Favorite count</th>
						<th>Newest Date</th>
						<th>Oldest Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${report }">
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

</body>
</html>