<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ex01.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
	String strBnum=request.getParameter("bnum");
	int bnum=Integer.parseInt(strBnum);
	
	BoardDAO dao=new BoardDAO();
	BoardVO vo=dao.read(bnum);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>글 읽기</title>
	<style>
		*{font-family:'Times New Roman'}
		body{background:gray;}
		#page{background:black; color:white; width:1000px; margin:auto; padding:10px;
			box-shadow:10px 10px 10px #ffffb0; border-radius:10px 10px 10px 10px;}
		#content{width:900px; padding:10px; border:1px solid white;
				margin:20px auto;}
		#content h1{text-align:center;}
		#menu{width:700px; margin:auto;}
		a{color:white; font-size:20px;}
		a:hover{background:black; color:white;}
		.tabInsert{width:700px; background:gray; margin:20px auto; border-radius:5px 5px 5px 5px; padding:5px;}
		.button{width:50px; height:30px; margin-right:10px;}
	</style>
</head>
<body>
	<div id="page">
		<div id="content">
			<h1>글 읽기</h1>
			<hr>
			<div id="menu">
				<a href="list.jsp">목록</a>
			</div>
			<hr>
			
			<form class="form" action="sqlUpdate.jsp">
				<table class="tabInsert">
					<tr class="title">
						<td>글 제목</td>
						<td><input type="text" size=78 name="title" value="<%=vo.getTitle()%>"></td>
					</tr>
					<tr>
						<td>글 내용</td>
						<td colspan=2>
						<textarea rows="10" cols="80" name="content"><%=vo.getContent()%></textarea>
					</tr>
				</table>
				
				<br>
				<div style="text-align:right; margin-right:100px;">
					<input class="button" type="submit" value="수정">
					<input class="button" type="button" value="삭제">
					<input class="button" type="reset" value="취소">
				</div>
			</form>
		</div>
	</div>
</body>
</html>