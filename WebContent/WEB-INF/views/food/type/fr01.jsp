<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" uri="myFunc"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<style>
.wi_1{ width: 120px;}
.wi_2{ width: 100px;}
</style>

<script type="text/javascript">

var line1 = 6;
var line2 = 6;

function delLine1(id){

	$("#tr_"+ id).remove();
}
function delLine2(id){

	$("#br_"+ id).remove();
}

function addLine(tp){
	if(tp == 1){
	$("#addbtn1").remove();
	$("#FR01_TOP").append("<tr id='tr_"+ line1 +"'>" +"<th>"+ line1 +"</th><th><input class='wi_1' type='text' name='fnm'></th>" +
			"<th><input class='wi_2' type='text' name='price'></th>	<th><input class='wi_2' type='date' name='bdt'></th>"
			+"<th><input class='wi_2' type='date' name='fdt'></th>"
			+"<th><input class='wi_2' type='text' name='vm'></th>"
			+"<th><p class='wi_2 btn_brown' onclick='delLine1("+ line1 +")'>삭제</p></th></tr>");
	$("#FR01_TOP").append("<tr id='addbtn1'><th colspan='7'><p class='btn_brown' onclick='addLine(1)'>+</p></th>	</tr>");	
       line1 ++;
	}else if(tp == 2){
		$("#addbtn2").remove();
		$("#FR01_BOTTOM").append("<tr id='br_"+ line2 +"'>" +"<th>"+ line2 +"</th><th><input class='wi_1' type='text' name='fnm'></th>" +
				"<th><input class='wi_2' type='text' name='price'></th>	<th><input class='wi_2' type='date' name='bdt'></th>"
				+"<th><input class='wi_2' type='date' name='fdt'></th>"
				+"<th><input class='wi_2' type='text' name='vm'></th>"
				+"<th><p class='wi_2 btn_brown' onclick='delLine2("+ line2 +")''>삭제</p></th></tr>");
		$("#FR01_BOTTOM").append("<tr id='addbtn2'><th colspan='7'><p class='btn_brown' onclick='addLine(2)'>+</p></th>	</tr>");	
	       line2 ++;
	}
}

function insertD(){
	
	if(confirm("등록하시겠습니까??")){
		
	 // 여기부터
		var arrfnm = [];
		$( "input[name='fnm']").each( function ( i ) {
			arrfnm.push( $( this ).val() );
		} );
		
		console.log(arrfnm);
		
	}
}

</script>

<c:choose>
<c:when test="${fn:length(arrList) == 0}">
<form>
<input type="hidden" name='jidx' value='${vo.jidx}'>
				<table class="bodyFR01" id='FR01_TOP'>
					<tr>
					<th colspan="7">냉동실</th>
					</tr>
					<tr>
					<th>품명</th>
					<th>가격</th>
					<th>구매일</th>
					<th>유통기한</th>
					<th>개수/용량</th>
					<th>수정</th>
					</tr>
					<c:forEach var="i" begin="1" end="5">
		          	<tr id='tr_${i}'>
		          	<th><input class="wi_1" type='text' name='fnm'></th>
		          	<th><input class="wi_2" type='text' name='price'></th>
		          	<th><input class="wi_2" type="date" name='bdt'></th>
		          	<th><input class="wi_2" type='date' name='fdt'></th>
		          	<th><input class="wi_2" type='text' name='vm'></th>
		          	<th><a class='wi_2 btn_brown' onclick="delLine1(${i});">삭제</a></th>
		          	</tr>
		          	</c:forEach>
		          	<tr id='addbtn1'><th colspan="7"><p class='btn_brown' onclick="addLine(1)">+</p></th>	</tr>
		          	</table>
		          	
		        <table class="bodyFR01" id='FR01_BOTTOM'>
					<tr>
					<th colspan="7">냉장실</th>
					</tr>
					<tr>
					<th>품명</th>
					<th>가격</th>
					<th>구매일</th>
					<th>유통기한</th>
					<th>개수/용량</th>
					<th>수정</th>
					</tr>
					<c:forEach var="i" begin="1" end="5">
		          	<tr id='br_${i}'>
		          	<th><input class="wi_1" type='text' name='fnm'></th>
		          	<th><input class="wi_2" type='text' name='price'></th>
		          	<th><input class="wi_2" type="date" name='bdt'></th>
		          	<th><input class="wi_2" type='date' name='fdt'></th>
		          	<th><input class="wi_2" type='text' name='vm'></th>
		          	<th><p class='wi_2 btn_brown' onclick="delLine2(${i});">삭제</p></th>
		          	</tr>
		          	</c:forEach>
		          	<tr id='addbtn2'><th colspan="7"><p class='btn_brown' onclick="addLine(2)">+</p></th>	</tr>
		          	</table>
</form>		          	
<a href='#' onclick="insertD();">등록하기</a>
</c:when>
</c:choose>
	
</body>
</html>