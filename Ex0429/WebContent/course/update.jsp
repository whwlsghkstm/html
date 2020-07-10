<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String strGrade=request.getParameter("grade");
	int grade=Integer.parseInt(strGrade);
	String scode=request.getParameter("scode");
	String lcode=request.getParameter("lcode");

	EDAO1 edao=new EDAO1();
	edao.update(grade, scode, lcode);
%>