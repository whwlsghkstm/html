<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, org.json.simple.*" %>

<%
	String lcode=request.getParameter("lcode");
	String lname=request.getParameter("lname");
	
	SDAO cdao=new SDAO();
	SVO vo=new SVO();
	
	vo.setLcode(lcode);
	vo.setLname(lname);
	
	JSONObject jObject=cdao.cinsert(vo);
	out.print(jObject);
%>