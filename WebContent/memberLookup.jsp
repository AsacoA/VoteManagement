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
				<th>소속정당</th>
				<th>학력</th>
				<th>주민번호</th>
				<th>지역구</th>
				<th>대표전화</th>
			<tr>
				<%
					sql = "SELECT " + " m.M_NO AS \"후보번호\", " + " m.M_NAME AS \"이름\", " + " p.P_NAME AS \"소속정당\", "
						+ " DECODE(m.P_SCHOOL, '1', '고졸', '2', '학사', '3', '석사', '4', '박사') AS \"최종학력\", "
						+ " SUBSTR(m.M_JUMIN, 1, 6) || '-' || SUBSTR(m.M_JUMIN, 7,7) \"주민번호\", " + " M_CITY \"지역구\", "
						+ " p.P_TEL1 || '-' || p.P_TEL2 || '-' || p.P_TEL3 AS \"대표전화\"" + " FROM tbl_member_202005 m"
						+ " JOIN tbl_party_202005 p ON m.P_CODE = p.P_CODE" + " ORDER BY 1 ASC";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while (rs.next()) {
				%>
			<tr align="center">
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><%=rs.getString(5)%></td>
				<td><%=rs.getString(6)%></td>
				<td><%=rs.getString(7)%></td>
			</tr>
			<%
				}
			%>

		</table>
	</div>
</body>
</html>