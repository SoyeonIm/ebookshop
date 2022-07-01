<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pass");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/board";
	
	try {
		Class.forName(driver);		
		conn = DriverManager.getConnection(url,"root", "1234");
		stmt = conn.createStatement();
		
		String sql = "select * from member where id='"+id+"'";
		 rs = stmt.executeQuery(sql);	
		//ResultSet(한줄 한줄씩 받아오는것) 객체 반환
		

	if(rs.next()){
				//next 는 한줄씩 읽는것
				int level=rs.getInt(4);
			if(id.equals(rs.getString("id")) && pw.equals(rs.getString("pass"))){
				session.setAttribute("id", rs.getString("id"));
				session.setAttribute("level",level);
				//session 을 만든다.
				response.sendRedirect("main.jsp");
				return;
				//끝내기
			} 
		}

		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			stmt.close();
			conn.close();
			rs.close();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
alert("아이디 또는 비번이 틀립니다");
location.href="login.jsp";
</script>
</body>
</html>