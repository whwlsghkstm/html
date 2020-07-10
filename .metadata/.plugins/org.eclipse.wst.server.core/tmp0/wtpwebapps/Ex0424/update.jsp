<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String strVnum=request.getParameter("vnum");
	int vnum=Integer.parseInt(strVnum);
	String title=request.getParameter("title");
	
	VideoVO vo=new VideoVO();
	vo.setVnum(vnum);
	vo.setTitle(title);
	
	VideoDAO dao=new VideoDAO();
	dao.update(vo);
%>