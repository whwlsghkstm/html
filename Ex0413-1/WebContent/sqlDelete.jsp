<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%
	String strAnum=request.getParameter("anum");
	int anum=Integer.parseInt(strAnum);
	
	AddrDAO dao=new AddrDAO();
	dao.delete(anum);
%>

<script>
	alert("삭제완료");
	location="list.jsp";
</script>