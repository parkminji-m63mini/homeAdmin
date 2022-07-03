<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>fr01</title>
</head>
<style type="text/css">
.ellTxt {
	   display: -webkit-box;
      display: -ms-flexbox;
      margin-top:1px;
      max-height:80px;
      overflow:hidden;
      vertical-align:top;
      text-overflow: ellipsis;
      word-break:break-all;
      -webkit-box-orient:vertical;
      -webkit-line-clamp:1
</style>

<%-- 기능 설명
데이터가 없는 회원이면 간편 등록 방식으로 여러 개 한번에 등록할 수 있음
한번 데이터를 등록한 이후에는 한 개씩 등록 할 수 있는 [상세 등록 버튼]이 생성 되며
이미 등록한 데이터도 [음식명]을 클릭하면 상세등록(보기/수정/삭제)을 할 수 있음
체크 버튼을 통해 음식을 소비했는지 아닌지 체크 -> 소비한 음식은(체크된 데이터) 기본적으로 보이지 않음. 다른 메뉴를 통해 볼 수 있음 (삭제 하지 않음)



 --%>
 <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<body>

<script type="text/javascript">

var line1 = 6;
var line2 = 6;

function delLine1(id){

	$("#tr_"+ id).remove();
}
function delLine2(id){

	$("#br_"+ id).remove();
}

function addLineNew(tp){
	if(tp == 1){
	$("#addbtn1").remove();
	$("#FR01_TOP").append("<tr id='tr_"+ line1 +"'>" +"</th>" +
			"<th><input class='wi_1' type='text' name='fnmL'></th>" +
			"<th><input class='wi_2' type='text' name='priceL'  disabled='disabled'></th>	"
			+"<th><input class='wi_2' type='date' name='fdtL' disabled='disabled'></th>"
			+"<th><input class='wi_2' type='text' name='vmL' disabled='disabled'></th>"
			+"<th><p class='wi_2 btn_brown' onclick='delLine1("+ line1 +")'>-</p></th></tr>");
	$("#FR01_TOP").append("<tr id='addbtn1'><th colspan='7'><p class='btn_brown' onclick='addLineNew(1)'>+</p></th>	</tr>");	
       line1 ++;
	}else if(tp == 2){
		$("#addbtn2").remove();
		$("#FR01_BOTTOM").append("<tr id='br_"+ line2 +"'>" +"</th>" +
				"<th><input class='wi_1' type='text' name='fnmL'></th>" +
				"<th><input class='wi_2' type='text' name='priceL' disabled='disabled'></th>	"
				+"<th><input class='wi_2' type='date' name='fdtL' disabled='disabled'></th>"
				+"<th><input class='wi_2' type='text' name='vmL' disabled='disabled'></th>"
				+"<th><p class='wi_2 btn_brown' onclick='delLine2("+ line2 +")''>-</p></th></tr>");
		$("#FR01_BOTTOM").append("<tr id='addbtn2'><th colspan='7'><p class='btn_brown' onclick='addLineNew(2)'>+</p></th>	</tr>");	
	       line2 ++;
	}
}


function addLine(tp){
	if(tp == 1){
	$("#addbtn1").remove();
	$("#FR01_TOP").append("<tr id='tr_"+ line1 +"'>" +"</th>"
			+ "<th><input type='checkbox' disabled='disabled'/></th> "+
			"<th><input class='wi_1' type='text' name='fnmL'></th>" +
			"<th><input class='wi_2' type='text' name='priceL'  disabled='disabled'></th>	"
			+"<th><input class='wi_2' type='date' name='fdtL' disabled='disabled'></th>"
			+"<th><input class='wi_2' type='text' name='vmL' disabled='disabled'></th>"
			+"<th><p class='wi_2 btn_brown' onclick='delLine1("+ line1 +")'>-</p></th></tr>");
	$("#FR01_TOP").append("<tr id='addbtn1'><th colspan='7'><p class='btn_brown' onclick='addLine(1)'>+</p></th>	</tr>");	
       line1 ++;
	}else if(tp == 2){
		$("#addbtn2").remove();
		$("#FR01_BOTTOM").append("<tr id='br_"+ line2 +"'>" +"</th>"
				+ "<th><input type='checkbox' disabled='disabled'/></th> "+
				"<th><input class='wi_1' type='text' name='fnmL'></th>" +
				"<th><input class='wi_2' type='text' name='priceL' disabled='disabled'></th>	"
				+"<th><input class='wi_2' type='date' name='fdtL' disabled='disabled'></th>"
				+"<th><input class='wi_2' type='text' name='vmL' disabled='disabled'></th>"
				+"<th><p class='wi_2 btn_brown' onclick='delLine2("+ line2 +")''>-</p></th></tr>");
		$("#FR01_BOTTOM").append("<tr id='addbtn2'><th colspan='7'><p class='btn_brown' onclick='addLine(2)'>+</p></th>	</tr>");	
	       line2 ++;
	}
}

function insertD(){
	
	if(confirm("등록하시겠습니까??")){
		
		// 식재료명 중에 작성안한 input은 null값 인식되지 않도록 disabled 값 주기
		var vv = [];
		$( "input[name='fnmL']").each( function ( i ) {
			vv.push( $( this ).val() );
			if ($(this).val()== "" || $(this).val() == null || $(this).val() == undefined || ( $(this).val() != null && typeof $(this).val() == "object" && !Object.keys($(this).val()).length )){
				$( this ).attr('disabled','true');
				$( this ).next().attr('disabled','true');
				
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


// 실시간으로 사용 체크 하기
function chkState(idx){
	
	console.log("체크");
	
	var chk ;
	
	if($("#" + idx).is(':checked') == true) chk = '1';
	else chk = '0';
	
		$.ajax({
			type : "post",
			dataType : "text", 
			 traditional : true,
			url : "updateChk.do",
			data : {
				jidx : ${vo.jidx},
				idx: idx, 
				chk: chk
			},
			success : function(result){
				alert("수정완료");
				reload();
			},
			error : function(result){
				errMsg(result);
			}
		});
	
		
	
}

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
		$("#idx"+ index).attr('disabled','true');
		$("#chk"+ index).attr('disabled','true');
// chk도 구현
		$("#price"+ index).val("");
		$("#bdt"+ index).val("");
		$("#fdt"+ index).val("");
		$("#vm"+ index).val("");
		$("#idx"+ index).val("");
		$("#chk"+ index).val("");
	}else{
		console.log("들어왔다2");
		console.log($("#idx"+ index).val() + " ///");
		
		$("#price"+ index).removeAttr( 'disabled' );
		$("#bdt"+ index).removeAttr( 'disabled' );
		$("#fdt"+ index).removeAttr( 'disabled' );
		$("#vm"+ index).removeAttr( 'disabled' );
		$("#idx"+ index).removeAttr( 'disabled' );
		$("#chk"+ index).removeAttr( 'disabled' );
	}
}






// 수정 모드로 전환
//수정 버튼을 눌렀을 때, 입력폼으로 전환
function editM(tp){
	if($("#upbtn").text() == "등록"){
		if(confirm("등록하시겠습니까?")){
			
			/* 그냥 form 액션
			if(index == 0)var frm = document.forms[0];
			if(index == 1)var frm = document.forms[1];
			
					frm.action = 'updateMAll.do';
					frm.target = "frmSys";
					frm.meth  class=''od = 'post';
					frm.submit();
					
					
					$(".nomalFrom").css("display", "inline");
					$(".upFrom").css("display", "none");
					$("#upbtn").val("수정");
					
					reload();
			 form 액션 종료 */
			 
			 // 음 필요없을지도?
					 
			
					 
			// 식재료명 중에 작성안한 input은 null값 인식되지 않도록 disabled 값 주기
		var vv = [];
		$( "input[name='fnmL']").each( function ( i ) {
			vv.push( $( this ).val() );
			if ($(this).val()== "" || $(this).val() == null || $(this).val() == undefined || ( $(this).val() != null && typeof $(this).val() == "object" && !Object.keys($(this).val()).length )){
				$( this ).attr('disabled','true');
				$( this ).next().attr('disabled','true');
				
			}
		} );
		
			 var arridx = [];
			 var arrchk = [];
			 var arrfnmL = [];
			 var arrpriceL = [];
			// var arrbdtL = [];
			 var arrfdtL = [];
			 var arrvmL = [];
			 var arrfAreaL = [];
			 
		$( "input[name='idx']").each( function ( i ) {
			
			if($(this).attr('disabled') != 'disabled'){
			arridx.push( $( this ).val());
			}
		} );
		
		
		$( "input[name='chk']").each( function ( i ) {
			
			if($(this).is(':checked') == true){
				arrchk.push('1');
			}else{
				arrchk.push('0');	
			}
		} );
		
		
		$( "input[name='fnmL']").each( function ( i ) {
			
			if ($(this).val()== "" || $(this).val() == null || $(this).val() == undefined || ( $(this).val() != null && typeof $(this).val() == "object" && !Object.keys($(this).val()).length )){
				
			}else{
			arrfnmL.push( $( this ).val() );
			}
		} );
		
		$( "input[name='priceL']").each( function ( i ) {
			if($(this).attr('disabled') != 'disabled'){
			arrpriceL.push( $( this ).val() );
			}
		} );	
		
		/*
		$( "input[name='bdtL']").each( function ( i ) {
			if($(this).attr('disabled') != 'disabled'){
			arrbdtL.push( $( this ).val() );
			}
		} );
		*/
		$( "input[name='fdtL']").each( function ( i ) {
			if($(this).attr('disabled') != 'disabled'){
			arrfdtL.push( $( this ).val() );
			}
		} );		 
		$( "input[name='vmL']").each( function ( i ) {
			if($(this).attr('disabled') != 'disabled'){
			arrvmL.push( $( this ).val() );
			}
		} );		 
		$( "input[name='fAreaL']").each( function ( i ) {
			if($(this).attr('disabled') != 'disabled'){
			arrfAreaL.push( $( this ).val() );
			}
		} );		 
					 
			
		console.log(arrfAreaL + " / fAreaL");
		console.log(arrfnmL + " / arrfnmL");
		console.log(arridx + " / arridx");
		
		
			$.ajax({
				type : "post",
				dataType : "text", 
				 async : false,
				 traditional : true,
				url : "update.do",
				data : {
					jidx : ${vo.jidx},
					idxL: arridx, 
				//	chkL: arrchk, 
					fnmL: arrfnmL, 
					priceL: arrpriceL, 
				//	bdtL: arrbdtL, 
					fdtL: arrfdtL, 
					vmL: arrvmL, 
					fAreaL: arrfAreaL
				},
				success : function(result){
					alert("등록완료");
					location.href='index.do?mode='+ ${vo.mode};
				},
				error : function(result){
					errMsg(result);
				}
			});
		
		
			 
		}
		return;
	}
	$(".nomalFrom").css("display", "none");
	$(".upFrom").removeAttr("style");
	$(".delBtn").css("float", "right");
	$("#upbtn").text("등록");
	
}

function reload() { (location || window.location || document.location).reload(); }

// 한번에 체크 후 삭제
function del(){
	
	var arridx = [] ;
	
	// 체크된 항목이 있는지 확인
	if($( "input[name='idx']").is(':checked') == true){
		
		console.log("체크된 항목 있음");
		
		if(confirm("삭제하시겠습니까?")){
			
		$( "input[name='idx']").each( function ( i ) {
		
			if($(this).is(':checked') == true){
			arridx.push( $( this ).val());
			}
		} );
		
		$.ajax({
			type : "post",
			dataType : "text", 
			 async : false,
			 traditional : true,
			url : "delete.do",
			data : {
				jidx : ${vo.jidx},
				idxL: arridx 
			},
			success : function(result){
				alert("삭제완료");
				reload();
			},
			error : function(result){
				errMsg(result);
			}
		});
		
		}
	}else{
		alert("삭제할 목록을 선택후 삭제해주세요.");
	}
}

function usingF(date){
	location.href='index.do?mode=' + date;
}
</script>
<c:choose>
<c:when test="${fn:length(arrListTop) == 0}">
	<form name="frmReg" class='' method="post" action="fr01Insert.do">
<input type="hidden" name='jidx' value='${vo.jidx}'/>
				
				<table class="bodyFR01" id='FR01_TOP'>
					
					<tr>
					<th colspan="6">
					<c:if test="${fn:length(arrListBottom) != 0}">
					<c:if test="${vo.mode eq '0'}">
					<a href='javascript:usingF(1);' style="float: left;">사용 완료 식재료</a>
					</c:if>
					<c:if test="${vo.mode != '0' }">
					<a href='javascript:usingF(0);' style="float: left;">돌아가기</a>
					</c:if>
					</c:if>
					<c:if test="${fn:length(arrListBottom) == 0 && vo.mode != '0' }">
					<a href='javascript:usingF(0);' style="float: left;">돌아가기</a>
					</c:if>
					냉동실
					<c:if test="${fn:length(arrListBottom) != 0}">
					<a href='view.do?jidx=${vo.jidx}&idx=0&area=TP01&tp=FR01&mode=${vo.mode}' style="float: right;">새로 만들기</a>
					</c:if>
					</th>
					</tr>
					<tr>
					<th>품명</th>
					<th>가격</th>
					<th>유통기한</th>
					<th>비고</th>
					<th>수정</th>
					</tr>
					<c:choose>
					<c:when test="${fn:length(arrListBottom) != 0}">
					<tr><th colspan="6"><div class="nodate">데이터가 없습니다</div></th></tr>
					</c:when>
					<c:when test="${fn:length(arrListBottom) == 0}">
						<c:if test="${vo.mode != '0' }">
						<tr><th colspan="6"><div class="nodate">데이터가 없습니다</div></th></tr>
						</c:if>
						<c:if test="${vo.mode == '0' }">
						<c:forEach var="i" begin="1" end="5">
			          	<tr id='tr_${i}'>
			          	<th><input class="wi_1" type='text' name='fnmL' id='fnm${i}' onchange="chkEpy('fnm${i}', '${i}');"><input class="wi_1" type="hidden" name='fAreaL' value="TP01"></th>
			          	<th><input class="wi_2" type='text' name='priceL' id='price${i}' disabled="disabled"></th>
			          	<th><input class="wi_2" type='date' name='fdtL' id='fdt${i}' disabled="disabled"></th>
			          	<th><input class="wi_2" type='text' name='vmL' id='vm${i}' disabled="disabled"></th>
			          	<th><a class='wi_2 btn_brown delbtn' onclick="delLine1(${i});">-</a></th>
			          	</tr>
			          	</c:forEach>
			          	<tr id='addbtn1'><th colspan="6"><p class='btn_brown' onclick="addLineNew(1)">+</p></th>	</tr>
			          	</c:if>
					</c:when>
					</c:choose>
					
		          	</table>
          	
</c:when>
<c:when test="${fn:length(arrListTop) != 0}">

<form name="frmReg${st.index}" class='' method="post" action="fr01Insert.do">
<input type="hidden" name='jidx' value='${vo.jidx}'/>
					<c:if test="${vo.mode eq '0'}">
					<a  class='nomalFrom' href='javascript:usingF(1);' style="float: left;">사용 완료 식재료</a>
					<a  class='upFrom fleft' href='javascript:usingF(0);' style="display: none;">돌아가기</a>
					</c:if>
					<c:if test="${vo.mode != '0' }">
					<a  class='nomalFrom' href='javascript:usingF(0);' style="float: left;">돌아가기</a>
					<a  class='upFrom' href='javascript:usingF(1);' style="float: left; display: none;">돌아가기</a>
					</c:if>
					<a class='nomalFrom' href='view.do?jidx=${vo.jidx}&idx=0&area=TP01&tp=FR01&mode=${vo.mode}' style="float: right;">새로 만들기</a>
				<table class="bodyFR01" id='FR01_TOP' >
				<colgroup>
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
					</colgroup>
					<thead>
					<tr>
					<th colspan="6">
					냉동실</th>
					</tr>
					
					</thead>
					<tbody class="top">
					<tr>
					<th  class='upFrom' style="display: none;">선택</th>
					<th class='nomalFrom'>사용 완료</th>
					<th>품명</th>
					<th>가격</th>
					<th>유통기한</th>
					<th>비고</th>
					<th  class='upFrom' style="display: none;">삭제</th>
					</tr>
					
					
					<c:forEach items="${arrListTop}" var='arr' varStatus="st">
					<tr id='tr_${st}' class='nomalFrom'>
					<th><input type="hidden"  value="${arr.idx}"/>  
						<input type="checkbox" id="${arr.idx}" onchange="chkState(${arr.idx});" <c:if test="${arr.chk eq '1'.charAt(0) }">checked="checked"</c:if>/></th>
		          	<th><a href='view.do?idx=${arr.idx}&mode=${vo.mode}'>${arr.fnm}</a></th>
		          	<th>${arr.price}</th>
		          	<th><c:if test='${arr.fdt ne "0000-00-00"}'>${fn:substring(arr.fdt,2,10)}</c:if></th>
		          	<th>${arr.vm}</th>
		          	</tr>
		          	
		          	<tr id='tr_${st}' class='upFrom' style="display: none;">
		          	<th><input type="checkbox" name='idx' value="${arr.idx}"/></th>
		          	<th><input class="wi_1" type='text' name='fnmL' id='fnm${st}' value='${arr.fnm}' onchange="chkEpy('fnm${st}', '${st}');"/><input class="wi_1" type="hidden" name='fAreaL' value="TP01"></th>
		          	<th><input class="wi_2" type='text' name='priceL' id='price${st}' value="${arr.price}" ></th>
		          	<th><input class="wi_2" type='date' name='fdtL' id='fdt${st}' value="${arr.fdt}" ></th>
		          	<th><input class="wi_2" type='text' name='vmL' id='vm${st}' value="${arr.vm}"></th>
		          	</tr>
		          	</c:forEach>
					
					<c:forEach var="i" begin="1" end="3">
		          	<tr class='upFrom' style="display: none;" id='tr_${i}'>
		          	<th><input type="checkbox" name='idx' id='idx${i}' value="0" disabled="disabled"/></th>
		          	<th><input class="wi_1" type='text' name='fnmL' id='fnm${i}' onchange="chkEpy('fnm${i}', '${i}');"><input class="wi_1" type="hidden" name='fAreaL' value="TP01"></th>
		          	<th><input class="wi_2" type='text' name='priceL' id='price${i}' disabled="disabled"></th>
		          	<th><input class="wi_2" type='date' name='fdtL' id='fdt${i}' disabled="disabled"></th>
		          	<th><input class="wi_2" type='text' name='vmL' id='vm${i}' disabled="disabled"></th>
		          	<th><a class='wi_2 btn_brown delbtn' onclick="delLine1(${i});">-</a></th>
		          	</tr>
		          	</c:forEach>
		          	<tr id='addbtn1' class='upFrom' style="display: none;"><th colspan="8"><p class='btn_brown' onclick="addLine(1)">+</p></th>	</tr>
					
<!--  		          	<tr id='addbtn1'><th colspan="6"><p class='btn_brown' onclick="addLine(1)">+</p></th>	</tr> -->
		          	</tbody>
		          	</table>
		          	
		          	<div>
		          	<c:if test="${fn:length(arrListBottom) == 0}">
		          	<p class='btn_brown' onclick="editM(1)" id='upbtn'>간편 수정</p>
		          	<p  class='upFrom btn_brown' style="display: none;"  onclick="del()" id='upBtn'>삭제</p>
		          	</c:if>
		          	</div>
     	</form>		          	


</c:when>
</c:choose>
<c:choose>
<c:when test="${fn:length(arrListBottom) == 0}">

				<input type="hidden" name='jidx' value='${vo.jidx}'/>
					 <table class="bodyFR01" id='FR01_BOTTOM'>
					 <colgroup>
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
					</colgroup>
					<tr>
					<th colspan="6">냉장실</th>
					</tr>
					<tr>
					<th>품명</th>
					<th>가격</th>
					<th>유통기한</th>
					<th>비고</th>
					<th>수정</th>
					</tr>
					<c:choose>
					<c:when test="${fn:length(arrListTop) != 0}">
					<tr><th colspan="6"><div class="nodate">데이터가 없습니다</div></th></tr>
					</c:when>
					<c:when test="${fn:length(arrListTop) == 0}">
					<c:if test="${vo.mode != '0' }">
					<tr><th colspan="6"><div class="nodate">데이터가 없습니다</div></th></tr>
					</c:if>
					<c:if test="${vo.mode == '0' }">
					<c:forEach var="i" begin="1" end="5">
		          	<tr id='br_${i}'>
		          	<th><input class="wi_1" type='text' name='fnmL' id='fnm2${i}' onchange="chkEpy('fnm2${i}', '2${i}');"><input class="wi_1" type="hidden" name='fAreaL' value="TP02"></th>
		          	<th><input class="wi_2" type='text' name='priceL' id='price2${i}' disabled="disabled" ></th>
		          	<th><input class="wi_2" type='date' name='fdtL' id='fdt2${i}' disabled="disabled"></th>
		          	<th><input class="wi_2" type='text' name='vmL'  id='vm2${i}' disabled="disabled"></th>
		          	<th><p class='wi_2 btn_brown delbtn' onclick="delLine2(${i});">-</p></th>
		          	</tr>
		          	</c:forEach>
		          	<tr id='addbtn2'><th colspan="6"><p class='btn_brown' onclick="addLineNew(2)">+</p></th>	</tr>
		          	</c:if>
		          	</c:when>
		          	</c:choose>
		          	</table>
          	</form>
          	<a href='#'  class="upbtn btn btn-primary-1"  onclick="insertD();">등록하기</a>
</c:when>
<c:when test="${fn:length(arrListBottom) != 0}">
	
<form name="frmReg${st.index}" class='' method="post" action="fr01Insert.do">
<input type="hidden" name='jidx' value='${vo.jidx}'/>
				<table class="bodyFR01" id='FR01_BOTTOM'>
					 <colgroup>
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
						<col style="width: 20%;">
					</colgroup>
					<thead>
					<tr>
					<th colspan="6">
					냉장실</th>
					</tr>
					
					</thead>
					<tbody class="top">
					<tr>
					<th  class='upFrom' style="display: none;">선택</th>
					<th class='nomalFrom'>사용 완료</th>
					<th>품명</th>
					<th>가격</th>
					<th>유통기한</th>
					<th>비고</th>
					<th  class='upFrom' style="display: none;">삭제</th>
					</tr>
					
					
					<c:forEach items="${arrListBottom}" var='arr' varStatus="st">
					<tr id='tr_${st}' class='nomalFrom'>
					<th><input type="hidden"  value="${arr.idx}"/>  <input type="checkbox" id="${arr.idx}" onchange="chkState(${arr.idx});"  <c:if test="${arr.chk eq '1'.charAt(0) }">checked="checked"</c:if>/></th>
		          	<th><p class='ellTxt' style=" margin: 0;"><a href='view.do?idx=${arr.idx}&mode=${vo.mode}' >${arr.fnm}</a></p></th>
		          	<th>${arr.price}</th>
		          	<th><c:if test='${arr.fdt ne "0000-00-00"}'>${fn:substring(arr.fdt,2,10)}</c:if></th>
		          	<th>${arr.vm}</th>
		          	</tr>
		          	
		          	<tr id='tr_${st}' class='upFrom' style="display: none;">
		          	<th><input type="checkbox" name='idx' value="${arr.idx}"/></th>
		          	<th><input class="wi_1" type='text' name='fnmL' id='fnm${st}2' value='${arr.fnm}' onchange="chkEpy('fnm${st}2', '${st}2');"/><input class="wi_1" type="hidden" name='fAreaL' value="TP02"></th>
		          	<th><input class="wi_2" type='text' name='priceL' id='price${st}2' value="${arr.price}" ></th>
		          	<th><input class="wi_2" type='date' name='fdtL' id='fdt${st}2' value="${arr.fdt}" ></th>
		          	<th><input class="wi_2" type='text' name='vmL' id='vm${st}2' value="${arr.vm}"></th>
		          	</tr>
		          	</c:forEach>
					
					<c:forEach var="i" begin="1" end="3">
		          	<tr class='upFrom' style="display: none;" id='tr_${i}'>
		          	<th><input type="checkbox" name='idx' id='idx${i}2' value="0" disabled="disabled"/></th>
		          	<th><input class="wi_1" type='text' name='fnmL' id='fnm${i}2' onchange="chkEpy('fnm${i}2', '${i}2');"><input class="wi_1" type="hidden" name='fAreaL' value="TP02"></th>
		          	<th><input class="wi_2" type='text' name='priceL' id='price${i}2' disabled="disabled"></th>
		          	<th><input class="wi_2" type='date' name='fdtL' id='fdt${i}2' disabled="disabled"></th>
		          	<th><input class="wi_2" type='text' name='vmL' id='vm${i}2' disabled="disabled"></th>
		          	<th><a class='wi_2 btn_brown delbtn' onclick="delLine1(${i}2);">-</a></th>
		          	</tr>
		          	</c:forEach>
		          	<tr id='addbtn2' class='upFrom' style="display: none;"><th colspan="8"><p class='btn_brown' onclick="addLine(2)">+</p></th>	</tr>
					
<!--  		          	<tr id='addbtn1'><th colspan="6"><p class='btn_brown' onclick="addLine(1)">+</p></th>	</tr> -->
					</tbody>
		          	</table>
		          	
		          	<div>
		          	<p class="upbtn btn btn-primary-1" onclick="editM(1)" id='upbtn'>간편 수정</p>
		          	<p  class='delBtn upFrom  btn btn-danger'style=" display: none; float: none;"  onclick="del()" id='upBtn'>삭제</p>
		          	</div>
     	</form>		          	


</c:when>
</c:choose>
	
</body>
</html>