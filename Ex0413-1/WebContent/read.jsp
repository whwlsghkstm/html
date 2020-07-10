<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%
	String strAnum=request.getParameter("anum");
	int anum=Integer.parseInt(strAnum);

	AddrDAO dao=new AddrDAO();
	AddrVO vo=dao.read(anum);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글 읽기</title>
</head>
<body>
	<h1>[글 읽기]</h1>
	<form action="sqlUpdate.jsp">
		<input type="hidden" name="anum" value="<%=anum%>">
		이름 : <input type="text" name="aname" value="<%=vo.getAname()%>">
		<hr>
		번호 : <input type="text" name="atel" value="<%=vo.getAtel()%>">
		<hr>
		주소 : <input type="text" name="address" value="<%=vo.getAddress()%>">
		<hr>
		<input type="button" value="목록" onClick="location.href='list.jsp'">
		<input type="submit" value="수정">
		<input type="button" value="삭제" name="anum" onClick="location.href='sqlDelete.jsp?anum=<%=vo.getAnum()%>'">	
		<input type="reset" value="취소">
	</form>
</body>
</html>