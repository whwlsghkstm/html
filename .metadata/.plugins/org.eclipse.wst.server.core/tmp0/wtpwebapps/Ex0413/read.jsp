<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%
	String strBnum=request.getParameter("bnum");
	int bnum=Integer.parseInt(strBnum);

	BBSDAO dao=new BBSDAO();
	BBSVO vo=dao.read(bnum);
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
		<input type="hidden" name="bnum" value="<%=bnum%>">
		제목 : <input type="text" name="title" value="<%=vo.getTitle()%>">
		<hr>
		내용 : <textarea rows="10" cols="50" name="content"><%=vo.getContent()%></textarea>
		<hr>
		<input type="button" value="목록" onClick="location.href='list.jsp'">
		<input type="submit" value="수정">
		<input type="button" value="삭제" name="bnum" onClick="location.href='sqlDelete.jsp?bnum=<%=vo.getBnum()%>'">	
		<input type="reset" value="취소">
	</form>
</body>
</html>