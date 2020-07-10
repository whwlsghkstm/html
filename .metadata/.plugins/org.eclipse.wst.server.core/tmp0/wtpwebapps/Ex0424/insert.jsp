<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String thumbnail=request.getParameter("thumbnail");
	String title=request.getParameter("title");
	String datetime=request.getParameter("datetime");
	String play_time=request.getParameter("play_time");
	
	VideoVO vo=new VideoVO();
	vo.setTitle(title);
	vo.setThumbnail(thumbnail);
	vo.setDatetime(datetime);
	vo.setPlay_time(play_time);
	
	VideoDAO dao=new VideoDAO();
	dao.insert(vo);
%>