<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String lcode=request.getParameter("lcode");
	String scode=request.getParameter("scode");
	
	EDAO edao=new EDAO();
	edao.delete(lcode, scode);
%>