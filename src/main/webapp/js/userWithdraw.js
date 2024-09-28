$(document).ready(function() {
    $('#withdrawBtn').prop('disabled', true);

    // 체크박스 상태에 따라 버튼 활성화/비활성화
    $('#withdrawbox').change(function() {
        console.log("Checkbox state changed:", this.checked); // 체크박스 상태 로그
        $('#withdrawBtn').prop('disabled', !this.checked);
    });

    $('#withdrawBtn').click(function() {
        // 비밀번호 입력 확인
        if ($('#nowpwd').val().trim() === '') {
            $('#nowupwdDiv').html('비밀번호를 입력해주세요').css('color', 'red');
            $('#nowpwd').focus();
            return; // 함수 종료
        }

        // 체크박스가 선택되지 않은 경우 경고 메시지
        if (!$('#withdrawbox').is(':checked')) {
            alert('안내 사항에 동의해야 탈퇴할 수 있습니다.');
            return; // 함수 종료
        }

        // 확인 후 AJAX 호출
        if (confirm('그래도 탈퇴하시겠습니까?')) {
            $.ajax({
                url: '/FilmNote/user/userWithdrawDB.do',
                type: 'POST',
                data: {
                    nowpwd: $('#nowpwd').val().trim() // 비밀번호 전송
                },
                success: function(response) {
                    console.log('Response from server:', response);
                    if (response.trim() === 'success') {
						alert("회원탈퇴 성공")
                        location.href = '/FilmNote/index.do';
                    } else {
                        alert('오2류: ' + response);
                    }
                },
                error: function(xhr, status, error) {
                    console.log('Error details:', xhr, status, error);
                    alert('서버와의 통신 중 오류가 발생했습니다.');
                }
            });
        }
    });
});