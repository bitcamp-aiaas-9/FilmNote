<%-- FilmNote/src/main/webapp/admin/movieWrite.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/film_favicon.png" type="image/png">
<link rel="stylesheet" href="../css/movieWrite.css">
<title>영화 추가</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/adminMenu.jsp" />


<c:if test="${sessionScope.adminDTO.aid == 'admin'}">



</c:if>

<c:if test="${sessionScope.adminDTO.aid != 'admin'}">
    <script>
        alert("관리자로 로그인하세요");
        location.href = "${pageContext.request.contextPath}/admin/adminLogIn.do";
    </script>
</c:if>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/movieWrite.js"></script>
</body>
</html>