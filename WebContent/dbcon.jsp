<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String user = "system";
	String password = "1234";
	String url = "jdbc:oracle:thin:@localhost:1521:XE";
	String sql = "";

	Class.forName("oracle.jdbc.driver.OracleDriver");

	Connection conn = DriverManager.getConnection(url, user, password);
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	if (conn != null) {
		System.out.println("suc");
	}
	%>
</body>
</html>