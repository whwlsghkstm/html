<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*, java.text.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>점수통계</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
</head>
<body>
	<h1>[학생목록]</h1>
	<table border=1 id="tab">
		<tr>
			<td>학생번호</td>
			<td>학생이름</td>
			<td>소속학과</td>
			<td>지도교수</td>
		</tr>
		
		<%
			CDAO sdao=new CDAO();
			ArrayList<CVO> sarray=sdao.slist();
			for(CVO vo:sarray){
				out.print("<tr class='row'>");
				out.print("<td class='scode'>" + vo.getScode() + "</td>");
				out.print("<td>" + vo.getSname() + "</td>");
				out.print("<td>" + vo.getDept() + "</td>");
				out.print("<td>" + vo.getPname() + "</td>");
				out.print("</tr>");
			}
		%>
	</table>
	
	<h1>[수강신청목록]</h1>
	<table id="tab1" border=1></table>
	<script id="temp1" type="text/x-handlebars-template">
			<tr class="title1">
				<td><input type="checkbox" id="checkAll1"></td>
				<td>강좌번호</td>
				<td>강좌이름</td>
				<td>점수</td>
			</tr>

		{{#each clist}}
			<tr class="row1">
				<td><input type="checkbox" class="check1"></td>
				<td class="lcode">{{lcode}}</td>
				<td class="lname">{{lname}}</td>
				<td class="grade">{{grade}}</td>
			</tr>
		{{/each}}
	</script>
	수강과목 : <span id="total"></span>
	평균 : <span id="avg"></span>
</body>

<script>
	$("#tab").on("click", ".row", function(){
		var scode=$(this).find(".scode").html();
		$.ajax({
			type:"get",
			url:"json.jsp",
			dataType:"json",
			data:{"scode":scode},
			success:function(data){
				$("#total").html(data.total);
				$("#avg").html(data.avg);
				var temp=Handlebars.compile($("#temp1").html());
				$("#tab1").html(temp(data));
			}
		});
	});
	
	//체크박스모두표시
	$("#tab1").on("click", "#checkAll1", function(){
		if($(this).is(":checked")){
			$("#tab1 .row1 .check1").each(function(){
				$(this).prop("checked", true);
			});
		}
		else{
			$("#tab1 .row1 .check1").each(function(){
				$(this).prop("checked", false);
			});
		}
	});
</script>

</html>