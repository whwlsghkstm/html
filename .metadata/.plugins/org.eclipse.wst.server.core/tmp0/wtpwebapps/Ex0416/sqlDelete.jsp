<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String gnum=request.getParameter("gnum");
	GoodsDAO dao=new GoodsDAO();
	dao.delete(gnum);
%>

<script>
	alert("상품을 삭제하였습니다.");
	location.href="list.jsp";
</script>