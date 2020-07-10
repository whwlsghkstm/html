<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	BoardDAO dao=new BoardDAO();
	BoardVO vo=new BoardVO();
	vo.setTitle(title);
	vo.setContent(content);
	dao.insert(vo);
%>

<script>
	alert("저장완료!!!");
	location.href="list.jsp";
</script>