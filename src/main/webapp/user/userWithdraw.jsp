<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="../image/film_favicon.png" type="image/png">
    <link rel="stylesheet" href="../css/userWithdraw.css">
    <title>회원 탈퇴</title>
</head>
<body>
	<jsp:include page="../common/header.jsp" />
    <div class="container">
        <h2>회원 탈퇴 안내</h2>
        <p>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
        
        <div class="notice">
            <h3>주의 사항</h3>
            <ul>
                <li>사용하고 계신 아이디 (<strong class="strong">${userDTO.uid }</strong>) 는 탈퇴할 경우 재사용 및 복구가 불가능합니다. <br>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</li>
                <li>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다. <br>회원정보 및 메일, 블로그, 주소록 등 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. <br>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.</li>
            </ul>
        </div>
        
        <div class="services">
            <h3>삭제되는 내용</h3>
            <ul>
                <li>메일: 메일 계정 및 보관 중인 메일 삭제</li>
                <li>블로그: 블로그 계정 및 게시물 삭제</li>
                <li>포스트: 포스트 계정 및 게시물 삭제</li>
                <li>VIBE: '좋아요'한 콘텐츠, 내 플레이리스트, 저장한 곡 등 유저 이용 기록 삭제</li>
                <li>modoo!(모두): 등록된 홈페이지 및 게시물 삭제</li>
            </ul>
        </div>

        <div class="additional-info">
            <h3>게시판형 서비스 관련</h3>
            <p>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다. 삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</p>
        </div>

        <div class="final-warning">
            <h3>중요 안내</h3>
            <strong class="strong">탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.</strong>
            <strong class="strong">네이버 아이디로 로그인하여 사용 중이던 외부 사이트를 방문하여 다른 로그인 수단을 준비하거나, 데이터를 백업한 후 네이버 회원을 탈퇴해야 합니다.</strong>
        </div>

        <div class="agreement">
            <label>
                <input type="checkbox" required> 안내 사항을 모두 확인하였으며, 이에 동의합니다.
            </label>
        </div>

        <button id="withdrawBtn" type="button">탈퇴하기</button>
        <button id="cancelWithdraw" type="reset">취소</button>
    </div>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="../js/userWithdraw.js"></script>
</body>
</html>