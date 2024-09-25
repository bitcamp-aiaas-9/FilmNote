<%-- FilmNote/src/main/webapp/user/userSignUp.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/film_favicon.png" type="image/png">
<link rel="stylesheet" href="../css/userSignUp.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer">
<title>회원가입</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />	
	<div id="write-jsp" class="signup-container">
        
        <h2>회원가입</h2>
        <form id="signUpForm" action="#" method="post">
            <table>
                <tr>
                    <th class="label"><label for="name"><i class="fa-solid fa-user"></i> 이름</label></th>
                    <td class="input"><input type="text" id="name" name="name" placeholder="이름 입력"></td>
                </tr>
                <tr>
                    <th class="label"><label for="id"><i class="fa-solid fa-id-badge"></i> 아이디</label></th>
                    <td class="input"><input type="text" id="id" name="id" placeholder="아이디 입력"></td>
                </tr>
                <tr>
                    <th class="label"><label for="pwd"><i class="fa-solid fa-lock"></i> 비밀번호</label></th>
                    <td class="input"><input type="password" id="pwd" name="pwd" placeholder="비밀번호 입력"></td>
                </tr>
                <tr>
                    <th class="label"><label for="repwd"><i class="fa-solid fa-lock"></i> 재확인</label></th>
                    <td class="input"><input type="password" id="repwd" name="repwd" placeholder="비밀번호 입력"></td>
                </tr>
                <tr>
                    <th class="label"><label for="gender"><i class="fa-solid fa-venus-mars"></i> 성별</label></th>
                    <td class="input">
                        <label><input type="radio" id="male" name="gender" value="male"> 남자</label>
                        <label><input type="radio" id="female" name="gender" value="female"> 여자</label>
                    </td>
                </tr>
                <tr>
                    <th class="label"><label for="birth"><i class="fa-solid fa-calendar"></i> 생년월일</label></th>
                    <td class="input">
                        <input type="text" id="birth" name="birth" placeholder="YYYY" class="input-tel"> 
                        <input type="text" id="birthMonth" name="birthMonth" placeholder="MM" class="input-tel"> 
                        <input type="text" id="birthDay" name="birthDay" placeholder="DD" class="input-tel">
                    </td>
                </tr>
                <tr>
                    <th class="label"><label for="email"><i class="fa-solid fa-envelope"></i> 이메일</label></th>
                    <td class="input">
                        <input type="text" id="email" name="email" placeholder="이메일 입력" class="input-email"> @ 
                        <input type="text" id="emailDomain" name="emailDomain" placeholder="직접입력" class="input-email">
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
                    <td class="input">
                        <select id="tel1" name="tel1" class="input-tel">
                            <option value="010">010</option>
                            <option value="011">011</option>
                            <option value="016">016</option>
                        </select> - 
                        <input type="text" id="tel2" name="tel2" placeholder="입력" class="input-tel"> - 
                        <input type="text" id="tel3" name="tel3" placeholder="입력" class="input-tel">
                    </td>
                </tr>
                <tr align="center">
                    <td colspan="2" height="20">
                        <button type="submit" id="signUpBtn">회원가입</button>
                        <button type="reset" id="resetBtn">초기화</button>
                    </td>
                </tr>
            </table>
        </form>
    </div>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/userSignUp.js"></script>
</body>
</html>