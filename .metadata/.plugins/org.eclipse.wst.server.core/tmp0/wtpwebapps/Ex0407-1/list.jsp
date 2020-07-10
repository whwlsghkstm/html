<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Ex01.*" %>
<%@ page import="java.util.*" %>

<%
	GoodsDAO dao = new GoodsDAO();
	ArrayList<GoodsVO> array=dao.list();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>[상품목록]</title>
</head>
<body>
	<h1>[상품목록]</h1>
	<table border=1 width=500>
		<tr>
			<th width=100>상품번호</th>
			<th width=300>상품명</th>
			<th width=100>가격</th>
		</tr>
		
		<%
			for(int i=0; i<array.size(); i++){
				GoodsVO vo=array.get(i);
				out.println("<tr>");
				out.println("<td>" + vo.getGnum() + "</td>");
				out.println("<td>" + vo.getGname() + "</td>");
				out.println("<td>" + vo.getGprice() + "</td>");
				out.println("</tr>");
			}
		%>
	</table><br>
	<a href="Ex01.html">상품등록</a>
</body>
</html>