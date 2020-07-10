<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ex01.*" %>
<%@ page import="java.util.*" %>
<%
	String strBnum=request.getParameter("bnum");
	int bnum=Integer.parseInt(strBnum);
	
	BoardDAO dao=new BoardDAO();
	dao.delete(bnum);
%>

<script>
	alert("삭제완료!!!");
	location.href="read.jsp"
</script>