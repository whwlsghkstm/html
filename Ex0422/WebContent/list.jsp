<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ex01.*, java.util.*, org.json.simple.*;"%>

<%
	MovieDAO dao=new MovieDAO();
	ArrayList<MovieVO> array=dao.list();
	
	//ArrayList -> JSON 데이터로 변경
	JSONArray jArray=new JSONArray();
	for(MovieVO vo:array){		
		JSONObject obj=new JSONObject();
		obj.put("mnum", vo.getMnum());
		obj.put("title", vo.getTitle());
		obj.put("actor", vo.getActor());
		jArray.add(obj);
	}
	out.println(jArray);
%>