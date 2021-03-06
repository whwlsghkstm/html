<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*, org.json.simple.*, java.text.*" %>
<%
	String scode=request.getParameter("scode");

	CDAO cdao=new CDAO();
	ArrayList<CVO> carray=cdao.clist(scode);
	
	JSONObject jObject=new JSONObject();
	jObject.put("total", cdao.count(scode));
	
	DecimalFormat df=new DecimalFormat("#0.00");
	String strAvg=df.format(cdao.avg(scode));
	jObject.put("avg", strAvg);
	JSONArray jArray=new JSONArray();
	for(CVO vo:carray){
		JSONObject obj=new JSONObject();
		obj.put("lcode", vo.getLcode());
		obj.put("lname", vo.getLname());
		obj.put("grade", vo.getGrade());
		jArray.add(obj);
	}
	
	jObject.put("clist", jArray);
	out.print(jObject);
%>