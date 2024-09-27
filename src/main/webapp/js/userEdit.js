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

	if ($('#nowupwd').val().trim() === '') {

		$('#nowupwdDiv').html('비밀번호를 입력해주세요').css('color', 'red');;
		isValid = false;
	} else {
		if ($('#upwd').val().trim() === '') {
			$('#upwdDiv').html('수정할 비밀번호를 입력해주세요').css('color', 'red');
			isValid = false;
		}
		if ($('#upwd').val() !== $('#reupwd').val()) {
			$('#upwdDiv').html('췤!').css('color', 'red');
			isValid = false;
		}
	}

	return isValid;
}

//회원정보수정
$('#userEditBtn').click(function() {
	if (userEdit()) {
		let nowupwd = $('#nowupwd').val();
		let uid = $('#uid').val();

		//현재 비밀번호 확인용 AJax
		$.ajax({
			type: 'POST',
			url: '/FilmNote/user/userPwdCheck.do', //비밀번호 확인용 URL
			data: { uid: uid, nowupwd: nowupwd },
			success: function(response) {
				if (response.valid) { //비밀번호가 일치한다면
					let serializedData = $('#userEditForm').serialize();

					//회원정보 수정 AJax
					$.ajax({
						type: 'post',
						url: '/FilmNote/user/userEditDB.do',
						data: serializedData,
						contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
						success: function(response) {
							console.log('Response:', response);
							alert('회원정보 수정완료');
							location.href = '/FilmNote/index.do';
						},
						error: function(e) {
							console.log(e);
						}
					});
				} else {
					$('#nowupwdDiv').html('현재 비밀번호가 일치하지 않습니다.').css('color', 'red');
					$('#nowupwd').focus();
				}
			}, error: function(e) {
				console.log('Password check error:', e);
			}
		});
	}
});

//회원탈퇴 
$('#withdrawBtn').click(function() {
	window.location.href = '/FilmNote/user/userWithdraw.do';
});
