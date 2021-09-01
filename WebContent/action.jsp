<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="dbcon.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	sql = "INSERT INTO tbl_vote_202005 VALUES(?, ?, ?, ?, ?, ?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("jumin"));
	pstmt.setString(2, request.getParameter("name"));
	pstmt.setString(3, request.getParameter("no"));
	pstmt.setString(4, request.getParameter("time"));
	pstmt.setString(5, request.getParameter("area"));
	pstmt.setString(6, request.getParameter("confirm"));
	pstmt.executeUpdate();
	%>
	<script type="text/javascript">
		alert("정상적으로 처리되었습니다");
		location.href = "index.jsp?name=section.jsp";
	</script>
</body>
</html>