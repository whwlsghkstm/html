<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*, org.json.simple.*, java.text.*" %>

<%
	String lcode=request.getParameter("lcode");
	
	EDAO1 dao=new EDAO1();
	ArrayList<EVO1> array=dao.list(lcode);
	
	JSONObject jObject=new JSONObject();
	jObject.put("total", dao.count(lcode));
	JSONArray jArray=new JSONArray();
	for(EVO1 vo:array){
		JSONObject obj=new JSONObject();
		obj.put("scode", vo.getScode());
		obj.put("sname", vo.getSname());
		obj.put("grade", vo.getGrade());
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String edate=sdf.format(vo.getEdate());
		
		obj.put("edate", edate);
		jArray.add(obj);
	}
	jObject.put("items", jArray);
	out.print(jObject);
%>