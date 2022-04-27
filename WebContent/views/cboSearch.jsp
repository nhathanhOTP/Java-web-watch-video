<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Fillter combobox</title>
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
}
</style>
</head>
<body>
	<c:url var="url" value="/search" />
	
		<form action="${url}/comboBox" method="post">
		<select name="years">
			<% for (int i=2010;i<2022;i++){%>
				<option value ="<%=i%>"><%=i%></option>
			<%}%> 
		</select>
		<button formaction="${url}/comboBox">Show</button>
	</form>
	<ul>

	</ul>
	<hr>

	<!-- Bảng -->
	<table id="customers" class="table sticky">
		<thead>
			<tr>
				<th>Id</th>
				<th>Count views</th>
				<th>Newdest day</th>
				<th>Olddest day</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${videos }">
				<tr>
					<td>${item.group}</td>
					<td>${item.likes}</td>
					<td>${item.newest}</td>
					<td>${item.oldest}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>