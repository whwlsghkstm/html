<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ex01.*" %>

<%
	String title=request.getParameter("title");
	String content=request.getParameter("content");

	BBSVO vo=new BBSVO();
	vo.setTitle(title);
	vo.setContent(content);
	
	BBSDAO dao=new BBSDAO();
	dao.insert(vo);
%>

<script>
	alert("입력완료");
	location="list.jsp";
</script>