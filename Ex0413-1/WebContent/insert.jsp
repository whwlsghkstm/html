<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>주소입력</title>
</head>
<body>
	<h1>[주소입력]</h1>
	<form action="sqlInsert.jsp">
		<hr>
		이름 : <input type="text" name="aname">
		<br>
		번호 : <input type="text" name="atel">
		<br>
		주소 : <input type="text" name="address">
		<hr>
		<input type="submit" value="저장">
		<input type="reset" value="취소">
	</form>
</body>
</html>