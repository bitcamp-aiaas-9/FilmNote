// FilmNote/src/main/webapp/js/reviewView.js
// 유효성 검사
function checkReview() {
	console.log('checkReview() 함수');
	let isOk = false;
	// 1. 리뷰 작성 확인
	let reveiewText = $('#new-review').val()
	console.log('리뷰: ' + reveiewText);
	// 2. 별점 선택 확인
	let scoreText = $('#scoreText').text();
	console.log('별점: ' + scoreText);
	
	if(reveiewText == '') alert('리뷰를 작성하세요.');
	else if(scoreText == '0') alert('별점을 선택하세요.');
	else isOk = true;
	return isOk;
}

// 별점 선택
function selectScore(selectScore, alreadySelect) {
	let scoreNum = selectScore.data('score');
	console.log('selectScore() 함수 호출');
	console.log('클릭 이전 Score: ' + alreadySelect + ", 클릭 후 Score: " + scoreNum);

	// 초기화
	$('.score').each(function(){
		$(this).text('☆').css('color', 'black');
	});
	$('#scoreText').text('0');
	
	if(alreadySelect != scoreNum || alreadySelect == '0') {
		// 별점 Text
		$('#scoreText').text(scoreNum);
		
		// 별 색칠하기 
		$('.score').each(function(){
			if($(this).data('score') <= scoreNum) { 
				$(this).text('★').css('color', '#FFBF29');
			}
		 });
	}
}

// 리뷰 전송
function writeReview() {
	alert($('#reviewTotalNum').text() + " " + $('#movieAvgScore').text())
	$.ajax({
		type : 'post',
		url : '/FilmNote/review/reviewViewDB.do',
		data : {
			'content': $('#new-review').val(),
			'score': $('#scoreText').text(),
			'user_id': $('#post-comment').data('uid'),
			'movie_code': $('#movietitle').data('moviecode'),
			'reviewTotalNum' : $('#reviewTotalNum').text(),
			'movieAvgScore' : $('#movieAvgScore').text()
		},
		success: function() {
			alert('리뷰가 작성되었습니다.');
			location.reload();
		},
		error: function(e) {
			console.log(e);
		}
	})
}

$(function() {
	// 로그인 여부 확인
	if($('#post-comment').data('uid') != '') { // 로그인 
		// 평점	
		$('.score').click(function() {
			selectScore($(this), $('#scoreText').text());
		});
		
		// 리뷰 전송
		$('#submit-review').click(function() {
			if(checkReview()) writeReview();
		});
	} else {
		$('#new-review').prop('readonly', true).val('로그인 하세요.');
		$('#submit-review').click		(function() {
			alert('로그인 후 이용 가능합니다.');
		});
	}
})