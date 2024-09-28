// FilmNote/src/main/webapp/js/movieList.js

// 페이지 이동
function moviePaging(pg) {
	location.href=context + '/admin/movieList.do?pg=' + pg;
}

$(function() {
	document.getElementById('movie-list-menu').style.background = '#DEC5D2';

    $('#movie-write-menu').hover(
        function() {
        	// 현재 항목 스타일 변경
            $(this).css('background', '#DEC5D2');

            // movie-list-menu의 배경색을 초기화 
            $('#movie-list-menu').css('background', 'transparent');
        },
        function() {
            // movie-write-menu에서 마우스가 나갈 때 movie-list-menu 배경색 복구
            $('#movie-list-menu').css('background', '#DEC5D2');
            $('#movie-write-menu').css('background', 'transparent');
        }
    );
	

	// 전체 선택 / 전체 해제 이벤트를 동적으로 바인딩
	$(document).on('change', '#all_check', function() {
	    let isChk = $(this).is(':checked');
	    // 전체 선택 체크박스 상태에 따라 모든 체크박스 상태 변경
	    $('.board-list-check').prop('checked', isChk);
	});

	// 개별 체크박스 상태에 따른 전체 선택 체크박스 상태 업데이트
	$(document).on('change', '.board-list-check', function() {
	    let total = $('.board-list-check').length; // 전체 체크박스 수
	    let checked = $('.board-list-check:checked').length; // 체크된 체크박스 수
	    // 체크된 체크박스 수가 전체 체크박스 수와 같으면 전체 선택 체크박스 체크
	    $('#all_check').prop('checked', total === checked);
	});	
	
	// 게시판 제목 클릭했을 때
	$('.subject-a').click(function(){
		let mcode = $(this).parent().prev().text().trim();
		// $(this).parent() :  <a> 태그의 부모 요소인 <td>에 접근
		// parent().prev() : 부모 요소(현재 <td> 태그) 바로 앞의 형제 요소, 즉 mcode 값이 있는 <td>에 접근
		// .text() : 그 <td> 태그의 텍스트, 즉 mcode 값을 가져옴
		// trim() : mcode 값을 가져올 때 따라오는 공백 제거 - 안해주면 mcode 앞에 %20 이 붙음
		
		let pg = $('#pg').val();
		
		location.href = context + '/admin/movieView.do?mcode=' + mcode + '&pg=' + pg;
		// ${pageContext.request.contextPath }
	});
	
	// movieList.js
	// 영화 삭제
	$('#deleteBtn').click(function() {
		// 체크된 mcode들을 배열로 가져오기
	    let mcodeArray = [];
	    $('input[name="mcode"]:checked').each(function() {
	        mcodeArray.push($(this).val().trim());
	    });

		if (mcodeArray.length === 0) {
		    alert("삭제할 영화를 선택하세요.");
		    return;
		}

	    $.ajax({
	        url: context + '/admin/movieDeleteDB.do',
	        type: 'POST',
	        data: {mcode: mcodeArray},
	        traditional: true,  // 배열 데이터를 서버에 전송할 때 필요한 설정
	        success: function() {
	            alert('영화가 삭제되었습니다.');
	            location.reload(); // 페이지 새로고침
	        },
	        error: function() {
	            alert('영화 삭제에 실패했습니다.');
	        }
	    });
	});

	
	
	
	
	
	// 영화 검색
	$('#searchBtn').click(function() {
	    const searchOpt = $('.search-opt').val();
	    const searchValue = $('#title-box').val();
	    
	    $.ajax({
	        url: context + '/admin/movieSearchDB.do',
	        type: 'GET',
	        data: {
	            searchOpt: searchOpt,
	            searchValue: searchValue
	        },
	        success: function(data) {
	            // 검색 결과를 테이블에 동적으로 업데이트
	            $('#movieTableBody').empty(); // 기존 테이블 <tbody> 데이터 제거
	            data.forEach(function(movie) {
	                $('#movieTableBody').append(`
	                    <tr>
	                        <td align="center"><input type="checkbox" name="mcodes" class="board-list-check" value="${movieDTO.mcode}" /></td>
	                        <td align="left"><a href="#" class="subject-a">${movieDTO.title}</a></td>
	                        <td align="center">${movieDTO.genre}</td>
	                        <td align="center">${movieDTO.release_date}</td>
	                    </tr>
	                `);
	            });
	        },
	        error: function() {
	            alert('영화 검색에 실패했습니다.');
	        }
	    });
	});
	
	
});