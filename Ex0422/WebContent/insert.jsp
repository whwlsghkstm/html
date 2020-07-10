<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ex01.*" %>

<%
	String image=request.getParameter("image");
	String title=request.getParameter("title");
	String actor=request.getParameter("actor");
	
	MovieVO vo=new MovieVO();
	vo.setImage(image);
	vo.setTitle(title);
	vo.setActor(actor);
	
	MovieDAO dao=new MovieDAO();
	dao.insert(vo);
%>