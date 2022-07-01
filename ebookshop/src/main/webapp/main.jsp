<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<html>
<head>
<meta charset="UTF-8">
<title>회원관리 시스템 메인 페이지</title>
</head>
<body>
<%
int level=(Integer) session.getAttribute("level");
%>
	<h2><%=(String) session.getAttribute("id") %>로 로그인하셨습니다.</h2>
	<% if(level==1) { %>
		<h3>권한이없습니다</h3>
	<% }else {%>
	<a href="list.jsp">게시글 보러가기</a>
	<%}%>
</body>
</html>