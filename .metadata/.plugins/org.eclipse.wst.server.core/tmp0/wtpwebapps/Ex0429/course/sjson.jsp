<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*, org.json.simple.*" %>

<%
	String lcode=request.getParameter("lcode");

	EDAO1 edao=new EDAO1();
	ArrayList<EVO1> array=edao.list(lcode);
	
	JSONObject jObject=new JSONObject();
	JSONArray jArray=new JSONArray();
	for(EVO1 vo:array){
		JSONObject obj=new JSONObject();
		obj.put("sname", vo.getSname());
		obj.put("scode", vo.getScode());
		obj.put("grade", vo.getGrade());
		jArray.add(obj);
	}
	jObject.put("sarray", jArray);
	out.print(jObject);
%>