<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex01.*" %>

<%
	String aname=request.getParameter("aname");
	String atel=request.getParameter("atel");
	String address=request.getParameter("address");
	String strAnum=request.getParameter("anum");
	int anum=Integer.parseInt(strAnum);
	
	AddrVO vo=new AddrVO();
	vo.setAnum(anum);
	vo.setAname(aname);
	vo.setAtel(atel);
	
	vo.setAddress(address);
	
	AddrDAO dao=new AddrDAO();
	dao.update(vo);
%>



<script>
	alert("수정완료");
	location="list.jsp";
</script>