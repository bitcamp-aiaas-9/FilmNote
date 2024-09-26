<%-- FilmNote/src/main/webapp/review/reviewView.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="../image/film_favicon.png" type="image/png">
<link rel="stylesheet" href="../css/reviewView.css">
<title>리뷰 조회</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div id="movieInfo">
	<div id="title">${movieDTO.title}</div>
	<table>
		<tr>
		    <td align="center" rowspan="9" class="poster-cell">
		        <img src="${movieDTO.poster }" alt="영화 포스터">
		    </td>
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
			<th>영화 관람가</th>
		    <td class="info-cell">${movieDTO.rating }세</td>
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
</div>

<div id="reviewDiv">
	<!-- 리뷰 -->
	<div id="reviewList">
		<div class="review">
			<div class="icon-button">👲</div>
		    <!-- <img class="profile-pic" src="default-profile.jpg" alt="User Profile"> -->
		    <div class="comment-details">
		        <div class="comment-header">
		            <span class="list-user-id">댓글 단 사람</span>
		            <span class="comment-date">YYYY.MM.DD hh:mm:ss</span>
		        </div>
		        <div class="list-content">리뷰 내용</div>
		        <div class="comment-actions">
		            <span class="reply">답글쓰기</span>
		            <span class="like">❤️</span>
		        </div>
		    </div>
		    <div class="comment-options">
		        <button class="options-btn">⋮</button>
		        <div class="options-menu">
		            <span class="edit">수정</span>
		            <span class="delete">삭제</span>
		        </div>
		    </div>
		</div>
	</div>
	<!-- 리뷰 -->
	
	
	<div id="post-comment">
	    <div class="post-header">로그인한 사용자 이름</div>
	    <textarea id="new-comment" placeholder="댓글을 남겨보세요"></textarea>
	    <div class="post-footer">
	    	<div id="emoji">
	         <button class="icon-button">📷</button>
	         <button class="icon-button">😊</button>
	        </div>
	        <button id="submit-comment">등록</button>
	    </div>
	</div>
	<div id="page-block">${boardPaging.pagingHTML }</div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/reviewView.js"></script>
</body>
</html>