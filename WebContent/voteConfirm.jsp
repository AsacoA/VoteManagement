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
				<th>성명</th>
				<th>생년월일</th>
				<th>나이</th>
				<th>성별</th>
				<th>후보번호</th>
				<th>투표시간</th>
				<th>유권자확인</th>
			<tr>
				<%
					sql = "SELECT" + " V_NAME AS \"성명\"," + " TO_CHAR(" + " TO_DATE(" + " DECODE(SUBSTR(V_JUMIN, 7, 1),"
						+ " '1', '19' || SUBSTR(V_JUMIN, 1, 6)," + " '2', '19' || SUBSTR(V_JUMIN, 1, 6),"
						+ " '3', '20' || SUBSTR(V_JUMIN, 1, 6),"
						+ " '4', '20' || SUBSTR(V_JUMIN, 1, 6)), 'YYYY-MM-DD'), 'YYYY\"년\"MM\"월\"DD\"일생\"') AS \"생년월일\", " + " '만 ' ||"
						+ " TRUNC(" + " MONTHS_BETWEEN(TRUNC(SYSDATE)," + " TO_DATE(" + " DECODE(SUBSTR(V_JUMIN, 7, 1),"
						+ " '1', '19' || SUBSTR(V_JUMIN, 1, 6)," + " '2', '19' || SUBSTR(V_JUMIN, 1, 6),"
						+ " '3', '20' || SUBSTR(V_JUMIN, 1, 6),"
						+ " '4', '20' || SUBSTR(V_JUMIN, 1, 6)), 'YYYY-MM-DD')) / 12) || '세' AS \"나이\","
						+ " DECODE(SUBSTR(V_JUMIN, 7, 1), '1', '남', '2', '여', '3', '남', '4', '여') AS \"성별\"," + " M_NO AS \"후보번호\","
						+ " TO_CHAR(TO_DATE(V_TIME, 'HH24:MI'),'HH24:MI')  AS \"투표시간\","
						+ " DECODE(V_CONFIRM, 'Y', '확인', 'N', '미확인') AS \"유권자확인\"" + " FROM tbl_vote_202005";
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