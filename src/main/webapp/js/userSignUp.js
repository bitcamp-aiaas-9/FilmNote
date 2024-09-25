$(document).ready(function() {
    // 회원가입 버튼 클릭 이벤트
    $('#signUp').click(function(e) {
        // 유효성 검사를 수행하되, 폼 제출을 막지 않음
        validateForm();

        // uid 값 확인 및 콘솔 출력
        let uid = $('#uid').val();
        if (!uid) {
            console.log("Error: uid is missing");
        } else {
            console.log("uid value: " + uid);
        }
    });

    // 이메일 도메인 자동 입력 기능
    $('#emailSelect').change(function() {
        $('#email2').val($('#emailSelect').val());
    });

    // focusout 이벤트 추가 - 필드에서 포커스가 벗어날 때 유효성 검사
    $('#uname, #uid, #upwd, #repwd, #gender, #birth1, #birth2, #birth3, #email1, #email2, #tel1, #tel2, #tel3').on('focusout', function() {
        validateField($(this));
    });

    // 필드 검증 함수
    function validateField(field) {
        let id = field.attr('id');
        let value = field.val().trim();
        let messages = {
            'uname': '이름을 입력하세요.',
            'uid': '아이디를 입력하세요.',  // uid 필드에 대한 경고 메시지 추가
            'upwd': '비밀번호를 입력하세요.',
            'repwd': '비밀번호를 재확인하세요.',
            'gender': '성별을 선택하세요.',
            'birth1': '생년을 입력하세요.',
            'birth2': '생월을 입력하세요.',
            'birth3': '생일을 입력하세요.',
            'email1': '이메일을 입력하세요.',
            'email2': '이메일 도메인을 입력하세요.',
            'tel2': '휴대전화 중간 번호를 입력하세요.',
            'tel3': '휴대전화 마지막 번호를 입력하세요.'
        };

        // 필수 입력 필드 유효성 검사
        if (id === 'gender') {
            if (!$('input[name="gender"]:checked').val()) {
                $('#genderDiv').html(messages[id]).css('color', 'red').css('display', 'block');
            } else {
                $('#genderDiv').html('').css('display', 'none');
            }
            return;
        }

        if (value === '') {
            $('#' + id + 'Div').html(messages[id]).css('color', 'red').css('display', 'block');
        } else {
            // 비밀번호 필드 유효성 검사 추가
            if (id === 'upwd') {
                if (!validatePassword(value)) {
                    $('#' + id + 'Div').html('비밀번호는 영어 대소문자, 숫자, 특수문자 1가지씩은 포함되어야 합니다.').css('color', 'red').css('display', 'block');
                } else {
                    $('#' + id + 'Div').html('').css('display', 'none');
                }
            } else if (id === 'repwd') {
                if (value !== $('#upwd').val()) {
                    $('#' + id + 'Div').html('비밀번호가 일치하지 않습니다.').css('color', 'red').css('display', 'block');
                } else {
                    $('#' + id + 'Div').html('').css('display', 'none');
                }
            } else {
                $('#' + id + 'Div').html('').css('display', 'none');
            }
        }
    }

    // 비밀번호 검증 함수
    function validatePassword(password) {
        // 영어 대소문자 중 1개, 숫자 1개, 특수문자 1개 포함
        const regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{1,}$/;
        return regex.test(password);
    }

    // 폼 유효성 검증 (모든 필드 검증)
    function validateForm() {
        $('#uname, #uid, #upwd, #repwd, #gender, #birth1, #birth2, #birth3, #email1, #email2, #tel1, #tel2, #tel3').each(function() {
            validateField($(this)); // 각 필드를 유효성 검사
        });
    }
});
