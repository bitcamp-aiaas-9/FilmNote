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
	<%-- <input type="hidden" id="memId" value="${sessionScope.memId }" /> --%>
	<input type="hidden" name="mcode" id="mcode" value="${movieDTO.mcode }" />
	<input type="hidden" name="pg" id="pg" value="${requestScope.pg }" />


	<!-- 영화 코드, 영화 제목, 영화 감독, 영화 장르, 영화 개봉일, 영화 등급, 영화 평점, 영화 줄거리, 영화 포스터 이미지 -->
	<form name="movie-view-form" id="movie-view-form">
	    <table>
	    	<tr>
	    		<th width="30%">영화 포스터</th>
	    		<th width="20%">영화 코드</th>
	    		<td width="50%" class="info-cell">${movieDTO.mcode }</td>
	    	</tr>
	        <tr>
	            <td align="center" rowspan="9" class="poster-cell">
	                <img src="${movieDTO.poster }" alt="영화 포스터">
	            </td>
	            <th>영화 제목</th>
	            <td class="info-cell">${movieDTO.title }</td>
	        </tr>
	        <tr>
	        	<th>영화 감독</th>
	            <td class="info-cell">${movieDTO.director }</td>
	        </tr>
	        <tr>
	        	<th>영화 장르</th>
	            <td class="info-cell">${movieDTO.genre }</td>
	        </tr>
	        <tr>
	        	<th>영화 개봉일</th>
	            <td class="info-cell">${movieDTO.release_date }</td>
	        </tr>
	        <tr>
	        	<th>영화 등급</th>
	            <td class="info-cell">${movieDTO.rating }</td>
	        </tr>
	        <tr>
	        	<th>영화 평점</th>
	            <td class="info-cell">${movieDTO.score }</td>
	        </tr>
	        <tr>
	        	<th>영화 줄거리</th>
	            <td class="info-cell">${movieDTO.synopsis }</td>
	        </tr>
	    </table>
	</form>
	<div class="button-container">
		<button type="button" class="view-btn" id="movie-edit-btn">수정</button> <!-- seq, pg 가져가야함 -->
		<button type="button" class="view-btn" id="movie-delete-btn">삭제</button> <!-- seq 가져가야함 -->
   		<button class="view-btn" id="list-btn" onclick="window.location.href='${pageContext.request.contextPath }/admin/movieList.do?pg=${pg }';">목록</button>
   	</div>
</div>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/movieView.js"></script>
</body>
</html>