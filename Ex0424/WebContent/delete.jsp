<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String strVnum=request.getParameter("vnum");
	int vnum=Integer.parseInt(strVnum);
	
	VideoDAO dao=new VideoDAO();
	dao.delete(vnum);
%>