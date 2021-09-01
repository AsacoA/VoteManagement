<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function check() {
		if (frm.jumin.value == "") {
			alert("입력되지 않았습니다 ");
			frm.jumin.focus();
			return false;
		}
		if (frm.name.value == "") {
			alert("입력되지 않았습니다 ");
			frm.name.focus();
			return false;
		}
		if (frm.no.value == "") {
			alert("입력되지 않았습니다 ");
			frm.no.focus();
			return false;
		}
		if (frm.time.value == "") {
			alert("입력되지 않았습니다 ");
			frm.time.focus();
			return false;
		}
		if (frm.area.value == "") {
			alert("입력되지 않았습니다 ");
			frm.area.focus();
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div align="center">
		<h3>투표하기</h3>
		<form action="action.jsp" method="post" onsubmit="return check()"
			name="frm">
			<table border="1">
				<tr>
					<td>주민번호</td>
					<td><input type="text" name="jumin" maxlength="13"> 예 : 8906153154726</td>
				</tr>
				<tr>
					<td>성명</td>
					<td><input type="text" name="name"></td>
				</tr>
				<tr>
					<td>투표번호</td>
					<td><select name="no">
							<option value="" selected="selected">후보자 선택</option>
							<option value="1">[1]김후보</option>
							<option value="2">[2]이후보</option>
							<option value="3">[3]박후보</option>
							<option value="4">[4]조후보</option>
							<option value="5">[5]최후보</option>
					</select></td>
				</tr>
				<tr>
					<td>투표시간</td>
					<td><input type="text" name="time" maxlength="4"></td>
				</tr>
				<tr>
					<td>투표장소</td>
					<td><input type="text" name="area"></td>
				</tr>
				<tr>
					<td>유권자확인</td>
					<td><input type="radio" name="confirm" value="Y" checked="checked">확인
						<input type="radio" name="confirm" value="N">미확인</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit">투표하기</button>
						<button type="reset">다시하기</button>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>