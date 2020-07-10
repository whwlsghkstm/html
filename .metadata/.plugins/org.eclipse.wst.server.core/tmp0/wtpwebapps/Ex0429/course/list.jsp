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
		#ctab{text-align:center; width:700px;}
		#tab1{text-align:center; width:700px;}
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

	<h1>[강좌목록]</h1>
	<table id="ctab" border=1>
		<tr class="title">
			<td>강좌번호</td>
			<td>강좌이름</td>
			<td>강의시간수</td>
			<td>강의실</td>
			<td>최대수강 인원수</td>
			<td>수강신청 인원수</td>
			<td>성적입력</td>
		</tr>
		
		<%
			CDAO cdao=new CDAO();
			ArrayList<CVO> array=cdao.list("%%");
			for(CVO vo:array){
				out.print("<tr class='row'>");
				out.print("<td class='lcode'>"+vo.getLcode()+"</td>");
				out.print("<td class='lname'>"+vo.getLname()+"</td>");
				out.print("<td class='hours'>"+vo.getHours()+"</td>");
				out.print("<td>"+vo.getRoom()+"</td>");
				out.print("<td>"+vo.getCapacity()+"</td>");
				out.print("<td>"+vo.getPersons()+"</td>");
				out.print("<td><button>성적입력</button></td>");
				out.print("</tr>");
			}
		%>
	</table>
	
	<div id="student" style="display:none">
		<h1>[학생 성적입력]</h1>
		<div>
			강좌번호 : <span id="lcode"></span>&nbsp;&nbsp;
			강좌이름 : <span id="lname"></span>&nbsp;&nbsp;
			강의시간 : <span id="hours"></span><br>	
			<button id="btnSave">전체저장</button>
		</div>
	</div>

	<table id="tab1" border=1></table>
	<script id="temp1" type="text/x-handlebars-template">
			<tr class="title">
				<td><input type="checkbox" id="checkAll"></td>
				<td>학생이름</td>
				<td>학생번호</td>
				<td>점수</td>
				<td>저장</td>
			</tr>

		{{#each sarray}}
			<tr class="row1">
				<td><input type="checkbox" class="check"></td>
				<td class="sname">{{sname}}</td>
				<td class="scode">{{scode}}</td>
				<td><input type="text" class="grade" value="{{grade}}"></td>
				<td><button>저장</button></td>
			</tr>
		{{/each}}
	</script>
</body>

<script>
	var lcode;
	var lname;
	var hours;

	$("#ctab").on("click", ".row button", function(){
		var row=$(this).parent().parent();
		lcode=row.find(".lcode").html();
		lname=row.find(".lname").html();
		hours=row.find(".hours").html();
		$("#lcode").html(lcode);
		$("#lname").html(lname);
		$("#hours").html(hours);
		$("#student").show();
		
		getList();
	});
	
	function getList(){
		$.ajax({
			type:"get",
			url:"sjson.jsp",
			dataType:"json",
			data:{"lcode":lcode},
			success:function(data){
				var temp=Handlebars.compile($("#temp1").html());
				$("#tab1").html(temp(data));
			}
		});
	}
	
	//체크박스모두표시
	$("#tab1").on("click", "#checkAll", function(){
		if($(this).is(":checked")){
			$("#tab1 .row1 .check").each(function(){
				$(this).prop("checked", true);
			});
		}
		else{
			$("#tab1 .row1 .check").each(function(){
				$(this).prop("checked", false);
			});
		}
	});
	
	//성적수정후 저장
	$("#tab1").on("click", ".row1 button", function(){
		if(!confirm("수정하시겠습니까?")) return;
		var row1=$(this).parent().parent();
		var grade=row1.find(".grade").val();
		var scode=row1.find(".scode").html();
		$.ajax({
			type:"get",
			url:"update.jsp",
			data:{"grade":grade, "scode":scode, "lcode":lcode},
			success:function(data){
				var temp=Handlebars.compile($("#temp1").html());
				$("#tab1").html(temp(data));
				alert("수정이 완료되었습니다.");
			}
		});
		getList();
	});
	
	//체크박스 선택된 값 모두저장
	$("#btnSave").on("click", function(){
		if(!confirm("선택한 학생의 점수를 수정하시겠습니까?")) return;
		$("#tab1 .row1 .check:checked").each(function(){
			row1=$(this).parent().parent();
			grade=row1.find(".grade").val();
			scode=row1.find(".scode").html();
			$(this).prop("checked", false);
			$("#tab1 #checkAll").prop("checked", false);
			
			$.ajax({
				type:"get",
				url:"update.jsp",
				data:{"grade":grade, "scode":scode, "lcode":lcode},
				success:function(data){}
			});
		})
		alert("수정이 완료되었습니다.");
		getList();
	});

</script>

</html>