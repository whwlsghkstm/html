<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>교수목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
	<style>
		.row:hover{background:black; color:white; cursor:pointer;}
		#slist, #clist{display:none;}
	</style>
</head>
<body>
	<div id="menu">
		<a href="../professor/list.jsp">교수관리</a>
		<a href="../course/list.jsp">강좌관리</a>
		<a href="../student/list.jsp">학생관리</a>
	</div>
	<h1>[교수목록]</h1>
	<table width=700 border=1 id="tab">
		<tr>
			<td>교수번호</td>
			<td>교수이름</td>
			<td>소속학과</td>
			<td>임용일</td>
			<td>직급</td>
			<td>급여</td>
		</tr>
		
	<%
		PDAO dao=new PDAO();
		ArrayList<PVO> array=dao.list();
		for(PVO vo:array){
			out.print("<tr class='row'>");
			out.print("<td class='pcode'>" + vo.getPcode() + "</td>");
			out.print("<td class='pname'>" + vo.getPname() + "</td>");
			out.print("<td>" + vo.getDept() + "</td>");
			out.print("<td>" + vo.getHiredate() + "</td>");
			out.print("<td>" + vo.getTitle() + "</td>");
			out.print("<td>" + vo.getSalary() + "</td>");
			out.print("</tr>");
		}
	%>
	

	</table>
	
	<div id="slist">
		<h1>[학생목록]</h1>
		<div>담당교수 : <span class="pname"></span></div>
	</div>
	<div id="student">
		<h1><span id="sname"></span></h1>
	<table id="tab1" border=1></table>
	<script id="temp1" type="text/x-handlebars-template">
			<tr class="header">
				<td>학생번호</td>
				<td>학생이름</td>
				<td>소속학과</td>
				<td>학년</td>
				<td>생년월일</td>
			</tr>

		{{#each sarray}}
			<tr>
				<td>{{scode}}</td>
				<td>{{sname}}</td>
				<td>{{dept}}</td>
				<td>{{year}}</td>
				<td>{{birthday}}</td>
			</tr>
		{{/each}}
	</script>
	</div>
	
	<div id="clist">
		<h1>[강좌목록]</h1>
		<div>담당교수 : <span class="pname"></span></div>
	</div>
	<div id="course">
		<h1><span id="lname"></span></h1>
	<table id="tab2" border=1></table>
	<script id="temp2" type="text/x-handlebars-template">
			<tr class="header">
				<td>강좌번호</td>
				<td>강좌이름</td>
				<td>강의시간수</td>
				<td>강의실</td>
				<td>최대 수강인원수</td>
				<td>수강신청 인원수</td>
			</tr>

		{{#each carray}}
			<tr>
				<td>{{lcode}}</td>
				<td>{{lname}}</td>
				<td>{{hours}}</td>
				<td>{{room}}</td>
				<td>{{capacity}}</td>
				<td>{{persons}}</td>
			</tr>
		{{/each}}
	</script>
</body>

<script>
	$("#tab").on("click", ".row", function(){
		var pcode=$(this).find(".pcode").html();
		var pname=$(this).find(".pname").html();
		$("#slist").show();
		$("#clist").show();
		$("#slist .pname").html(pname);
		$("#clist .pname").html(pname);
		
		//담당교수의 학생 목록출력
		$.ajax({
			type:"get",
			url:"json.jsp",
			dataType:"json",
			data:{"pcode":pcode},
			
			success:function(data){
				var temp=Handlebars.compile($("#temp1").html());
				$("#tab1").html(temp(data));
			}
		});
		
		//담당교수의 강좌 목록출력
		$.ajax({
			type:"get",
			url:"json.jsp",
			dataType:"json",
			data:{"pcode":pcode},
			
			success:function(data){
				var temp=Handlebars.compile($("#temp2").html());
				$("#tab2").html(temp(data));
			}
		});
	});
</script>

</html>