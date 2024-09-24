<%-- FilmNote/src/main/webapp/common/header.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
@import url("init.css");
#header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 20px 0 10px 0;
	border-bottom: 1px solid #5A5A5A;
	padding: 20px 0;
}

#title {
	width: 150px;
}

#member {
	width:300px;
	display: flex;
    padding: 0 20px;
    gap:10px;
    flex-direction: row;
    align-items: center;
    justify-content: flex-end;
    border-bottom: 2px solid #00589
}

button.user {
	display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    width: 130px;
    height: 30px;
    background: #FFFFFF;
    border: 1px solid #3d3d3d;
    border-radius: 5px;
    font-family: 'Noto Sans CJK KR';
    font-style: normal;
    font-weight: 400;
    font-size: 16px;
    line-height: 50px;
    color: #3d3d3d;
    transition: background-color 0.3s ease; 
}

button.user:hover {
	background-color: #3d3d3d;
	color: #FFFFFF;
	cursor: pointer;
}

</style>
<body>
<div id="header">
	<div id="title">
		<a href="${pageContext.request.contextPath}/index.do">
			<img src="${pageContext.request.contextPath}/image/filmnote_logo.png" width="300" alt="logo" />
		</a>
	</div>
	
	
	<div id="member">
		<button id="signInBtn" class="user" onclick="location.href='${pageContext.request.contextPath}/user/userSignIn.jsp';">로그인</button>
		<button id="signUpBtn" class="user" onclick="location.href='${pageContext.request.contextPath}/user/userSignUp.jsp';">회원가입</button>

		<c:if test="${memId != null }">
			<button id="profileBtn" class="user" onclick="location.href='${pageContext.request.contextPath}/user/userEdit.do';"><span id="user-name"></span> 님</button>
			<button id="logOutBtn" class="user">Log Out</button>
		</c:if>
	</div>

</div><!-- <div id="header"> -->



</body>
