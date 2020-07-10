<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>학생목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		table{text-align:center;}
	</style>
</head>
<body>
	<h1>[학생목록]</h1>
	<table id="tab" width=700 border=1>
	<form action="list.jsp">
		<select name="type">
			<option value="sname">학생명</option>
			<option value="pname">교수명</option>
			<option value="sdept">학생학과</option>
			<option value="year">학년</option>
		</select>
		<input type="text" name="word">
		<input type="submit" value="검색">
	</form>
		<tr>
			<td>학번</td>
			<td>학생이름</td>
			<td>학과</td>
			<td>학년</td>
			<td>생년월일</td>
			<td>담당교수</td>
			<td>교수학과</td>
		</tr>
		
		<%
			String type=request.getParameter("type")==null?"scode":request.getParameter("type");
			String word=request.getParameter("word")==null?"":request.getParameter("word");
		
			SDAO dao=new SDAO();
			ArrayList<SVO> array=dao.list(type, word);
			for(SVO vo:array){
				out.print("<tr class='row'>");
				out.print("<td class='scode'>" + vo.getScode() + "</td>");
				out.print("<td class='sname'>" + vo.getSname() + "</td>");
				out.print("<td>" + vo.getSdept() + "</td>");
				out.print("<td>" + vo.getYear() + "</td>");
				out.print("<td>" + vo.getBirthday() + "</td>");
				out.print("<td>" + vo.getPname() + "</td>");
				out.print("<td>" + vo.getPdept() + "</td>");
				out.print("</tr>");
			}
		%>
	</table>
	
	<div id="enroll">
		<h1><span id="sname"></span><span id="total"></span></h1>
	<table id="tab1" border=1></table>
	<script id="temp1" type="text/x-handlebars-template">
			<tr class="header">
				<td>강좌번호</td>
				<td>강좌이름</td>
				<td>학생번호</td>
				<td>학생이름</td>
				<td>성적</td>
				<td>수강신청일</td>
			</tr>

		{{#each items}}
			<tr>
				<td>{{lcode}}</td>
				<td>{{lname}}</td>
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
	var sname=$(this).find(".sname").html();
	$("#sname").html(sname + " 학생의 수강신청 목록");
	
	var scode=$(this).find(".scode").html();
	alert(scode);
	//수강신청목록출력
	$.ajax({
		type:"get",
		url:"enrollment.jsp",
		dataType:"json",
		data:{"scode":scode},
		
		success:function(data){
			$("#total").html(data.total);
			var temp=Handlebars.compile($("#temp1").html());
			$("#tab1").html(temp(data));
		}
	});
});

</script>

</html>