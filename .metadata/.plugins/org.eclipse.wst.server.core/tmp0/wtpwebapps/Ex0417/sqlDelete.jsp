<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String strGnum=request.getParameter("gnum");
	int gnum=Integer.parseInt(strGnum);
	GradeDAO dao=new GradeDAO();
	dao.delete(gnum);
%>

<script>
	alert("삭제하였습니다.");
	location.href="list.jsp";
</script>