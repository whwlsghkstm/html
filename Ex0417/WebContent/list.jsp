<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="ex01.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>성적목록</title>
	<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
	<style>
		h1,h3 {text-align:center;}
		#content{width:700px; background:yellow; color:red; padding:10px; margin:auto;}
		#tab {margin:auto; text-align:center;}
	</style>
</head>
<body>
	<h1>[성적목록]</h1><hr>
	<div id="content">
		이름 : <input type="text" id="textName"><br>
		국어 : <input type="text" id="textKor"><br>
		영어 : <input type="text" id="textEng"><br>
		수학 : <input type="text" id="textMat"><hr>
		<input type="button" value="등록" id="btnInsert">
		<input type="reset" value="취소">
		
		<h3>성적목록</h3>
		<table border=1 width=500px id="tab">
			<tr>
				<td>학번</td>
				<td>이름</td>
				<td>국어점수</td>
				<td>영어점수</td>
				<td>수학점수</td>
				<td>수정</td>
				<td>삭제</td>
			</tr>
			
			<%
				GradeDAO dao=new GradeDAO();
				ArrayList<GradeVO> array=dao.list();
				
				for(int i=0; i<array.size(); i++){
					GradeVO vo=array.get(i);
					int gnum=vo.getGnum();
					String gname=vo.getGname();
					int kor=vo.getKor();
					int eng=vo.getEng();
					int mat=vo.getMat();
					
					out.print("<tr class='row'>");
					out.print("<td class='gnum'>" + gnum + "</td>");
					out.print("<td class='gname'>" + gname + "</td>");
					out.print("<td><input class='kor' type='text' size=2 value=" + kor + "></td>");
					out.print("<td><input class='eng' type='text' size=2 value=" + eng + "></td>");
					out.print("<td><input class='mat' type='text' size=2 value=" + mat + "></td>");
					out.print("<td><button class='update'>수정</button></td>");
					out.print("<td><button class='delete'>삭제</button></td>");
					out.print("</tr>");
				}
			%>
			
		</table>
	</div>
</body>

<script>
	//등록버튼 클릭 했을 때
	$("#btnInsert").on("click", function(){
		if(!confirm("저장하시겠습니까?")) return;
		var gname=$("#textName").val();
		var kor=$("#textKor").val();
		var eng=$("#textEng").val();
		var mat=$("#textMat").val();
		
		if(gname.replace(/[가-힣]/g, '') || gname==""){
			alert("한글을 입력해주세요.");
			$("#textName").val("");
			$("#textName").focus();
		}else if(kor.replace(/[0-9]/g, '') || kor==""){
			alert("국어점수를 숫자로 입력해주세요.")
			$("#textKor").val("");
			$("#textKor").focus();
		}else if(eng.replace(/[0-9]/g, '') || eng==""){
			alert("영어점수를 숫자로 입력해주세요.")
			$("#textEng").val("");
			$("#textEng").focus();
		}else if(mat.replace(/[0-9]/g, '') || mat==""){
			alert("수학점수를 숫자로 입력해주세요.")
			$("#textMat").val("");
			$("#textMat").focus();
		}else{
			location.href="sqlInsert.jsp?gname="+gname+"&kor="+kor+"&eng="+eng+"&mat="+mat;
		}
	});
	
	//행에 있는 삭제버튼을 클릭했을 때
	$("#tab").on("click", ".row .delete", function(){
		var row=$(this).parent().parent();
		var gnum=row.find(".gnum").html();
		if(!confirm(gnum+"번을 삭제 하시겠습니까?")) return;
		location.href="sqlDelete.jsp?gnum="+gnum;
	});
	
	
	//행에 있는 수정버튼을 클릭했을때
	$("#tab").on("click", ".row .update", function(){
		var row=$(this).parent().parent();
		var gnum=row.find(".gnum").html();
		var kor=row.find(".kor").val();
		var eng=row.find(".eng").val();
		var mat=row.find(".mat").val();
		if(!confirm(gnum+"번을 수정 하시겠습니까?")) return;
		location.href="sqlUpdate.jsp?gnum="+gnum+"&kor="+kor+"&eng="+eng+"&mat="+mat;
	});
</script>

</html>