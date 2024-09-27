// FilmNote/src/main/webapp/js/movieWrite.js

$(function() {
	document.getElementById('movie-write-menu').style.background = '#DEC5D2';

    $('#movie-list-menu').hover(
        function() {
        	// 현재 항목 스타일 변경
            $(this).css('background', '#DEC5D2');

            // movie-write의 배경색을 초기화 
            $('#movie-write-menu').css('background', 'transparent');
        },
        function() {
            // movie-list-menu에서 마우스가 나갈 때 movie-write 배경색 복구
            $('#movie-write-menu').css('background', '#DEC5D2');
            $('#movie-list-menu').css('background', 'transparent');
        }
    );
	
	
	$('#movie-write-btn').click(function(event){
		event.preventDefault(); // 폼 제출 방지
		
		let movieCode = $('#movieCode').val().trim();
		let movieTitle = $('#movieTitle').val().trim();
		let movieDirector = $('#movieDirector').val().trim();
		let movieGenre = $('#movieGenre').val().trim();
		let movieReleaseDate = $('#movieReleaseDateDiv').val().trim();
		let movieRating = $('#movieRating').val().trim();
		let movieScore = $('#movieScore').val().trim();
		let movieSynopsis = $('#movieSynopsis').val().trim();
		
		
		// 오류 메시지 초기화 및 숨김
		$('.validation').hide();
		
		
		// 영화 코드
		if ( movieCode === ''){
		    $('#movieCode').html('영화 코드를 입력하세요').show();
		    isValid = false;
		}
		
		// 영화 제목
		if ( movieTitle === ''){
		    $('#movieTitle').html('영화 제목을 입력하세요').show();
		    isValid = false;
		}
		
		// 영화 감독
		if ( movieDirector === ''){
		    $('#movieDirector').html('영화 감독을 입력하세요').show();
		    isValid = false;
		}
		
		// 영화 장르
		if ( movieGenre === ''){
		    $('#movieGenre').html('영화 장르를 입력하세요').show();
		    isValid = false;
		}
		
		// 영화 개봉일
		if ( movieReleaseDate === ''){
		    $('#movieReleaseDate').html('영화 개봉일을 입력하세요').show();
		    isValid = false;
		}
		
		// 영화 관람가
		if ( movieRating === ''){
		    $('#movieRating').html('영화 관람가를 입력하세요').show();
		    isValid = false;
		}
		
		// 영화 평점
		if ( movieScore === ''){
		    $('#movieScore').html('영화 평점을 입력하세요').show();
		    isValid = false;
		}
		
		// 영화 줄거리
		if ( movieSynopsis=== ''){
		    $('#movieSynopsis').html('영화 줄거리를 입력하세요').show();
		    isValid = false;
		}
		
		// 영화 포스터
		if ( moviePoster=== ''){
		    $('#moviePoster').html('영화 포스터를 등록하세요').show();
		    isValid = false;
		}
		
		
		
		
		
		
		
	});
	
	
	
	
	
	
});