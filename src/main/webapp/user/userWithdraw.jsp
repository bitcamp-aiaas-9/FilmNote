<%-- FilmNote/src/main/webapp/user/userWithdraw.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/film_favicon.png" type="image/png">
<link rel="stylesheet" href="../css/userWithdraw.css">
<title>회원탈퇴</title>
</head>
<body>
	<%-- <jsp:include page="../common/header.jsp"> --%>
	<div id="userWithdraw-jsp" class="userWithdraw-jsp">
	<h2>회원탈퇴 페이지</h2>
<form id="userWithdrawForm" name="userwithdrawForm" method="post" action="/FilmNote/userWithdrawDB.do">
	<button type="button" id="withdrawBtn"
		style="font-size: 10px !important; width: 30px !important; height: 20px !important; background: gray !important; color: rightgray !important; float: right;">확인</button>
		</form>
		</div>
	<script type="text/javascript"
		src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script type="text/javascript" src="../js/userWithdraw.js"></script>
</body>
</html>

<!-- 
 서비스 불만족: "서비스 품질이 기대에 미치지 못했습니다."
 사용 빈도 감소: "이용 빈도가 적어졌습니다."
 개인정보 우려: "개인정보 보호에 대한 우려가 있습니다."
 사용자 인터페이스 불편: "웹사이트/앱의 인터페이스가 불편합니다."
 기타 개인 사유: "개인적인 사유로 더 이상 이용하지 않기로 했습니다." -->