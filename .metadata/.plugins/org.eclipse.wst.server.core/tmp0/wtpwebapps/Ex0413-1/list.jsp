<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, java.sql.*, ex01.*" %>
<%
	AddrDAO dao=new AddrDAO();
	ArrayList<AddrVO> array=dao.list();

%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주소록</title>
	<style>
		div{background:black; color:white; padding:10px; font-size:30px;}
	</style>
</head>
<body>
	<h1>[주소록]</h1>	
	<a href="insert.jsp">[주소입력]</a>
	<%
		for(int i=0; i<array.size(); i++){
			AddrVO vo=array.get(i);
			out.print("<div>");
			out.print(vo.getAnum());
			out.println();
			out.print("<a href='read.jsp?anum="+vo.getAnum()+"'>" + vo.getAname() + "</a>");
			out.println();
			out.print(vo.getAtel());
			out.println();
			out.print(vo.getAddress());
			out.println();
			out.print("</div>");
		}
	%>
</body>
</html>