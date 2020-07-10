<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*, org.json.simple.*, java.text.*" %>

<%
	String scode=request.getParameter("scode");

	EDAO dao=new EDAO();
	ArrayList<EVO> array=dao.list(scode);
	
	JSONObject jObject=new JSONObject();
	jObject.put("total", dao.count(scode));
	JSONArray jArray=new JSONArray();
	for(EVO vo:array){
		JSONObject obj=new JSONObject();
		obj.put("lcode", vo.getLcode());
		obj.put("lname", vo.getLname());
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