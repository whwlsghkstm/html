<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*, org.json.simple.*" %>

<%
	String scode=request.getParameter("scode");

	EDAO edao=new EDAO();
	ArrayList<EVO> array=edao.list(scode);
	
	JSONObject jObject=new JSONObject();
	JSONArray jArray=new JSONArray();
	for(EVO vo:array){
		JSONObject obj=new JSONObject();
		obj.put("lcode", vo.getLcode());
		obj.put("lname", vo.getLname());
		obj.put("grade", vo.getGrade());
		obj.put("edate", vo.getEdate());
		jArray.add(obj);
	}
	jObject.put("earray", jArray);
	out.print(jObject);
%>