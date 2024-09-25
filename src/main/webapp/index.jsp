<%-- FilmNote/src/main/webapp/index.jsp --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="./image/film_favicon.png" type="image/png">
<link rel="stylesheet" href="./css/index.css">
<title>FilmNote</title>
<style type="text/css">
table {
	border-colpase: colpase;
	margin: 20px auto;
}

td {
	width: 250px;
	padding: 10px;
}

.hover-info {
    position: relative;
    display: block;
}

.hover-info::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.6); /* 반투명한 검은색 */
    opacity: 0; /* 기본적으로는 보이지 않게 설정 */
    transition: opacity 0.3s ease-in-out;
    z-index: 1;
}

.hover-info:hover::after {
    opacity: 1; /* 마우스를 올렸을 때 투명도 적용 */
}

.hover-info img {
    display: block;
    width: 100%; /* 이미지의 크기를 컨테이너에 맞춤 */
}

.over {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    color: white;
    z-index: 2; /* 텍스트는 검은색 오버레이 위에 위치 */
    text-align: center;
    display: none; /* 기본적으로 보이지 않음 */
}

.hover-info:hover .over {
    display: block; /* 마우스를 올렸을 때 텍스트 보이기 */
}

#footer {
	margin: 20px 50px;
}

#github {
	width: 180px;
	display: flex;
	justify-content: start;
	align-itmes: center;
	gap: 10px;
}

#footer-a {
	display: block;
	width: 180px;
}
#footer-p {
	margin-bottom: 10px;
}

#gitlink {
	line-height: 35px;
	height: 35px;
}
</style>
</head>

<body>
<jsp:include page="./common/header.jsp" />
<div id="poster">
	<table>
 		<c:if test="${movieboardDTOList.size() != 0}">
			<c:forEach var="row" begin="8" end="${movieboardDTOList.size()}" step="${movieInRowCount}">
	    		<tr>
	        	<c:forEach var="i" begin="${row}" end="${row + movieInRowCount - 1}" step="1">
	            	<c:if test="${i < movieboardDTOList.size()}">
		                <td>
		                    <a href="${pageContext.request.contextPath}/user/reviewView.do?mcode=${movieboardDTOList[i].getMcode()}">
                           <div class="hover-info">
                              <img src="${movieboardDTOList[i].getPoster() }" alt="" class="thumb" />
                                 
                              <!--<div class="type video"><span class="ico"></span></div>-->
                              <!-- 오버시 나오는 정보 -->
                              <div class="over">
                                 <span class="title">${movieboardDTOList[i].getTitle() }</span>
                                       <span class="open_date">개봉 : ${movieboardDTOList[i].getRelease_date()}</span>
                                       
                                       <span class="director">감독 : ${movieboardDTOList[i].getDirector()}</span>
                                       <span class="score">평점 : ${movieboardDTOList[i].getScore()}</span>
                                 <span class="btn_detail">자세히 보기</span>
                              <!-- //오버시 나오는 정보 -->
                              </div>
                           </div>
                        </a>
		                </td>
		            </c:if>
	        </c:forEach>
    </tr>
</c:forEach>
		</c:if>
	</table>
</div>

<div id="footer">
	<p id="footer-p">
		Film Note / 서울 강남구 강남대로94길 20 삼오빌딩 6층 602호 / 대표전화 : 0507-1414-9601 / 팀장 : 박채연
	</p>
	<a id="footer-a" href="https://github.com/bitcamp-aiaas-9/FilmNote" target="_blank">
		<div id="github">
			<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 496 512" width="32" height="35">
	  			<path d="M165.9 397.4c0 2-2.3 3.6-5.2 3.6-3.3 .3-5.6-1.3-5.6-3.6 0-2 2.3-3.6 5.2-3.6 3-.3 5.6 1.3 5.6 3.6zm-31.1-4.5c-.7 2 1.3 4.3 4.3 4.9 2.6 1 5.6 0 6.2-2s-1.3-4.3-4.3-5.2c-2.6-.7-5.5 .3-6.2 2.3zm44.2-1.7c-2.9 .7-4.9 2.6-4.6 4.9 .3 2 2.9 3.3 5.9 2.6 2.9-.7 4.9-2.6 4.6-4.6-.3-1.9-3-3.2-5.9-2.9zM244.8 8C106.1 8 0 113.3 0 252c0 110.9 69.8 205.8 169.5 239.2 12.8 2.3 17.3-5.6 17.3-12.1 0-6.2-.3-40.4-.3-61.4 0 0-70 15-84.7-29.8 0 0-11.4-29.1-27.8-36.6 0 0-22.9-15.7 1.6-15.4 0 0 24.9 2 38.6 25.8 21.9 38.6 58.6 27.5 72.9 20.9 2.3-16 8.8-27.1 16-33.7-55.9-6.2-112.3-14.3-112.3-110.5 0-27.5 7.6-41.3 23.6-58.9-2.6-6.5-11.1-33.3 2.6-67.9 20.9-6.5 69 27 69 27 20-5.6 41.5-8.5 62.8-8.5s42.8 2.9 62.8 8.5c0 0 48.1-33.6 69-27 13.7 34.7 5.2 61.4 2.6 67.9 16 17.7 25.8 31.5 25.8 58.9 0 96.5-58.9 104.2-114.8 110.5 9.2 7.9 17 22.9 17 46.4 0 33.7-.3 75.4-.3 83.6 0 6.5 4.6 14.4 17.3 12.1C428.2 457.8 496 362.9 496 252 496 113.3 383.5 8 244.8 8zM97.2 352.9c-1.3 1-1 3.3 .7 5.2 1.6 1.6 3.9 2.3 5.2 1 1.3-1 1-3.3-.7-5.2-1.6-1.6-3.9-2.3-5.2-1zm-10.8-8.1c-.7 1.3 .3 2.9 2.3 3.9 1.6 1 3.6 .7 4.3-.7 .7-1.3-.3-2.9-2.3-3.9-2-.6-3.6-.3-4.3 .7zm32.4 35.6c-1.6 1.3-1 4.3 1.3 6.2 2.3 2.3 5.2 2.6 6.5 1 1.3-1.3 .7-4.3-1.3-6.2-2.2-2.3-5.2-2.6-6.5-1zm-11.4-14.7c-1.6 1-1.6 3.6 0 5.9 1.6 2.3 4.3 3.3 5.6 2.3 1.6-1.3 1.6-3.9 0-6.2-1.4-2.3-4-3.3-5.6-2z"/>
			</svg>
			<span id="gitlink">Github : FilmNote</span>
		</div>
	</a>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js" target="_blank"></script>
<script type="text/javascript" src="./js/index.js"></script>

</body>
</html>
