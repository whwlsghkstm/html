<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>강좌목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		table{text-align:center;}
	</style>
</head>
<body>
	<h1>[강좌목록]</h1>
	<table id="tab" width=700 border=1>
	<form action="list.jsp">
		<select name="type">
			<option value="lcode">강좌번호</option>
			<option value="lname">강좌이름</option>
			<option value="room">강의실</option>
			<option value="pname">담당교수</option>
		</select>
		<input type="text" name="word">
		<input type="submit" value="검색">
	</form>
		<tr>
			<td>강좌번호</td>
			<td>강좌이름</td>
			<td>강의실</td>
			<td>담당교수</td>
			<td>교수학과</td>
		</tr>
		
		<%
			String type=request.getParameter("type")==null?"lcode":request.getParameter("type");
			String word=request.getParameter("word")==null?"":request.getParameter("word");

			CDAO dao=new CDAO();
			ArrayList<CVO> array=dao.list(type, word);
			for(CVO vo:array){
				out.print("<tr class='row'>");
				out.print("<td class='lcode'>" + vo.getLcode() + "</td>");
				out.print("<td class='lname'>" + vo.getLname() + "</td>");
				out.print("<td>" + vo.getRoom() + "</td>");
				out.print("<td>" + vo.getPname() + "</td>");
				out.print("<td>" + vo.getDept() + "</td>");
				out.print("</tr>");
			}
		%>
	</table>
	
	<div id="enroll">
		<h1><span id="lname"></span><span id="total"></span></h1>
	<table id="tab1" border=1></table>
	<script id="temp1" type="text/x-handlebars-template">
			<tr class="header">
				<td>학생번호</td>
				<td>학생이름</td>
				<td>성적</td>
				<td>수강신청일</td>
			</tr>

		{{#each items}}
			<tr>
				<td>{{scode}}</td>
				<td>{{sname}}</td>
				<td>{{grade}}</td>
				<td>{{edate}}</td>
			</tr>
		{{/each}}
	</script>
	</div>

</body>

<script>

//테이블의 각 행을 클릭했을 때
$("#tab").on("click", ".row", function(){
	var lname=$(this).find(".lname").html();
	$("#lname").html("<" + lname + "> 수강학생목록");
	
	var lcode=$(this).find(".lcode").html();
	//강의를 듣는 학생목록 출력
	$.ajax({
		type:"get",
		url:"enrollment.jsp",
		dataType:"json",
		data:{"lcode":lcode},
		
		success:function(data){
			$("#total").html(data.total);
			var temp=Handlebars.compile($("#temp1").html());
			$("#tab1").html(temp(data));
		}
	});
});

</script>

</html>