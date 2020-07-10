<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%
	String strBnum=request.getParameter("bnum");
	int bnum=Integer.parseInt(strBnum);
	
	BBSDAO dao=new BBSDAO();
	dao.delete(bnum);
%>

<script>
	alert("삭제완료");
	location="list.jsp";
</script>