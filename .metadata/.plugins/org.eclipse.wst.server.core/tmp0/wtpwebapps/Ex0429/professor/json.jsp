<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*, org.json.simple.*"%>

<%
	String pcode=request.getParameter("pcode");
	SDAO sdao=new SDAO();
	ArrayList<SVO> sarray=sdao.list(pcode);
	
	CDAO cdao=new CDAO();
	ArrayList<CVO> carray=cdao.list(pcode);
	
	JSONObject jObject=new JSONObject();
	
	JSONArray sArray=new JSONArray();
	for(SVO vo:sarray){
		JSONObject obj=new JSONObject();
		obj.put("scode", vo.getScode());
		obj.put("sname", vo.getSname());
		obj.put("dept", vo.getDept());
		obj.put("year", vo.getYear());
		obj.put("birthday", vo.getBirthday());
		sArray.add(obj);
	}
	jObject.put("sarray", sArray);
	
	JSONArray cArray=new JSONArray();
	for(CVO vo:carray){
		JSONObject obj=new JSONObject();
		obj.put("lcode", vo.getLcode());
		obj.put("lname", vo.getLname());
		obj.put("hours", vo.getHours());
		obj.put("room", vo.getRoom());
		obj.put("capacity", vo.getCapacity());
		obj.put("persons", vo.getPersons());
		cArray.add(obj);
	}
	jObject.put("carray", cArray);
	out.print(jObject);
%>