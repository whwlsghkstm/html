<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String title=request.getParameter("title");
	String content=request.getParameter("content");
	String strBnum=request.getParameter("bnum");
	int bnum=Integer.parseInt(strBnum);
	
	BBSVO vo=new BBSVO();
	vo.setBnum(bnum);
	vo.setTitle(title);
	vo.setContent(content);
	
	BBSDAO dao=new BBSDAO();
	dao.update(vo);
%>



<script>
	alert("수정완료");
	location="list.jsp";
</script>