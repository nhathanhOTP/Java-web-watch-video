<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Search chooser month</title>
</head>
<body>
	<c:url var="url" value="/search" />
	<%--month to video nq  --%>
	<form action="${url}/month-to-video-nq" method="post">
		<%for (int i = 1; i < 13; i++) {%>
		<input type="radio" name="month" value="<%=i%>"><%=i%><br>
		<%}%>
		<button formaction="${url}/month-to-video-nq">Search</button>
	</form>

	<!-- Bảng -->
	<table border="1" style="width: 100%">
		<c:forEach var="item" items="${videos}">
			<tr>
				<td>${item.id}</td>
				<td>${item.title}</td>
				<td>${item.views}</td>
				<td>${item.active}</td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>