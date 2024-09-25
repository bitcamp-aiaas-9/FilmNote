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
	<jsp:include page="../common/header.jsp" />
	<div id="userEdit-jsp" class="userEdit-container">
	
		<h2>회원정보수정</h2>
		<form name="userEditForm" method="post" action="#">
			<table>
				<tr>
					<th class="label"><label for="name"><i class="fa-solid fa-user"></i> 이름</label></th>
					<td class="input"><input type="text" name="name" id="name" value="${userDTO.name }" readonly>
						<div id="nameDiv"></div></td>
				</tr>
				
				<tr>
					<th class="label"><label for="id"><i class="fa-solid fa-badge"></i> 아이디</label></th>
					<td class="input"><input type="text" name="uid" id="uid" value="${userDTO.uid }" readonly></td>
				</tr>

				<tr>
					<th class="label"><label for="name"><i class="fa-solid fa-lock"></i> 비밀번호</label></th>
					<td class="input"><input type="password" name="upwd" id="upwd" value="${userDTO.upwd }">
						<div id="upwdDiv"></div></td>
				</tr>

				<tr>
					<th class="label"><label for="name"><i class="fa-solid fa-lock"></i> 비밀번호 확인</label></th>
					<td class="input"><input type="password" name="reupwd" id="reupwd" value="${userDTO.upwd }">
						<div id="reupwdDiv"></div></td>
				</tr>

		         <tr>
                    <th class="label"><label for="gender"><i class="fa-solid fa-venus-mars"></i> 성별</label></th>
                    <td class="input">
                        <label><input type="radio" id="male" name="gender" value="male"> 남자 </label>
                        <label><input type="radio" id="female" name="gender" value="female"> 여자</label>
                    </td>
                </tr>
                
                            <tr>
                    <th class="label"><label for="birth"><i class="fa-solid fa-calendar"></i> 생년월일</label></th>
                    <td class="input">
                        <input type="text" id="birth1" name="birth1" value="${userDTO.birth1 }" class="input-tel"> 
                        <input type="text" id="birth2" name="birth2" value="${userDTO.birth2 }"class="input-tel"> 
                        <input type="text" id="birth3" name="birth3" value="${userDTO.birth3 }"class="input-tel">
                    </td>
                </tr>
                
				<tr>
					<th class="label"><label for="email"><i class="fa-solid fa-envelope"></i> 이메일</label></th>
					<td class="input">
					<input type="text" name="email1" id="email1" class="input-email" value="${userDTO.email1 }"> @
					<input type="text" name="email2" id="email2" class="input-email" value="${userDTO.email2 }">
						<select id="emailSelect" name="emailSelect" class="input-email">
                            <option value="">직접입력</option>
                            <option value="naver.com">naver.com</option>
                            <option value="gmail.com">gmail.com</option>
                            <option value="daum.net">daum.net</option>
                        </select>
                    </td>
				</tr>

				<tr>
					<th class="label"><label for="tel"><i class="fa-solid fa-phone"></i> 휴대전화</label></th>
                    <td class="input"><select id ="tel1" name="tel1" class="input-tel" value="${userDTO.tel1 }">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="019">019</option>
					</select> - 
					<input type="text" name="tel2" size="4" maxlength="4" value="${userDTO.tel2 }" class="input-tel"> - 
					<input type="text" name="tel3" size="4" maxlength="4" value="${userDTO.tel3 }" class="input-tel">
					</td>
				</tr>
				<tr>
					<td colspan="3" align="center">
					<button type="button" id="userEditBtn">회원정보 수정</button>
					<button type="reset" id="resetBtn">수정 취소</button>
					<button type="button" id="WithdrawBtn"  style="font-size: 10px !important;
					width: 50px !important; height: 20px !important; background: gray !important;
					color: rightgray !important; float: right;">탈퇴</button>
					</td>
				</tr>
			</table>
		</form>
	</div>

	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="../js/userEdit.js"></script>
</body>
</html>