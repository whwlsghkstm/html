<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, org.json.simple.*" %>

<%
	String scode=request.getParameter("scode");
	SDAO sdao=new SDAO();
	JSONObject jObject=sdao.sdelete(scode);
	out.print(jObject);
%>