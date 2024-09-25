// FilmNote/src/main/webapp/js/userEdit.js

//이메일
function change(){
	document.getElementById("email2").value = document.getElementById("email3").value;
}


//회원정보수정
$('#userEditBtn').click(function(){
	$('#upwd').empty();
	
	if($('#upwd').val() == '')
		$('#upwdDiv').html('비밀번호 입력');
	else if($('#upwd').val() != $('#reupwd').val())
		$('#upwdDiv').html('비밀번호가 맞지 않습니다.')
	
	else
	$.ajax({
		type:'post',
		url:'/FilmNote/user/userEdit.do',
		data:$('form[name="userEditForm"]').serialize(),
		success:function(){
			alert('회원정보 수정완료');
			location.href='FilmNote/index.do';
		},
		error:function(e){
			console.log(e);
		}
	});
});