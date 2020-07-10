<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ex01.*" %>
<%@ page import="java.util.*" %>

<%
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	
	BoardDAO dao=new BoardDAO();
	BoardVO vo=new BoardVO();
	vo.setTitle(title);
	vo.setContent(content);
	dao.update(vo);
%>


<script>
	location.href="list.jsp"
	alert("수정완료!!!");
</script>