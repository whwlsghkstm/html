<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String gname=request.getParameter("gname");
	String strPrice=request.getParameter("price");
	int price=Integer.parseInt(strPrice);
	
	GoodsDAO dao=new GoodsDAO();
	GoodsVO vo=new GoodsVO();
	vo.setGname(gname);
	vo.setPrice(price);
	dao.insert(vo);
%>

<script>
	alert("저장 되었습니다.");
	location.href="list.jsp";
</script>