<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Ex0407.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	StudentVO vo = new StudentVO();
	vo.setSnum(request.getParameter("snum"));
	vo.setSname(request.getParameter("sname"));
	vo.setStel(request.getParameter("stel"));
	vo.setSaddr(request.getParameter("saddr"));

	StudentDAO dao = new StudentDAO();
	dao.insert(vo);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>입력완료</title>
</head>
<body>
	<h1>데이터 입력이 완료 되었습니다.</h1>
	<a href="Ex03.html">계속입력</a><br>
	<a href="list.jsp">학생목록</a>
</body>
</html>