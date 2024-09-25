// FilmNote/src/main/webapp/js/userEdit.js

//이메일
$('#emailSelect').change(function() {
	$('#email2').val($('#emailSelect').val());
});


//유효성 검사 함수
function userEdit() {
    let isValid = true;
    $('#nameDiv').empty();
    $('#uidDiv').empty();
    $('#upwdDiv').empty();
    $('#reupwdDiv').empty();

    // 이름 검사
    if ($('#name').val().trim() === '') {
        displayError('nameDiv', '이름 입력이 필요합니다.');
        isValid = false;
    }

    // 아이디 검사
    if ($('#uid').val().trim() === '') {
        displayError('uidDiv', '아이디 입력이 필요합니다.');
        isValid = false;
    }

    // 비밀번호 검사
    if ($('#upwd').val().trim() === '') {
        displayError('upwdDiv', '비밀번호 입력이 필요합니다.');
        isValid = false;
    }

    // 비밀번호 확인 검사
    if ($('#reupwd').val().trim() === '') {
        displayError('reupwdDiv', '비밀번호 확인이 필요합니다.');
        isValid = false;
    } else if ($('#upwd').val() !== $('#reupwd').val()) {
        displayError('upwdDiv', '비밀번호가 일치하지 않습니다.');
        isValid = false;
    }

    return isValid;  // 모든 검사 후 isValid 반환
}

//회원정보수정
$('#userEditBtn').click(function() {
	if (userEdit()) {
		$.ajax({
			type: 'post',
			url: '/FilmNote/user/userEdit.do',
			data: $('form[name="userEditForm"]').serialize(),
			success: function() {
				alert('회원정보 수정완료');
				location.href = '/FilmNote/index.do';
			},
			error: function(e) {
				console.log(e);
			}
		});
	}
});

//회원탈퇴

$('#WithdrawBtn').click(function() {
	location.href = 'FilmNote/userWithdraw.do';
});