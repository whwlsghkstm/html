<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String strAnum=request.getParameter("anum");
	int anum=Integer.parseInt(strAnum);
	out.print("<h3>" + anum + "번의 주소를 삭제했습니다.</h3>");
%>