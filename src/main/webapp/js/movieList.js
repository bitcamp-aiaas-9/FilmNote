// FilmNote/src/main/webapp/js/movieList.js

// 페이지 이동
function moviePaging(pg) {
	const searchOpt = $('.search-opt').val();
	const searchValue = $('#title-box').val();
	console.log("searchOpt:", searchOpt);
	console.log("searchValue:", searchValue);
	if (!searchValue) {
		// 검색 조건이 없을 경우 기본 페이지로 이동
		location.href = "/FilmNote/admin/movieList.do?pg=" + pg;
	} else {
		// 검색 조건이 있을 경우 해당 페이지의 영화 목록 로드
		loadMovies(pg);
	}
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
	$('.subject-a').click(function() {
		let mcode = $(this).parent().prev().text().trim();
		// $(this).parent() :  <a> 태그의 부모 요소인 <td>에 접근
		// parent().prev() : 부모 요소(현재 <td> 태그) 바로 앞의 형제 요소, 즉 mcode 값이 있는 <td>에 접근
		// .text() : 그 <td> 태그의 텍스트, 즉 mcode 값을 가져옴
		// trim() : mcode 값을 가져올 때 따라오는 공백 제거 - 안해주면 mcode 앞에 %20 이 붙음

		let pg = $('#pg').val();

		location.href = "/FilmNote/admin/movieView.do?mcode=" + mcode + '&pg=' + pg;
		// ${pageContext.request.contextPath }
	});

	// 영화 삭제
	$('#deleteBtn').click(function() {
		let selectedMovies = [];
		$('input[name="mcodes"]:checked').each(function() {
			selectedMovies.push($(this).val());
		});

		if (selectedMovies.length === 0) {
			alert("1개 이상의 영화를 선택하세요.");
			return;
		}

		$.ajax({
			url: context + '/admin/movieDeleteDB.do',
			type: 'POST',
			data: {
				mcodes: selectedMovies
			},
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
});





// 전역 변수로 현재 페이지 상태 관리
let currentPage = 1;

// 페이지 로드 함수
function loadMovies(page) {
    currentPage = page; // 현재 페이지 업데이트
    $('#pg').val(currentPage); 
    const searchOpt = $('.search-opt').val();
    const searchValue = $('#title-box').val();

    let url = context + '/admin/movieSearchDB.do';
    let data = { pg: currentPage };

    // 검색 조건이 있을 경우 데이터에 추가
    if (searchOpt && searchValue) {
        data.searchOpt = searchOpt;
        data.searchValue = searchValue;
    }

    $.ajax({
        url: url,
        type: 'GET',
        data: data,
        success: function(data) {
            $('#movieTableBody').empty(); // 기존 데이터 제거
            data.movies.forEach(function(movieDTO) {
                $('#movieTableBody').append(`
                    <tr>
                        <td style="display:none;">${movieDTO.mcode}</td> <!-- mcode를 숨김 -->
                        <td align="center"><input type="checkbox" name="mcodes" class="board-list-check" value="${movieDTO.mcode}" /></td>
                        <td align="left"><a href="#" class="subject-a">${movieDTO.title}</a></td>
                        <td align="center">${movieDTO.director}</td>
                        <td align="center">${movieDTO.rating}세</td>
                    </tr>
                `);
            });
            $('#page-block').html(data.pagingHTML); // 페이징 HTML 업데이트
            $('#pg').val(currentPage); 
        },
        error: function() {
            // 검색어가 비어있을 경우 전체 영화를 로드
            if (!searchOpt && !searchValue) {
                alert('검색어가 없습니다. 전체 영화를 보여줍니다.');
                loadMovies(1); // 전체 영화 로드
            } else {
                alert('검색할 단어를 입력해주세요.');
            }
        }
    });
}

// 검색 버튼 클릭 이벤트 핸들러
$('#searchBtn').click(function() {
    currentPage = 1; // 검색할 때마다 현재 페이지를 1로 초기화
    loadMovies(currentPage); // 첫 페이지에서 검색
});

// 게시판 제목 클릭했을 때 (동적으로 바인딩)
$(document).on('click', '.subject-a', function() {
    let mcode = $(this).closest('tr').find('td:first').text().trim(); // 숨겨진 td에서 mcode 가져오기
    console.log("mcode:", mcode); // 확인용 로그
    let pg = $('#pg').val();

    if (!mcode) {
        alert("영화 코드(mcode)가 비어 있습니다. 다시 시도해주세요.");
        return; // mcode가 비어있으면 실행 중지
    }

    location.href = "/FilmNote/admin/movieView.do?mcode=" + mcode + '&pg=' + pg;
});

