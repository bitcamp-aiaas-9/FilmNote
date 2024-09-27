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
<title>영화 등록</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />
<jsp:include page="../common/adminMenu.jsp" />


<c:if test="${sessionScope.adminDTO.aid == 'admin'}">

	<div id="movie-write">
		<input type="hidden" name="pg" id="pg" value="${requestScope.pg }" />
		
		<!-- 영화 코드, 영화 제목, 영화 감독, 영화 장르, 영화 개봉일, 영화 등급, 영화 평점, 영화 줄거리, 영화 포스터 이미지 -->
		<form name="movie-write-form" id="movie-write-form">
		    <table>
		    	<tr>
		    		<th width="30%">영화 포스터</th>
		    		<th width="20%">영화 코드</th>
		    		<td width="50%" class="info-cell">
		    			<input type="text" name="movieCode" id="movieCode" />
		    			<div class="validation" id="movieCodeDiv"></div>
		    		</td>
		    	</tr>
		        <tr>
		            <td align="center" rowspan="9" class="poster-cell">
		                <img width="90%" >
		                <div id="fileIcon">📁</div>
		                <input type="file" name="moviePoster" id="moviePoster" />
		    			<div class="validation" id="moviePosterDiv"></div>
		            </td>
				    <th>영화 제목</th>
				    <td class="info-cell">
				    	<input type="text" name="movieTitle" id="movieTitle" />
				    	<div class="validation" id="movieTitleDiv"></div>
				    </td>
		        </tr>
		        <tr>
		        	<th>영화 감독</th>
		            <td class="info-cell">
		            	<input type="text" name="movieDirector" id="movieDirector" />
		            	<div class="validation" id="movieDirectorDiv"></div>
		            </td>
		        </tr>
		        <tr>
		        	<th>영화 장르</th>
		            <td class="info-cell">
		            	<input type="text" name="movieGenre" id="movieGenre" />
		            	<div class="validation" id="movieGenreDiv"></div>
		            </td>
		        </tr>
		        <tr>
		        	<th>영화 개봉일</th>
		            <td class="info-cell">
		            	<input type="text" name="movieReleaseDate" id="movieReleaseDate" />
		            	<div class="validation" id="movieReleaseDateDiv"></div>
		            </td>
		        </tr>
		        <tr>
		        	<th>영화 관람가</th>
		            <td class="info-cell">	
		            	<input type="text" name="movieRating" id="movieRating" />
		            	<div class="validation" id="movieRatingDiv"></div>
		            </td>
		        </tr>
		        <tr>
		        	<th>영화 평점</th>
		            <td class="info-cell">
		            	<input type="text" name="movieScore" id="movieScore" />
		            	<div class="validation" id="movieScoreDiv"></div>
		            </td>
		        </tr>
		        <tr>
		        	<th>영화 줄거리</th>
		            <td class="info-cell">
		            	<textarea name="movieSynopsis" id="movieSynopsis" rows="5" cols="60"></textarea>
		            	<div class="validation" id="movieSynopsisDiv"></div>
		            </td>
		        </tr>
		    </table>
		</form>
	</div>
	<div class="button-container" style="width:1000px; display: flex; justify-content: flex-end;">
		<button type="button" class="crud-btn" id="movie-write-btn">등록</button> 
		<button class="crud-btn" id="list-btn" onclick="window.location.href='${pageContext.request.contextPath }/admin/movieList.do';">목록</button>
	</div>
</c:if>

<c:if test="${sessionScope.adminDTO.aid != 'admin'}">
    <script>
        alert("관리자로 로그인하세요");
        location.href = "${pageContext.request.contextPath}/admin/adminSignIn.do";
    </script>
</c:if>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

<script>
    var context = '${pageContext.request.contextPath}';
</script>

<script type="text/javascript" src="../js/movieWrite.js"></script>
</body>
</html>