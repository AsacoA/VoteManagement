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
	<div align="center">
		<h2>후보조회</h2>
		<table border="1">
			<tr>
				<th>후보번호</th>
				<th>성명</th>
				<th>총투표건수</th>
			<tr>
				<%
					sql = "SELECT" + " m.M_NO AS \"후보번호\", " + " m.M_NAME AS \"성명\"," + " COUNT(" + " CASE WHEN v.V_CONFIRM = 'Y'"
						+ " THEN v.M_NO" + " END) AS \"총투표건수\"" + " FROM" + " tbl_vote_202005 v"
						+ " JOIN tbl_member_202005 m ON v.M_NO = m.M_NO" + " GROUP BY m.M_NO, m.M_NAME" + " ORDER BY 3 DESC";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
				%>
			
			<tr align="center">
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
			</tr>
			<%
				}
			%>

		</table>
	</div>
</body>
</html>