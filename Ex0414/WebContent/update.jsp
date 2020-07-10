<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%
	String name=request.getParameter("textName");
	String addr=request.getParameter("textAddr");

	out.println("<h1>이름 : " + name + "</h1>");
	out.println("<h1>주소 : " + addr + "</h1>");
%>