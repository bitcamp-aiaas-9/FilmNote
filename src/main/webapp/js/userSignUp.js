$(document).ready(function() {
    // 회원가입 버튼 클릭 이벤트
    $('#signUp').click(function(e) {
        e.preventDefault(); // 폼 제출 막기
        if (validateForm()) {
            $.ajax({
                url: $('#signUpForm').attr('action'),
                type: 'POST',
                data: $('#signUpForm').serialize(),
                success: function(response) {
                    if (response.status === "success") {
                        showModal(response.message, function() {
                            window.location.href = contextPath + '/user/userSignInDB.do';
                        });
                    } else {
                        showModal('회원가입 중 오류가 발생했습니다');
                    }
                },
                error: function() {
                    showModal('회원가입 중 오류가 발생했습니다');
                }
            });
        }
    });

    // 이메일 도메인 자동 입력 기능
    $('#emailSelect').change(function() {
        $('#email2').val($('#emailSelect').val());
    });

    // ID 입력 필드 focusout 이벤트
    $('#uid').on('focusout', function() {
        let uid = $(this).val().trim();
        if (uid === '') {
            $('#uidDiv').html('아이디를 입력하세요.').css('color', 'red');
        } else {
            checkIdDuplicate(uid);
        }
    });

    // 비밀번호 입력 필드 focusout 이벤트
    $('#upwd').on('focusout', function() {
        validateField($(this));
    });

    // 비밀번호 확인 입력 필드 focusout 이벤트
    $('#repwd').on('focusout', function() {
        validateField($(this));
    });

    function checkIdDuplicate(uid) {
        console.log("Checking ID: " + uid); // 디버깅을 위한 콘솔 로그 추가
        $.ajax({
            url: contextPath + '/user/checkId.do',
            type: 'POST',
            data: { uid: uid },
            success: function(response) {
                console.log("Response: ", response); // 디버깅을 위한 콘솔 로그 추가
                if (response.exists) {
                    console.log("ID exists: true"); // 디버깅을 위한 콘솔 로그 추가
                    $('#uidDiv').html('존재하는 아이디 입니다').css('color', 'purple');
                } else {
                    console.log("ID exists: false"); // 디버깅을 위한 콘솔 로그 추가
                    $('#uidDiv').html('사용 가능한 아이디 입니다').css('color', 'green');
                }
            },
            error: function(xhr, status, error) {
                console.log("Error: ", error); // 디버깅을 위한 콘솔 로그 추가
                $('#uidDiv').html('ID 체크 중 오류가 발생했습니다').css('color', 'red');
            }
        });
    }

    // 필드 검증 함수
    function validateField(field) {
        let id = field.attr('id');
        let value = field.val().trim();
        let messages = {
            'uid': '아이디를 입력하세요.',  // uid 필드에 대한 경고 메시지 추가
            'upwd': '비밀번호를 입력하세요.',
            'repwd': '비밀번호를 재확인하세요.'
        };

        if (value === '') {
            $('#' + id + 'Div').html(messages[id]).css('color', 'red').css('display', 'block');
            return false;
        } else {
            // 비밀번호 필드 유효성 검사 추가
            if (id === 'upwd') {
                if (!validatePassword(value)) {
                    $('#' + id + 'Div').html('비밀번호는 영어 대소문자, 숫자, 특수문자 1가지씩은 포함되어야 합니다.').css('color', 'red').css('display', 'block');
                    return false;
                } else {
                    $('#' + id + 'Div').html('올바른 비밀번호 형식입니다.').css('color', 'green').css('display', 'block');
                    return true;
                }
            } else if (id === 'repwd') {
                if (value !== $('#upwd').val()) {
                    $('#' + id + 'Div').html('비밀번호가 일치하지 않습니다.').css('color', 'red').css('display', 'block');
                    return false;
                } else {
                    $('#' + id + 'Div').html('비밀번호가 일치합니다.').css('color', 'green').css('display', 'block');
                    return true;
                }
            } else {
                $('#' + id + 'Div').html('').css('display', 'none');
                return true;
            }
        }
    }

    // 비밀번호 검증 함수
    function validatePassword(password) {
        // 영어 대소문자 중 1개, 숫자 1개, 특수문자 1개 포함
        const regex = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*(),.?":{}|<>]).{1,}$/;
        return regex.test(password);
    }

    // 폼 유효성 검증 (아이디와 비밀번호 필드만 검증)
    function validateForm() {
        let isValid = true;
        let firstInvalidField = null;

        $('#uid, #upwd, #repwd').each(function() {
            if (!validateField($(this))) {
                isValid = false;
                if (!firstInvalidField) {
                    firstInvalidField = $(this);
                }
            }
        });

        if (!isValid && firstInvalidField) {
            showModal('필수 입력값을 입력하세요.', function() {
                firstInvalidField.focus();
            });
        }

        return isValid;
    }

    // 모달 표시 함수
    function showModal(message, callback) {
        $('#dialogMessage').text(message);
        $('#dialog').dialog({
            modal: true,
            buttons: {
                "Login": function() {
                    $(this).dialog("close");
                    if (typeof callback === 'function') {
                        callback();
                    }
                }
            }
        });
    }
});