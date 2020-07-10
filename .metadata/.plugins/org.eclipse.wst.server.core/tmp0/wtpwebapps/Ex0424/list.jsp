<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, org.json.simple.*, java.util.*" %>

<%
	VideoDAO dao=new VideoDAO();
	int count=dao.count();
	
	JSONObject jObject=new JSONObject();
	jObject.put("total", count);
	
	
	ArrayList<VideoVO> array=dao.list();
	JSONArray jArray=new JSONArray();
	
	for(VideoVO vo:array){
		JSONObject obj=new JSONObject();
		obj.put("vnum", vo.getVnum());
		obj.put("thumbnail", vo.getThumbnail());
		obj.put("title", vo.getTitle());
		obj.put("datetime", vo.getDatetime());
		obj.put("play_time", vo.getPlay_time());
		jArray.add(obj);
	}
	jObject.put("documents", jArray);
	
	out.print(jObject);
%>
