<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css.css">
</head>
<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	<%
		String name = request.getParameter("name");
	if (name == null || name == "") {
		name = "section.jsp";
	}
	%>
	<jsp:include page="<%=name%>" />
	<jsp:include page="footer.jsp" />
</body>
</html>