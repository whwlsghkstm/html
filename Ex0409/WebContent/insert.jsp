<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Write from Blog</title>
	<link rel="stylesheet" href="home.css">
	<style>
		.tab{width:700px; margin:20px auto;
			border-collapse:collapse;}
		.tab td, .tab tr{border:3px solid red; padding:5px; text-align:center;}
	</style>
</head>
<body>
	<div id="page">
		<div id="header">
			<h1>Hong's Blog</h1>
			<hr><br>
		</div>
		<div id="content">
			<div id="menu">
				<div class="item"><a href="list.jsp">Back</a></div>
			</div>
		</div>
		<div class="box">
			<form action="sqlInsert.jsp">
				<table class="tab" border=1 width=700px>
					<tr>
						<th style="font-size:20px" width=150px>글 제목</th>
						<td><input type="text" size=75 name="title"></td>
					</tr>
					<tr>
						<th style="font-size:20px">내용</th>
						<td>
							<textarea rows=10 cols=70 name="article"></textarea>
						</td>
					</tr>
				</table>
				<div style="text-align:right; margin-right:75px;">
					<input type="submit" value="저장">
					<input type="reset" value="취소">
				</div>
			</form>
		</div>
		<br>
		<div id="footer">
			<br><hr>
			<h3>By Mr.Hong</h3>
		</div>
	</div>
</body>
</html>