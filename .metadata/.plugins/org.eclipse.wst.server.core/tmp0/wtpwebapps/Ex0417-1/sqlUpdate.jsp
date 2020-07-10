<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String strRnum=request.getParameter("rnum");
	int rnum=Integer.parseInt(strRnum);
	
	ReplyDAO dao=new ReplyDAO();
	dao.update(rnum);
%>

<script>
	alert("좋아요 수가 1 증가합니다^^!")
	location.href="list.jsp";
</script>