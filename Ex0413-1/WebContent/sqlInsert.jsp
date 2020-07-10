<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ex01.*" %>

<%
	String aname=request.getParameter("aname");
	String atel=request.getParameter("atel");
	String address=request.getParameter("address");
	
	AddrVO vo=new AddrVO();
	vo.setAname(aname);
	vo.setAtel(atel);
	vo.setAddress(address);
	
	AddrDAO dao=new AddrDAO();
	dao.insert(vo);
%>

<script>
	alert("입력완료");
	location="list.jsp";
</script>