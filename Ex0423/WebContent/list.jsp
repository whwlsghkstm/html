<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, org.json.simple.*, java.util.*" %>

<%
	ShopDAO dao=new ShopDAO();
	int count=dao.count();
	
	JSONObject jObject=new JSONObject();
	jObject.put("total", count);
	
	ArrayList<ShopVO> array=dao.list();
	JSONArray jArray=new JSONArray();
	
	for(ShopVO vo:array){
		JSONObject obj=new JSONObject();
		obj.put("sid", vo.getSid());
		obj.put("title", vo.getTitle());
		obj.put("lprice", vo.getLprice());
		obj.put("hprice", vo.getHprice());
		obj.put("image", vo.getImage());
		jArray.add(obj);
	}
	jObject.put("items", jArray);
	
	out.print(jObject);
%>