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
		#stab{text-align:center;}
		#tab2{text-align:center; width:700px;}
		.title{background:yellow;}
		.row:hover{background:black; color:white;}
		button{cursor:pointer;}
	</style>
</head>
<body>
	<div id="menu">
		<a href="../professor/list.jsp">교수관리</a>
		<a href="../course/list.jsp">강좌관리</a>
		<a href="../student/list.jsp">학생관리</a>
	</div>
	<h1>[학생목록]</h1>
	<table id="stab" border=1>
		<tr class="title">
			<td>학생이름</td>
			<td>학생번호</td>
			<td>소속학과</td>
			<td>생년월일</td>
			<td>지도교수번호</td>
			<td>수강신청</td>
		</tr>
		
		<%
			SDAO sdao=new SDAO();
			ArrayList<SVO> array=sdao.list("%%");
			for(SVO vo:array){
				out.print("<tr class='row'>");
				out.print("<td class='sname'>" + vo.getSname() + "</td>");
				out.print("<td class='scode'>" + vo.getScode() + "</td>");
				out.print("<td>" + vo.getDept() + "</td>");
				out.print("<td>" + vo.getBirthday() + "</td>");
				out.print("<td>" + vo.getAdvisor() + "</td>");
				out.print("<td><button>수강신청</button></td>");
				out.print("</tr>");
			}
		%>
	</table>
	
	<div id="enrollment" style="display:none">
		<h1>[수강신청목록]</h1>
		<div>
			이름 : <span id="sname"></span>&nbsp;&nbsp;
			학번 : <span id="scode"></span>
		</div>
		강좌명 :
		<select id="lcode"></select>
		<script id="temp1" type="text/x-handlebars-template">
		{{#each carray}}
			<option value={{lcode}}>{{lcode}} : {{lname}}</option>
		{{/each}}
		</script>
		<input type="button" value="신청" id="btnInsert">
	</div>
	
	<table id="tab2" border=1></table>
	<script id="temp2" type="text/x-handlebars-template">
			<tr class="header">
				<td>강좌번호</td>
				<td>강좌이름</td>
				<td>수강신청일</td>
				<td>점수</td>
				<td>수강취소</td>
			</tr>

		{{#each earray}}
			<tr class="row2">
				<td class="lcode">{{lcode}}</td>
				<td class="lname">{{lname}}</td>
				<td>{{edate}}</td>
				<td>{{grade}}</td>
				<td><button>수강취소</button></td>
			</tr>
		{{/each}}
	</script>
</body>

<script>
	var scode;
	var lcode;

	
	//수강신청목록출력
	function getList(){
		$.ajax({
			type:"get",
			url:"ejson.jsp",
			dataType:"json",
			data:{"scode":scode},
			success:function(data){
				var temp=Handlebars.compile($("#temp2").html());
				$("#tab2").html(temp(data));
			}
		});
	}
	
	//수강신청 버튼을 클릭했을 때 목록출력
	$("#stab").on("click", ".row button", function(){
		var row=$(this).parent().parent();
		var sname=row.find(".sname").html();
		$("#sname").html(sname);
		scode=row.find(".scode").html();
		$("#scode").html(scode);
		$("#enrollment").show();
		
		getList();
	});
	
	//담당교수의 강좌 목록출력
	$.ajax({
		type:"get",
		url:"cjson.jsp",
		dataType:"json",
		
		success:function(data){
			var temp=Handlebars.compile($("#temp1").html());
			$("#lcode").html(temp(data));
		}
	});
	
	//수강신청
	$("#btnInsert").on("click", function(){
		if(!confirm("수강신청을 하시겠습니까?")) return;
		lcode=$("#lcode").val();
		$.ajax({
			type:"get",
			url:"insert.jsp",
			data:{"lcode":lcode, "scode":scode},
			success:function(){
				alert("수강신청됐지롱");
				getList();
			}
		});
	});
	
	//수강신청취소
	$("#tab2").on("click", ".row2 button",function(){
		if(!confirm("수강신청을 취소 하시겠습니까?")) return;
		lcode=$("#lcode").val();
		$.ajax({
			type:"get",
			url:"delete.jsp",
			data:{"lcode":lcode, "scode":scode},
			success:function(){
				alert("수강취소됐지롱");
				getList();
			}
		});
	});

</script>

</html>