$(document).ready(function() {
    // 로그인 버튼 클릭 이벤트
    $('#adminLoginBtn').click(function(e) {
        e.preventDefault();
        if (validateForm()) {
            $('#adminLoginForm').submit();
        }
    });

    // focusout 이벤트 추가
    $('#adminId, #adminPwd').on('focusout', function() {
        validateField($(this));
    });

    function validateForm() {
        let isValid = true;

        if ($('#adminId').val() == '' && $('#adminPwd').val() == '') {
            $('#adminLoginErrorDiv').html('아이디와 비밀번호를 입력하세요').css('color', 'red');
            isValid = false;
        } else {
            $('#adminLoginErrorDiv').html('');
            if ($('#adminId').val() == '') {
                $('#adminIdDiv').html('아이디를 입력하세요').css('color', 'red');
                isValid = false;
            } else {
                $('#adminIdDiv').html('');
            }
            if ($('#adminPwd').val() == '') {
                $('#adminPwdDiv').html('비밀번호를 입력하세요').css('color', 'red');
                isValid = false;
            } else {
                $('#adminPwdDiv').html('');
            }
        }

        return isValid;
    }

    function validateField(field) {
        if (field.attr('id') == 'adminId' && field.val() == '') {
            $('#adminIdDiv').html('아이디를 입력하세요').css('color', 'red');
        } else if (field.attr('id') == 'adminId') {
            $('#adminIdDiv').html('');
        }

        if (field.attr('id') == 'adminPwd' && field.val() == '') {
            $('#adminPwdDiv').html('비밀번호를 입력하세요').css('color', 'red');
        } else if (field.attr('id') == 'adminPwd') {
            $('#adminPwdDiv').html('');
        }
    }
});