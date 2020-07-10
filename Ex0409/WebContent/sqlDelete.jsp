<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ex01.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%
	String strBnum=request.getParameter("bnum");
	int bnum=Integer.parseInt(strBnum);
	
	BlogDAO dao=new BlogDAO();
	dao.delete(bnum);
%>

<script>
	alert("삭제완료!!!");
	location.href="list.jsp"
</script>