$(document).ready(function() {
    // 로그인 버튼 클릭 이벤트
    $('#loginBtn').click(function(e) {
        e.preventDefault();
        clearMessages(); // 기존 경고 메시지 숨기기
        if (validateForm()) {
            $('#loginForm').submit(); // 폼 제출
        }
    });

    // Admin 버튼 클릭 이벤트
    $('#adminBtn').click(function(e) {
        e.preventDefault();
        window.location.href = $(this).attr('onclick').replace('location.href=', '').replace(/'/g, '');
    });

    // focusout 이벤트 추가
    $('#loginId, #loginPwd').on('focusout', function() {
        validateField($(this));
    });

    function validateForm() {
        let isValid = true;
        let warningMessage = ''; // 경고 메시지

        // 로그인 폼 전체 검증
        if ($('#loginId').val() === '' || $('#loginPwd').val() === '') {
            warningMessage = '아이디와 비밀번호를 모두 입력하세요.';
            isValid = false;
        }

        if (!isValid) {
            showWarningMessage(warningMessage); // 경고 메시지 표시
        }

        return isValid;
    }

    function validateField(field) {
        let warningMessage = '';
        if (field.attr('id') === 'loginId' && field.val() === '') {
            warningMessage = '아이디를 입력하세요.';
        } else if (field.attr('id') === 'loginPwd' && field.val() === '') {
            warningMessage = '비밀번호를 입력하세요.';
        }

        if (warningMessage !== '') {
            showWarningMessage(warningMessage);
        }
    }

    // 경고 메시지 표시 함수
    function showWarningMessage(message) {
        $('#loginWarningMessage').html(message).css('color', '#e74c3c').show(); // 경고: 빨간색
    }

    // 경고 메시지 숨기기 함수
    function clearMessages() {
        $('#loginWarningMessage').hide();
    }
});
