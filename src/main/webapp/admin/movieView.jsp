<%-- FilmNote/src/main/webapp/admin/movieBoardView.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/film_favicon.png" type="image/png">
<link rel="stylesheet" href="../css/movieView.css">
<title>영화 상세 조회</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/adminMenu.jsp" />

<div id="movie-detail">
	<input type="hidden" id="memId" value="${sessionScope.memId }" />
	<input type="hidden" name="seq" id="seq" value="${movieDTO.mcode }" />
	<input type="hidden" name="pg" id="pg" value="${requestScope.pg }" />


	<!-- 영화 코드, 영화 제목, 영화 감독, 영화 장르, 영화 개봉일, 영화 등급, 영화 평점, 영화 줄거리, 영화 포스터 이미지 -->


</div>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/movieView.js"></script>
</body>
</html>