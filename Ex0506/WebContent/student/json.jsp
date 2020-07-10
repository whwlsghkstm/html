<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*, org.json.simple.*, java.text.*" %>
<%
	String lcode=request.getParameter("lcode");

	EDAO edao=new EDAO();
	ArrayList<EVO> carray=edao.clist();
	JSONObject jObject=new JSONObject();
	
	jObject.put("total", edao.count(lcode));
	
	DecimalFormat df=new DecimalFormat("#0.00");
	String strAvg=df.format(edao.avg(lcode));
	jObject.put("avg", strAvg);
	
	JSONArray cArray=new JSONArray();
	for(EVO vo:carray){
		JSONObject obj=new JSONObject();
		obj.put("lcode", vo.getLcode());
		obj.put("lname", vo.getLname());
		obj.put("pname", vo.getPname());
		cArray.add(obj);
	}
	
	jObject.put("clist", cArray);
	

	ArrayList<EVO> sarray=edao.slist(lcode);
	JSONArray sArray=new JSONArray();
	for(EVO vo:sarray){
		JSONObject obj=new JSONObject();
		obj.put("scode", vo.getScode());
		obj.put("sname", vo.getSname());
		obj.put("grade", vo.getGrade());
		sArray.add(obj);
	}
	
	jObject.put("slist", sArray);
	out.print(jObject);
%>