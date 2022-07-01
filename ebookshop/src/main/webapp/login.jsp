<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
<h2>로그인 페이지</h2>


<form action="loginProcess.jsp" method="post" name="loginForm">
아이디 <input type="text" name="id" id="id" required><br>
비밀번호 <input type="password" name="pass" id="pass" required><br>
<input type="submit" value="로그인하기">
</form>

</body>
</html>