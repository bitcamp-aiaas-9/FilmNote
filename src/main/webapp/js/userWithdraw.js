// FilmNote/src/main/webapp/js/userWithdraw.js
$('#withdrawBtn').on('click', function() {
       if (confirm('그래도 탈퇴하시겠습니까?')) {
           $.ajax({
               url: '/FilmNote/user/userWithdrawDB.do',
               type: 'POST',
               success: function(response) {

				console.log('Response from server:', response); // 서버 응답 확인
                   if (response === 'success') {
                       alert('회원탈퇴 완료');
                       location.href = '/FilmNote/index.do';
                   } else {
                       alert('오류');
                   }
               },
               error: function(xhr, status, error) {
				console.log('Error details:', xhr, status, error); // 오류 세부 사항 확인
                   alert('서버와의 통신 중 오류가 발생했습니다.');
                   console.error(error);
               }
           });
       }
   });