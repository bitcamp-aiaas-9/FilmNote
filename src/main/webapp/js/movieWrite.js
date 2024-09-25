// FilmNote/src/main/webapp/js/movieWrite.js

$(function() {
	document.getElementById('movie-write').style.background = '#DEC5D2';

    $('#movie-board').hover(
        function() {
        	// 현재 항목 스타일 변경
            $(this).css('background', '#DEC5D2');

            // movie-write의 배경색을 초기화 
            $('#movie-write').css('background', 'transparent');
        },
        function() {
            // movie-board에서 마우스가 나갈 때 movie-write 배경색 복구
            $('#movie-write').css('background', '#DEC5D2');
            $('#movie-board').css('background', 'transparent');
        }
    );
});