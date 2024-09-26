// FilmNote/src/main/webapp/js/userWithdraw.js
$('#WithdrawBtn').on('click', function() {
       if (confirm('정말로 탈퇴하시겠습니까?')) {
           $.ajax({
               url: '/FilmNote/userWithdraw.do',
               type: 'POST',
               success: function(response) {
                   if (response === 'success') {
                       alert('회원탈퇴 완료');
                       location.href = '/FilmNote/index.do';
                   } else {
                       alert('오류');
                   }
               },
               error: function(xhr, status, error) {
                   alert('서버와의 통신 중 오류가 발생했습니다.');
                   console.error(error);
               }
           });
       }
   });