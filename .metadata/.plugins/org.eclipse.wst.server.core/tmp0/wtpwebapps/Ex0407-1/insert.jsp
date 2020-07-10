<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="Ex01.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String gnum=request.getParameter("gnum");
	String gname=request.getParameter("gname");
	String strGprice=request.getParameter("gprice");
	int gprice=Integer.parseInt(strGprice);
	
	GoodsVO vo=new GoodsVO();
	vo.setGnum(gnum);
	vo.setGname(gname);
	vo.setGprice(gprice);
	
	GoodsDAO dao=new GoodsDAO();
	dao.insert(vo);
%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>입력완료</title>
</head>
<body>
	<h1>데이터 입력이 완료 되었습니다.</h1>
	<a href="list.jsp">목록으로 이동</a><br>
	<a href="Ex01.html">상품등록 창으로 이동</a>
</body>
</html>