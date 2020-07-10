<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.sql.*, ex01.*" %>
<%
	BBSDAO dao=new BBSDAO();
	ArrayList<BBSVO> array=dao.list();

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 목록</title>
	<style>
		div{background:black; color:white; padding:10px; font-size:30px;}
	</style>
</head>
<body>
	<h1>[게시판 목록]</h1>	
	<a href="insert.jsp">[글쓰기]</a>
	<%
		for(int i=0; i<array.size(); i++){
			BBSVO vo=array.get(i);
			out.print("<div>");
			out.print(vo.getBnum());
			out.println();
			out.print("<a href='read.jsp?bnum="+vo.getBnum()+"'>" + vo.getTitle() + "</a>");
			out.println();
			out.print(vo.getWdate());
			out.println();
			out.print("</div>");
		}
	%>
</body>
</html>