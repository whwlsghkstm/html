<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Ex0407.*" %>
<%@ page import="java.util.*" %>

<%
	StudentDAO dao = new StudentDAO();
	ArrayList<StudentVO> array=dao.list();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[학생목록]</title>
</head>
<body>
	<h1>[학생목록]</h1>
	<table border=1 width=700>
		<tr>
			<th width=100>학번</th>
			<th width=100>학생 이름</th>
			<th width=200>학생 연락처</th>
			<th width=300>학생 주소</th>
		</tr>
		
		<%
			for(int i=0; i<array.size(); i++){
				StudentVO vo=array.get(i);
				out.println("<tr>");
				out.println("<td>" + vo.getSnum() + "</td>");
				out.println("<td>" + vo.getSname() + "</td>");
				out.println("<td>" + vo.getStel() + "</td>");
				out.println("<td>" + vo.getSaddr() + "</td>");
				out.println("</tr>");
			}
		%>
	</table><br>
	<a href="Ex03.html">학생등록</a>
</body>
</html>