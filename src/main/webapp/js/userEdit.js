// FilmNote/src/main/webapp/js/userEdit.js

//이메일
$('#emailSelect').change(function() {
	$('#email2').val($('#emailSelect').val());
});


//유효성 검사 함수
function userEdit() {
    let isValid = true;
    $('#unameDiv').empty();
    $('#uidDiv').empty();
    $('#upwdDiv').empty();
    $('#reupwdDiv').empty();

    if ($('#uname').val().trim() === '') {
		$('#unameDiv').html('이름!');
        isValid = false;
    }

    if ($('#uid').val().trim() === '') {
		$('#uidDiv').html('아이디!');
        isValid = false;
    }

    if ($('#upwd').val().trim() === '') {
		$('#upwdDiv').html('비밀번호!');
        isValid = false;
    }

    if ($('#reupwd').val().trim() === '') {
		$('#reupwdDiv').html('비밀번호 췤!');
        isValid = false;
    } else if ($('#upwd').val() !== $('#reupwd').val()) {
		$('#upwdDiv').html('췤!');
        isValid = false;
    }

    return isValid;
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