<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="ex01.*, java.util.*, java.text.*" %>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>상품목록</title>
	<link rel="stylesheet" href="home.css">
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<style>
		.del{cursor:pointer; text-align:right;}
		.del:hover{color:red;}
	</style>
</head>
<body>
	<h1>[상품목록]</h1>
	<div id="content">
		<div id="menu">
			<button class="btn">1</button>
			<button class="btn">2</button>
			<button class="btn">3</button>
			<button class="btn">4</button>
			<button class="btn">5</button>
			<a href="insert.html">상품등록</a>
		</div>
	
		<div id="darken-background">
			<div id="lightbox">
				<img src="http://placehold.it/500x500"/>
				<div><button id="btnClose">닫기</button></div>
				<div id="textName"></div>
				<div id="textPrice"></div>
			</div>
		</div>
		<%
			GoodsDAO dao=new GoodsDAO();
			ArrayList<GoodsVO> array=dao.list();
			
			for(int i=0; i<array.size(); i++) {
				GoodsVO vo=array.get(i);
				DecimalFormat df=new DecimalFormat("#,###원");
				String strPrice=df.format(vo.getPrice());
				out.print("<div class='box'>");
				out.print("<img src='http://placehold.it/150x150'>");
				out.print("<div class='gname'>" + vo.getGname() + "</div>");
				out.print("<div class='price'>" + strPrice + "</div>");
				out.print("<div class='del' gnum=" + vo.getGnum() + "><button>삭제</button></div>");
				out.print("</div>");
			}
		%>
	</div>
</body>

<script>
	$("#menu").on("click", ".btn", function(){
		var num=$(this).html();
		$("#content").css("width", 190*num);
	});
	
	$(".box").on("click", "img", function(){
		var box=$(this).parent();
		var gname=box.find(".gname").html();
		var price=box.find(".price").html();
		
		$("#textName").html("상품 : " + gname);
		$("#textPrice").html("가격 : " + price);
		
		$("#darken-background").show();
	});
	
	$("#btnClose").on("click", function(){
		$("#darken-background").hide();
	});
	
	$(".box").on("click", ".del", function(){
		var gnum=$(this).attr("gnum");
		if(!confirm(gnum+"번 상품을 삭제하시겠습니까?")) return;
		location.href="sqlDelete.jsp?gnum="+gnum;
	});
</script>

</html>