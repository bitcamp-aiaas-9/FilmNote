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
		let serializedData =$('#userEditForm').serialize();
		
		console.log('Data : ', serializedData);
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
	}
});