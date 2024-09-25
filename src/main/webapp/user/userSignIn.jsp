<%-- FilmNote/src/main/webapp/user/userSignIn.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/film_favicon.png" type="image/png">
<link rel="stylesheet" href="../css/userSignIn.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer">
<title>로그인</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />	
	<div id="login-jsp" class="signin-container">
        
        <h2>로그인</h2>
        <form id="loginForm" action="${pageContext.request.contextPath}/user/userSignIn.do" method="post">
            <table>
                <tr>
                    <td class="label"><label for="loginId"><i class="fa-solid fa-user"></i> ID</label></td>
                    <td class="input"><input type="text" id="loginId" name="uid" required></td>
                </tr>
                <tr>
                    <td colspan="2"><div id="loginIdDiv"></div></td>
                </tr>
                <tr>
                    <td class="label"><label for="loginPwd"><i class="fa-solid fa-lock"></i> Pwd</label></td>
                    <td class="input"><input type="password" id="loginPwd" name="upwd" required></td>
                </tr>
                <tr>
                    <td colspan="2"><div id="loginPwdDiv"></div></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <button type="submit" id="loginBtn">로그인</button>
                        <button type="button" onclick="location.href='${pageContext.request.contextPath}/user/userSignUpDB.do'">회원가입</button>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><div id="loginErrorDiv"></div></td> <!-- 로그인 에러 메시지 div 추가 -->
                </tr>
            </table>
        </form>
        <button type="button" id="adminBtn" onclick="location.href='${pageContext.request.contextPath}/admin/adminSignIn.do'">Admin</button> <!-- 관리자 로그인 버튼 추가 -->
    </div>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/userSignIn.js"></script>
</body>
</html>