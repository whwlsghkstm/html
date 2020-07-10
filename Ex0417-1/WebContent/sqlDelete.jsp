<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String strRnum=request.getParameter("rnum");
	int rnum=Integer.parseInt(strRnum);
	ReplyDAO dao=new ReplyDAO();
	dao.delete(rnum);
%>

<script>
	alert("삭제하였습니다.");
	location.href="list.jsp";
</script>