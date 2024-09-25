$(document).ready(function() {
    // 회원가입 버튼 클릭 이벤트
    $('#signUpBtn').click(function(e) {
        e.preventDefault();
        if (validateForm()) {
            $('#signUpForm').submit();
        }
    });

    // 이메일 도메인 자동 입력 기능
    $('#emailSelect').change(function() {
        $('#emailDomain').val($('#emailSelect').val());
    });

    // focusout 이벤트 추가 - 필드에서 포커스가 벗어날 때 유효성 검사
    $('#name, #pwd, #repwd, #birth, #birthMonth, #birthDay, #email, #emailDomain, #tel2, #tel3').on('focusout', function() {
        console.log('focusout event triggered for:', $(this).attr('id'));
        validateField($(this));
    });

    // 필드 검증 함수
    function validateField(field) {
        let id = field.attr('id');
        let value = field.val();
        let messages = {
            'name': '이름을 입력하세요',
            'id': '아이디를 입력하세요',
            'pwd': '비밀번호를 입력하세요',
            'repwd': '비밀번호를 재확인하세요',
            'birth': '생년월일을 입력하세요',
            'birthMonth': '생년월일을 입력하세요',
            'birthDay': '생년월일을 입력하세요',
            'email': '이메일을 입력하세요',
            'emailDomain': '이메일 도메인을 선택하세요',
            'tel2': '휴대전화 앞자리 입력하세요',
            'tel3': '휴대전화 뒷자리 입력하세요'
        };

        if (value === '') {
            $('#' + id + 'Div').html(messages[id]).css('color', 'red').css('display', 'block');
        } else {
            $('#' + id + 'Div').html('').css('display', 'none');
        }
    }

    // 폼 유효성 검증 (모든 필드 검증)
    function validateForm() {
        let isValid = true;

        // 필수 입력 필드 검증
        $('#name, #id, #pwd, #repwd, #birth, #birthMonth, #birthDay, #email, #emailDomain, #tel2, #tel3').each(function() {
            if ($(this).val() === '') {
                validateField($(this)); // 개별 필드 검증
                isValid = false; // 하나라도 비어 있으면 false
            }
        });

        // 비밀번호와 비밀번호 확인 일치 여부 확인
        if ($('#pwd').val() != $('#repwd').val()) {
            $('#pwdDiv').html('비밀번호가 일치하지 않습니다.').css('color', 'red').css('display', 'block');
            isValid = false;
        }

        // 아이디 중복 체크 여부 확인
        if ($('#id').val() != $('#check').val()) {
            $('#idDiv').html('중복 체크를 하세요.').css('color', 'red').css('display', 'block');
            isValid = false;
        }

        return isValid;
    }
});
