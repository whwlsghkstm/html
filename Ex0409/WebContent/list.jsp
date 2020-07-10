<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ex01.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Lorem Ipsum</title>
	<link rel="stylesheet" href="home.css">
</head>
<body>
	<div id="page">
		<div id="header">
			<h1>Hong's Blog</h1>
			<hr><br>
		</div>
		<div id="menu">
			<div class="item"><a href="insert.jsp">Write</a></div>
		</div>
		<div id="content">
			<%
				BlogDAO dao=new BlogDAO();
				ArrayList<BlogVO> array=dao.list();
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일");
				for(int i=0; i<array.size(); i++){
					BlogVO vo=array.get(i);
					String strDate=sdf.format(vo.getWdate());
					out.print("<div class='box'>");
					out.print("<h1 class='title'> ["+vo.getBnum()+"] "+vo.getTitle()+"</h1>");
					out.print("<h3 class='date'>"+strDate+"</h3>");
					out.print("<h2 class='article'>"+vo.getArticle()+"</h2>");
					out.print("<a href='sqlDelete.jsp?bnum="+vo.getBnum()+"'>삭제</a>");
					out.print("</div>");
				}
			%>
		</div>
		<div id="footer">
			<br><hr>
			<h3>By Mr.Hong</h3>
		</div>
	</div>
</body>
</html>