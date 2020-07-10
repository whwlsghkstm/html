<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>댓글 관리</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<style>
		#page{padding:20px;width:800px;background:gray; color:yellow; margin:auto;}
		#page input{text-align:center; margin:auto;}
		h1{margin:auto; text-align:center;}
		.box{width:700px; border:1px dotted black; padding:10px; margin:10px auto;}
		.title{overflow:hidden;}
		.date{ font-size:20px; color:orange; width:200px;float:left;}
		.like{float:right;}
		.cnt{font-size:12px; color:pink;}
		.content{background:red; padding:20px; font-size:15px;}
	</style>
</head>
<body>
	<div id="page">
		<h1>[댓글 관리]</h1>
		<input type="text" id="content" size=100>
		<input type="button" value="저장" id="btnInsert">
		
		<div class="box">
			<div class="title">
				<div class="date">오늘날짜</div>
				<div class="like">
					<button class="update">좋아요+1</button>
					<span class="cnt">좋아요수</span><br>
					<button class="delete">삭제</button><br><br>
				</div>
			</div>
			<div class="content">내용!!</div>
		</div>
		
		
		
		<%
			ReplyDAO dao=new ReplyDAO();
			ArrayList<ReplyVO> array=dao.list();
			for(int i=0; i<array.size(); i++){
				ReplyVO vo=array.get(i);
				int rnum=vo.getRnum();
				String content=vo.getContent();
				Date wdate=vo.getWdate();
				int cnt=vo.getCnt();
				out.print("<div class='box'>");
				out.print("<div class='title'>");
				out.print("<div class='date'>" + wdate + "</div>");
				out.print("<div class='like' rnum=" + rnum + ">");
				out.print("<button class='update'>♣</button>");
				out.print("<span class='cnt'>" + cnt + "</span><br>");
				out.print("<button class='delete'>삭제</button>");
				out.print("</div>");
				out.print("</div>");
				out.print("<div class='content'>" + content + "</div>");
				out.print("</div>");
			}
		%>
		
	</div>
</body>

<script>
	//행에 있는 삭제버튼을 클릭했을 때
	$(".box").on("click", ".delete", function(){
		var rnum=$(this).parent().attr("rnum");
		if(!confirm(rnum+"번을 삭제 하시겠습니까?")) return;
		location.href="sqlDelete.jsp?rnum="+rnum;
	});
	//등록버튼 클릭 했을 때
	$("#btnInsert").on("click", function(){
		if(!confirm("저장하시겠습니까?")) return;
		var content=$("#content").val();
		
		location.href="sqlInsert.jsp?content="+content;
	});
	
	//좋아요수 늘리기
	$(".box").on("click", ".update", function(){
		var rnum=$(this).parent().attr("rnum");
		location.href="sqlUpdate.jsp?rnum="+rnum;
	});
</script>

</html>