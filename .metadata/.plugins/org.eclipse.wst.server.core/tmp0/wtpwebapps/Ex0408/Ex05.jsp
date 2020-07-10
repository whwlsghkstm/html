<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Ex01.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hong's Shopping</title>
	<link rel="stylesheet" href="Home.css"/>
</head>
<body>
	<div id="page">
		<div id="top">
			<h1>Hong's Shopping</h1>
		</div>
		<div id="content">
			<div class="group">
				<%
				GoodsDAO dao=new GoodsDAO();
				ArrayList<GoodsVO> array=dao.list();
				for(int i=0; i<array.size(); i++){
					GoodsVO vo=array.get(i);
					out.print("<div class='box'>");
					out.print("<img src='http://placehold.it/100x100'>");
					out.print("<div class='title'>" + vo.getGname() + "</div>");
					out.print("<div class='price'>" + vo.getGprice() + "</div>");
					out.print("</div>");
				}
				%>
			</div>
		</div>
	</div>
</body>
</html>