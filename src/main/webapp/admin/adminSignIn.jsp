<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 로그인</title>
<link rel="stylesheet" href="../css/adminSignIn.css">
</head>
<body>
<jsp:include page="../common/header.jsp" />

<div id="login-jsp" class="signin-container">
    <h2>관리자 로그인</h2>
    <form id="adminLoginForm" action="${pageContext.request.contextPath}/admin/adminSignIn.do" method="post">
        <table>
            <tr>
                <td class="label"><label for="adminId">ID</label></td>
                <td class="input"><input type="text" id="adminId" name="aid" required></td>
            </tr>
            <tr>
                <td colspan="2"><div id="adminIdDiv"></div></td>
            </tr>
            <tr>
                <td class="label"><label for="adminPwd">Pwd</label></td>
                <td class="input"><input type="password" id="adminPwd" name="apwd" required></td>
            </tr>
            <tr>
                <td colspan="2"><div id="adminPwdDiv"></div></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit" id="adminLoginBtn">로그인</button>
                </td>
            </tr>
            <tr>
                <td colspan="2"><div id="adminLoginErrorDiv"></div></td>
            </tr>
        </table>
    </form>
</div>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/adminSignIn.js"></script>
</body>
</html>