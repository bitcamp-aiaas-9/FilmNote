<%-- FilmNote/src/main/webapp/user/userEdit.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/film_favicon.png" type="image/png">
<link rel="stylesheet" href="../css/userEdit.css">
<title>회원정보수정</title>
</head>
<body>
	<form name="userEditForm" method="post" action="userEdit.jsp">
		<h1>
			<img src="../image/iu1.jpg" width="96" height="144" alt="home"
				onclick="location.href='../index.jsp'" style="cursor: pointer">회원정보수정
		</h1>

		<table border="1">
			<tr>
				<th width="100">아이디</th>
				<td><input type="text" name="uid" id="uid"
					value="${userDTO.uid }" readonly>
					<div id="uidDiv"></div></td>
			</tr>

			<tr>
				<th width="100">비밀번호</th>
				<td><input type="text" name="upwd" id="upwd"
					value="${userDTO.upwd }">
					<div id="upwdDiv"></div></td>
			</tr>

			<tr>
				<th width="100">비밀번호 확인</th>
				<td><input type="text" name="reupwd" id="reupwd"
					value="${userDTO.reupwd }">
					<div id="reupwdDiv"></div></td>
			</tr>
			<tr>
				<th width="100">이름</th>
				<td><input type="text" name="name" id="name"
					value="${userDTO.name }" readonly>
					<div id="nameDiv"></div></td>
			</tr>

			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" value="0" id="gender_m" />남자
					<input type="radio" name="gender" value="1" id="gender_f" />여자</td>
			</tr>

			<tr>
				<th width="100">생년월일(년)</th>
				<td><input type="text" name="birth1" id="birth1"
					value="${userDTO.birth1 }">
					<div id="birth1Div"></div></td>
			</tr>

			<tr>
				<th width="100">생년월일(월)</th>
				<td><input type="text" name="birth2" id="birth2"
					value="${userDTO.birth2 }">
					<div id="birth2Div"></div></td>
			</tr>

			<tr>
				<th width="100">생년월일(일)</th>
				<td><input type="text" name="birth3" id="birth3"
					value="${userDTO.birth3 }">
					<div id="birth3Div"></div></td>
			</tr>

			<tr>
				<th>이메일</th>
				<td>
					<input type="text" name="email1" id="email1" value="${userDTO.email1 }"> @ 
					<input type="text" name="email2" id="email2" value="${userDTO.email2 }">
					<input type="text" name="email3" id="email3" list="email3_list"	oninput="change()">
					<datalist id="email3_list">
						<option value="직접입력"></option>
						<option value="naver.com" />
						<option value="gmail.com" />
						<option value="daum.net" />
					</datalist>
				</td>
			</tr>

			<tr>
				<th>핸드폰</th>
				<td>
				<select name="tel1">
						<optgroup label="hp">
							<option value="010">010</option>
							<option value="011">011</option>
							<option value="019">019</option>
						</optgroup>
				</select> - 
				<input type="text" name="tel2" size="4" maxlength="4" value="${userDTO.tel2 }"> - 
				<input type="text" name="tel3" size="4" maxlength="4" value="${userDTO.tel3 }">
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
				<input type="button" value="회원정보수정" id="userEditBtn" />
				<input type="reset" value="다시작성" onclick="location.reload()" />
				</td>
			</tr>
		</table>
	</form>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="../js/userEdit.js"></script>
</body>
</html>