<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");

	//집 만들어주기
	
	Connection conn = null;
	Statement stmt = null;
	
	String driver = "org.mariadb.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/board";
	
	
	
	try {
		// 1. JDBC 드라이버 로드
		Class.forName(driver);	
		// 2. 데이터베이스  연결 객체 생성
		conn = DriverManager.getConnection(url,"root", "1234");
		// 3. STATEMENT 객체 생성
		stmt = conn.createStatement();		
		
		String insertSql = "insert into member values('"+id+"','"+pass+"','"+name+"', '1')";
	
		int result = stmt.executeUpdate(insertSql);
		if(result != 0) {
			response.sendRedirect("login.jsp");
		} else {
			response.sendRedirect("joinForm.jsp");
		}
		
	} catch (Exception e) {//예외적인 에러
		e.printStackTrace();
		//에러사항 표시
	} finally {
		try {
			stmt.close();
			conn.close();
			//객체 제거 열어놓은거 항상 닫아주기
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
%>