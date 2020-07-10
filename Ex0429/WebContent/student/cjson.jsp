<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*, org.json.simple.*" %>

<%
	CDAO cdao=new CDAO();
	ArrayList<CVO> array=cdao.list("%%");
	
	JSONObject jObject=new JSONObject();
	JSONArray jArray=new JSONArray();
	for(CVO vo:array){
		JSONObject obj=new JSONObject();
		obj.put("lcode", vo.getLcode());
		obj.put("lname", vo.getLname());
		jArray.add(obj);
	}
	jObject.put("carray", jArray);
	out.print(jObject);
%>