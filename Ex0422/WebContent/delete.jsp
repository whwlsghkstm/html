<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String strMnum=request.getParameter("mnum");
	int mnum=Integer.parseInt(strMnum);

	MovieDAO dao=new MovieDAO();
	dao.delete(mnum);
%>