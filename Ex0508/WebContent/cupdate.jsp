<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>
<%
	String strGrade=request.getParameter("grade");
	int grade=Integer.parseInt(strGrade);
	String lcode=request.getParameter("lcode");
	String scode=request.getParameter("scode");
	
	SDAO dao=new SDAO();
	dao.cupdate(grade, lcode, scode);
%>