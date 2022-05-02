<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" uri="myFunc"%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fr01</title>
</head>

<body>
<style>
.wi_1{ width: 100%;}
.wi_2{ width: 100%;}
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
	$("#FR01_TOP").append("<tr id='tr_"+ line1 +"'>" +"</th><th><input class='wi_1' type='text' name='fnmL'></th>" +
			"<th><input class='wi_2' type='text' name='priceL'  disabled='disabled'></th>	<th><input class='wi_2' type='date' name='bdtL' disabled='disabled'></th>"
			+"<th><input class='wi_2' type='date' name='fdtL' disabled='disabled'></th>"
			+"<th><input class='wi_2' type='text' name='vmL' disabled='disabled'></th>"
			+"<th><p class='wi_2 btn_brown' onclick='delLine1("+ line1 +")'>삭제</p></th></tr>");
	$("#FR01_TOP").append("<tr id='addbtn1'><th colspan='7'><p class='btn_brown' onclick='addLine(1)'>+</p></th>	</tr>");	
       line1 ++;
	}else if(tp == 2){
		$("#addbtn2").remove();
		$("#FR01_BOTTOM").append("<tr id='br_"+ line2 +"'>" +"</th><th><input class='wi_1' type='text' name='fnmL'></th>" +
				"<th><input class='wi_2' type='text' name='priceL' disabled='disabled'></th>	<th><input class='wi_2' type='date' name='bdtL' disabled='disabled'></th>"
				+"<th><input class='wi_2' type='date' name='fdtL' disabled='disabled'></th>"
				+"<th><input class='wi_2' type='text' name='vmL' disabled='disabled'></th>"
				+"<th><p class='wi_2 btn_brown' onclick='delLine2("+ line2 +")''>삭제</p></th></tr>");
		$("#FR01_BOTTOM").append("<tr id='addbtn2'><th colspan='7'><p class='btn_brown' onclick='addLine(2)'>+</p></th>	</tr>");	
	       line2 ++;
	}
}

function insertD(){
	
	if(confirm("등록하시겠습니까??")){
		
		// 식재료명 중에 작성안한 input은 null값 인식되지 않도록 disabled 값 주기
		var vv = [];
		$( "input[class='wi_1']").each( function ( i ) {
			vv.push( $( this ).val() );
			if ($(this).val()== "" || $(this).val() == null || $(this).val() == undefined || ( $(this).val() != null && typeof $(this).val() == "object" && !Object.keys($(this).val()).length )){
				$( this ).attr('disabled','true');
				
			}
		} );
				
		var frm = document.frmReg;
		
		var arrfnmL = [];
		$( "input[name='fnmL']").each( function ( i ) {
			arrfnmL.push( $( this ).val() );
		} );
		
		//arrfnmL  = arrfnmL.filter(function(item) {
		//	  return item !== null && item !== undefined && item !== '';
		//	});
		
		
		
		console.log(arrfnmL);
		
		frm.fnmL.value = arrfnmL;
		
		frm.submit();
		
	 // 여기부터
		
		
	}
}

$(document).ready(function() {
	// 음식이름 쓰지 않으면 다른 항목 전부 입력 제한
	
});

function chkEpy(id, index){

	console.log($("#"+ id).val());
		console.log("들어왔다");
	var vv = $("#"+ id).val();
	if(vv == "" || vv == null || vv == undefined || ( vv != null && typeof vv == "object" && !Object.keys(vv).length )){
		console.log("들어왔다3");
		$("#price"+ index).attr('disabled','true');
		$("#bdt"+ index).attr('disabled','true');
		$("#fdt"+ index).attr('disabled','true');
		$("#vm"+ index).attr('disabled','true');

		$("#price"+ index).val("");
		$("#bdt"+ index).val("");
		$("#fdt"+ index).val("");
		$("#vm"+ index).val("");
	}else{
		console.log("들어왔다2");
		$("#price"+ index).removeAttr( 'disabled' );
		$("#bdt"+ index).removeAttr( 'disabled' );
		$("#fdt"+ index).removeAttr( 'disabled' );
		$("#vm"+ index).removeAttr( 'disabled' );
	}
}
</script>

<c:choose>
<c:when test="${fn:length(arrList) == 0}">
	<form name="frmReg${st.index}" class='boder-black' method="post" action="fr01Insert.do">
<input type="hidden" name='jidx' value='${vo.jidx}'/>
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
		          	<th><input class="wi_1" type='text' name='fnmL' id='fnm${i}' onchange="chkEpy('fnm${i}', '${i}');"><input class="wi_1" type="hidden" name='fAreaL' value="TP01"></th>
		          	<th><input class="wi_2" type='text' name='priceL' id='price${i}' disabled="disabled"></th>
		          	<th><input class="wi_2" type="date" name='bdtL' id='bdt${i}' disabled="disabled"></th>
		          	<th><input class="wi_2" type='date' name='fdtL' id='fdt${i}' disabled="disabled"></th>
		          	<th><input class="wi_2" type='text' name='vmL' id='vm${i}' disabled="disabled"></th>
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
		          	<th><input class="wi_1" type='text' name='fnmL' id='fnm2${i}' onchange="chkEpy('fnm2${i}', '2${i}');"></th>
		          	<th><input class="wi_2" type='text' name='priceL' id='price2${i}' disabled="disabled" ></th>
		          	<th><input class="wi_2" type="date" name='bdtL' id='bdt2${i}' disabled="disabled"></th>
		          	<th><input class="wi_2" type='date' name='fdtL' id='fdt2${i}' disabled="disabled"></th>
		          	<th><input class="wi_2" type='text' name='vmL'  id='vm2${i}' disabled="disabled"></th>
		          	<th><p class='wi_2 btn_brown' onclick="delLine2(${i});">삭제</p></th>
		          	</tr>
		          	</c:forEach>
		          	<tr id='addbtn2'><th colspan="7"><p class='btn_brown' onclick="addLine(2)">+</p></th>	</tr>
		          	</table>
</form>		          	
<a href='#' onclick="insertD();">등록하기</a>
</c:when>
<c:when test="${fn:length(arrList) != 0}">

<form name="frmReg${st.index}" class='boder-black' method="post" action="fr01Insert.do">
<input type="hidden" name='jidx' value='${vo.jidx}'/>
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
					
					
					<c:forEach items="${arrList}" var='arr' varStatus="st">
					<tr id='tr_${st}'>
		          	<th><input class="wi_1" type='text' name='fnmL' id='fnm${st}' value="${arr.fnm}" onchange="chkEpy('fnm${st}', '${st}');">
		          	<input class="wi_1" type="hidden" name='fAreaL' value="TP01"></th>
		          	<th><input class="wi_2" type='text' name='priceL' id='price${st}' disabled="disabled"></th>
		          	<th><input class="wi_2" type="date" name='bdtL' id='bdt${st}' disabled="disabled"></th>
		          	<th><input class="wi_2" type='date' name='fdtL' id='fdt${st}' disabled="disabled"></th>
		          	<th><input class="wi_2" type='text' name='vmL' id='vm${st}' disabled="disabled"></th>
		          	<th><a class='wi_2 btn_brown' onclick="delLine1(${st});">삭제</a></th>
		          	</tr>
		          	</c:forEach>
					
					<c:forEach var="i" begin="1" end="5">
		          	<tr id='tr_${i}'>
		          	<th><input class="wi_1" type='text' name='fnmL' id='fnm${i}' onchange="chkEpy('fnm${i}', '${i}');"><input class="wi_1" type="hidden" name='fAreaL' value="TP01"></th>
		          	<th><input class="wi_2" type='text' name='priceL' id='price${i}' disabled="disabled"></th>
		          	<th><input class="wi_2" type="date" name='bdtL' id='bdt${i}' disabled="disabled"></th>
		          	<th><input class="wi_2" type='date' name='fdtL' id='fdt${i}' disabled="disabled"></th>
		          	<th><input class="wi_2" type='text' name='vmL' id='vm${i}' disabled="disabled"></th>
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
		          	<th><input class="wi_1" type='text' name='fnmL' id='fnm2${i}' onchange="chkEpy('fnm2${i}', '2${i}');"></th>
		          	<th><input class="wi_2" type='text' name='priceL' id='price2${i}' disabled="disabled" ></th>
		          	<th><input class="wi_2" type="date" name='bdtL' id='bdt2${i}' disabled="disabled"></th>
		          	<th><input class="wi_2" type='date' name='fdtL' id='fdt2${i}' disabled="disabled"></th>
		          	<th><input class="wi_2" type='text' name='vmL'  id='vm2${i}' disabled="disabled"></th>
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