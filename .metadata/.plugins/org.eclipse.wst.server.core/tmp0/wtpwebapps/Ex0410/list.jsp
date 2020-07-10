<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>게시판 목록</title>
	<link rel="stylesheet" href="home.css"/>
	<style>
		.tab{width:700px; margin:auto;}
		.tab td{border:2px solid red; text-align:center; margin:auto;}
		.tab .title{background:white; color:black;}
		.tab .data:nth-child(2n+1){background:gray;}
		.tab .data:hover{background:skyblue; color:white;}
		#content a{text-align:center;}
	</style>
</head>
<body>
	<div id="page">
		<div id="content">
			<h1>게시판 목록</h1>
			<hr>
			<a href="insert.html" style="float:right; margin-right:30px; font-size:15px;">글 쓰기</a>
			
			<table class="tab">
				<tr class="title">
					<td width=30>No</td>
					<td>Title</td>
					<td width=150>Date</td>
				</tr>
				
				<%
					BoardDAO dao=new BoardDAO();
					ArrayList<BoardVO> list=dao.list();
					for(int i=0; i<list.size(); i++) {
						BoardVO vo=new BoardVO();
						vo=list.get(i);
						int bnum=vo.getBnum();
						String title=vo.getTitle();
						SimpleDateFormat sdf=new SimpleDateFormat("yyyy년 MM월 dd일 hh:mm:ss");
						String date=sdf.format(vo.getWdate());
						out.print("<tr class='data'>");
						out.print("<td>" + bnum + "</td>");
						out.print("<td><a href='read.jsp?bnum=" + bnum + "'>" + title + "</a></td>");
						out.print("<td>" + date + "</td>");
						out.print("</tr>");
					}
				%>
			</table>
		</div>
	</div>
</body>
</html>