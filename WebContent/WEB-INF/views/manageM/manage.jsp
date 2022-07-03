<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="kn">
<head>

<meta charset="UTF-8">
<title>공과금 - 관리비</title>
</head>
<!--  차트 -->
<%-- <script src="${contextPath}/resources/css/chart/highcharts.js"></script> --%>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
 <link href="${contextPath}/resources/css/chart/chart.css" rel="stylesheet">
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	
	<!-- 차트 -->
	<jsp:include page="/WEB-INF/views/common/chart.jsp"/>
	
	<link rel="stylesheet" href="${contextPath}/resources/css/common.css">	
<body>

<script type="text/javascript">
$(document).ready(function(){
	
	
	//input에  onlyNumber 추가하면 자동으로 숫자만 들어가게 함
	$('input[onlyNumber]').on('keyup', function () {
			console.log("들어옴");
		    $(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
	//------------------------------
	
	
	
	if($("input[name='autoM']:checked").val() == 'Y'){
		$("#showAuto").css("display", "inline");
	}
	
	$("input[name='autoM']").click(function(){
		
		if($("input[name='autoM']:checked").val() == 'Y'){
			$(".showAuto").css("display", "inline");
			$(".showAutoT").css("display", "table-row");
		}else if($("input[name='autoM']:checked").val() == 'N'){
			$(".showAuto").css("display", "none");
			$(".showAutoT").css("display", "none");
		}
		
	});


	
// 차트 x축 컬럼 이름
var list;

list =['총 합계'];

// 전월, 당월
chart1("column", '전월 vs 당월','(전월) ${arrViewPast[0].yyyy}년도 ${arrViewPast[0].mm}월 | (당월) ${arrViewPast[1].yyyy}년도 ${arrViewPast[1].mm}월 ', list ); // ${arrViewPast}
//차트타입, 타이틀, 서브타이들, x축 컬럼명


var cList = ["line","column"]; 
var  rList = ["총 사용료", "총 사용료"]; 



// 1년
chart12('최근 12개월','${my:NVL(arrViewPast12[0].yyyy, 0)}년도 ${my:NVL(arrViewPast12[0].mm, 0)}월 ~${arrViewPast12[12].yyyy}년도 ${arrViewPast12[12].mm}월  ',cList, rList );
//타이틀, 서브타이들,  type 배열 리스트, x컬럼 데이터
// 반복횟수는 컨트롤러에서 세팅
// ${arrViewPast12}

});


function show(){
	if(	$("#passY").text() == "▲"){
	$("#passYT").css("display","none");
	$("#passYTD").css("display","none");
	$("#passY").text(">> 작년에는 얼마 썼을까?");
	$(".savingDiv").css("display","revert");
	}else{
	$("#passYT").css("display","table");
	$("#passYTD").css("display","inline-block");
	$("#passY").text("▲");
	$('.savingDiv').css("display","none");
	}
}

function showMore(){
	if(	$("#more").text() == "▲"){
	$("#moreD").css("display","none");
	$("#more").text("자세히 비교 >>");
	}else{
	$("#more").text("▲");
	$("#moreD").css("display","inline-block");
	}
}

function showMoreD(){
	if(	$("#moreData").text() == "▲"){
	$("#moreDData").css("display","none");
	$("#moreData").text("。。。");
	}else{
	$("#moreData").text("▲");
	$("#moreDData").css("display","inline-block");
	}
}

function addLineNew(tp){
	if(tp == 1){
	$("#addbtn1").remove();
	$("#table").append("<tr id='tr_'>" +"<th class='ContD'>" +
			"<span class=' upForm ' >"+
			"<input class='disInBlImpor' type='checkbox' name='idxL2' value='0'><input type='hidden' name='idxL' value='0'/>" +
			"<input class='form-control disInBlImpor width85' type='text' id='jiT' name='jiT'/></span></th><tr>" +
			"<th class='subContCenter'><span class='upForm' ><input onchange='chkNum()' onlyNumber class='manageI form-control moneyInputWon'  type='text' name='jiM' id='jiM'></span>원</th>"
			+"</tr>");
	$("#table").append("<tr id='addbtn1'><th colspan='3'><p class='btn_brown' onclick='addLineNew(1)'>+</p></th>	</tr>");	
	}
	
}

function del(){
	
	
var arridx = [] ;
	
	// 체크된 항목이 있는지 확인
	if($( "input[name='idxL2']").is(':checked') == true){
		
		console.log("체크된 항목 있음");
		
		if(confirm("삭제하시겠습니까?")){
			
		$( "input[name='idxL2']").each( function ( i ) {
		
			if($(this).is(':checked') == true){
			arridx.push( $( this ).val());
			}
		} );
		
		console.log(arridx);
		
		$.ajax({
			type : "post",
			dataType : "text", 
			 async : false,
			 traditional : true,
			url : "deleteMm.do",
			data : {
				idxL: arridx ,
				jidx: $("input:hidden[name='jidx']").val()
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


function chkNum(){
	console.log("들어옴3");
    $(this).val($(this).val().replace(/[^0-9]/g, ""));
//------------------------------

}	
</script>

<main id="main">

   

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="">

          <div class="">
          
           <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <ol>
          <li><a href="index.html">공과금</a></li>
          <li>관리비</li>
        </ol>

      </div>
    </section><!-- End Breadcrumbs -->
          
					 <div style="margin-bottom: 10px;">
					<select class='form-control yymmBtn' id='yyyyC' name='yyyyC'>
					<option>년도</option>
					<option value="2022" <c:if test='${arrViewNow[0].yyyy eq "2022"}'>selected="selected"</c:if>>2022</option>
					<option value="2021" <c:if test='${arrViewNow[0].yyyy eq "2021"}'>selected="selected"</c:if>>2021</option>
					<option value="2020" <c:if test='${arrViewNow[0].yyyy eq "2020"}'>selected="selected"</c:if>>2020</option>
					<option value="2019" <c:if test='${arrViewNow[0].yyyy eq "2019"}'>selected="selected"</c:if>>2019</option>
					</select>
					
					<select class='form-control yymmBtn' id='mmC' name='mmC'>
					<option>월</option>
					<c:forEach var="i" begin="1" end="12" step="1">
					<option value="${i}"<c:if test='${arrViewNow[0].mm eq i}'>selected="selected"</c:if>>${i}</option>
					</c:forEach>
					</select>
					
					<button class="btn btn-primary-1-no" onclick="schGo();">검색</button>
					
					</div>
					
            <div class="portfolio-info">
              <div class="swiper-wrapper align-items-center">


					<%--이번달 요금 --%>
                <div class="swiper-slide" id='form'>
                	<c:forEach var='arr' items='${arrViewNow}' varStatus="st">
					</c:forEach>
                	 <h3>${arrViewNow[0].yyyy}년도 ${arrViewNow[0].mm}월 관리비 상세요금 <c:if test="${arrViewNow[0].maM ne null || arrViewNow[0].maM ne '0'}">  (<span><fmt:formatNumber value="${my:NVL(arrViewNow[0].maM,0)}" type="number"/>원</span>)</c:if> </h3>
              
                	  <div>
                	  	<table style="width: 100%;">
                	  		<colgroup>
						<col style="width: 30%"/>
						<col style="width: 50%">
						<col style="width: 15%">
					</colgroup>
							 <c:if test="${arrViewNow[0].gChk eq 'Y' }">
							<tr>
                	  			<th colspan="3">
                	  				 <span class="nomalForm" style="font-size: 14px;">
				                	 <c:if test="${arrViewNow[0].gChk eq 'Y'}">
				                	 * 사용요금을  
				                	  <c:if test="${my:NVL(arrViewNow[0].autoWhen,0) ne 0 && arrViewNow[0].autoM eq 'Y'}">
				                	 	${arr.autoWhen}일에
				                	 </c:if>
				                	 <c:if test="${my:NVL(arrViewNow[0].autoHow,'0') ne '0'  && arrViewNow[0].autoM eq 'Y'}">${arrViewNow[0].autoHow}로</c:if> 
				                	 납부했습니다.
				                	
				                	 </c:if>
						                	 
						                	 </span>
		                	  			</th>
		                	  		</tr>
									</c:if>
		                			 <c:if test="${arrViewNow[0].gChk eq 'N' || arrViewNow[0].gChk eq null}">
									<tr>                	  			
	                	  			<th colspan="3">
	                	  			<span class="nomalForm" style="font-size: 14px;">
					                	 * 사용요금을 납부하지 않았습니다
					                	</span>
					                </th>
					                </tr>	 
		                			 </c:if>
								                	  		
                	  		<tr class="upFormTable" style="display: none;">
                	  			<th colspan="4">
                	  			 <span class="upForm" style="display: none;">이번 달 사용요금 지출을 완료하였나요?</span>
                	  			</th>
                	  		</tr>
                	  		
                	  		<tr class="upFormTable" style="display: none;">
                	  			<th colspan="4" class="cen_radio">
                	  			 <span class="upForm " style="display: none;">
                				
	                				 <div class="funkyradio">
							         <div class="funkyradio-primary">
							            <input type="radio" name="gChk" id="gChk1" <c:if test="${arrViewNow[0].gChk eq 'Y'}">checked="checked"</c:if> value="Y" />
							            <label for="gChk1">네</label>
							        </div>
							        <div class="funkyradio-primary">
							            <input type="radio" name="gChk" id="gChk2"<c:if test="${arrViewNow[0].gChk eq 'N'}">checked="checked"</c:if> value="N" />
							            <label for="gChk2">아니오</label>
							        </div>
							        <div class='mar25' ></div>
							        </div>
                				
                				</span> 
                	  			</th>
                	  		</tr>  	 
                	  	  	</table>
                	  </div>
                	
                	
                	<hr>
                	 
                	 
                	 
                	
				
				
				<c:set var='mode' value='u'/>
				<%--<c:if test="${arr.gasM == null && arr.elM == null && arr.wtM == null && arr.itM == null}"> --%>
				<c:if test="${arrViewNow[0].idx == null}"> 
				<c:set var='mode' value='i'/>
				</c:if>
				
                <input type="hidden" value="${arrViewNow[0].idx}" name='idx' id='idx'/>
                <input type="hidden" value="${arrViewNow[0].jidx}" name='jidx' id='jidx'/>
                <input type="hidden" value="${mode}" name='mode' id='mode'/>
                <input type="hidden" value="${arrViewNow[0].yyyy}" name='yyyy' id='yyyy'/>
                <input type="hidden" value="${arrViewNow[0].mm}" name='mm' id='mm'/>
                <input type="hidden" value="${arrViewNow[0].uId}" name='uId' id='uId'/>
                <input type="hidden" value="${arrViewNow[0].gChk}" name='gChk' id='gChk'/>
                	
                	<table id='table' class='' style="width: 100%;">
                	<colgroup>
							<col style="width: 100%">
						</colgroup>
                	<tbody>
                	
					<tr>
						<th  class=' upForm'  style="display: none;">선택</th>
					</tr>
					
						<c:forEach var='arr' items='${arrViewNow}' varStatus="st">						
					<tr>	
						<th  class='ContD'>
						
						
						
						<c:choose>
						<c:when test="${arr.jiT ne null}">
						<span class='nomalForm'>${arr.jiT}</span>
						<span class=' upForm ' style="display: none;" ><input class="disInBlImpor" type="checkbox" id="idx${st}" name="idxL2" value="${my:NVL(arr.idx,'0')}"/>
						<input type="hidden" name="idxL" value="${my:NVL(arr.idx,'0')}"/>
						<input  class='form-control disInBlImpor width85' type="text" id="${st}" name='jiT' value="${arr.jiT}" /></span>
						</c:when>
						<c:otherwise>
						<span class=' upForm ' style="display: none;" ><input type="checkbox"  class="disInBlImpor" id="idx${st}" name="idxL2" value="${my:NVL(arr.idx,'0')}"/>
						<input type="hidden" name="idxL" value="${my:NVL(arr.idx,'0')}"/>
						<input  class='form-control disInBlImpor width85' type="text" name='jiT' value=""/></span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
					<tr>	
							<th  class='subContCenter'>
						<c:if test="${arrViewNow[0].jiM eq null && arrViewNow[0].jiT eq null}">
						<span class=' nomalForm' id='noData' colspan=""  style="font-weight: 100;">데이터 없음</span>
						</c:if>
						<c:choose>
						<c:when test="${arr.jiM ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.jiM}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="jiM"  value="${arr.jiM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="jiM" value="">원</span>
						
						</c:otherwise>
						</c:choose>
						</th>
					</tr>	
					
					</c:forEach>
					
					<tr  id='addbtn1'>
					<th colspan="3">
					<p class='btn_brown upForm' style="display: none;" onclick="addLineNew(1)">+</p>
					</th>
					</tr>
					
					
					</tbody>
                	</table>
                	
                	<hr>
                		<table id='' class='' style="width: 100%;">
                	<colgroup>
							<col style="width: 100%">
						</colgroup>
                	<tbody>
					<tr>
					<th id="formDel" class='subContCenter-total'> 
					<span class='nomalForm' >총 금액 : 
					<fmt:formatNumber value="${my:NVL(arrViewNow[0].maM,0)}" type="number"/>원 
					</span>
                	<c:if test="${arrViewNow[0].jiM ne null && arrViewNow[0].jiT ne null}">
                		<input style="float: none;" class="upbtn btn btn-primary-1" type="button" onclick="allUpdateGas('${arr.idx}', this.value);" value="수정"/>
                	</c:if>
                	<c:if test="${arrViewNow[0].jiM eq null && arrViewNow[0].jiT eq null}">
                		<input style="float: none;" class="upbtn btn btn-primary-1" type="button" onclick="allUpdateGas('${arr.idx}', this.value);" value="추가"/>
                	</c:if>  
					</th>
					</tr>
                	</tbody>
                	</table>

                		
                </div>
              </div>
              
             <div class="moreDiv">
              <a id='more' href='javascript:showMore();' >자세히 비교 >></a>
              </div>
               <div  id='moreD' style=" width: 100%; height: 130px; display: none;">
              <hr>
              <div class="swiper-slide">
              <h3 class="subTitle">작년과 어떻게 달라졌을까? </h3>
               <div  class="tableDiv">
      		<table class="tb">
      		
      			<colgroup>	
      				<col style="min-width: 60px;">
      				<col style="min-width: 80px;">
      			</colgroup>
      		<thead>
      			<tr>
      			<th  class=''>년/월</th>
      			<th  class=''>총합</th>
      			</tr>
      		</thead>	
      		<tbody>
		      <c:forEach var='arrC' items='${arrViewPastY}' varStatus="st">
      			<tr>
      			<th  class=''>${fn:substring(arrC.yyyy,2,4)}/${arrC.mm}</th>
      			
      			<th  class=''>
      			<span class=''><fmt:formatNumber value="${my:NVL(arrC.maM,0)}" type="number"/>원
      			</span>
      			</th>      	      			
      			</tr>	
      			</c:forEach>
      			
      		</tbody>
      		<tfoot>
      			<c:set var='maM' value='${arrViewPastY[0].maM - arrViewPastY[1].maM}' />
      			
      			<tr>
      				<th style="font-size: 11px;">(당년 - 전년)</th>
      				<th class=''><fmt:formatNumber value="${my:NVL(maM,0)}" type="number"/>원</th>
      			</tr>	    
      		</tfoot>
     		</table>
     		</div>
     		
     		
      		<c:set var='avg' value="${maM}" ></c:set>
			<c:choose>
			<c:when test="${avg >= 0}">
			<div style="text-align: center;" class='savingDiv'>
			<img alt="" src="${contextPath}/resources/img/feeling/good1.png" style="width: 46%">
			<h4>
			<fmt:formatNumber value="${avg}" type="number"/>원 절약했어!</h4>
			</div>
			
			</c:when>
			<c:when test="${avg < 0}">
			<c:set var='avg2' value="${(avg)* -1}" ></c:set>
			<div style="text-align: center;" class='savingDiv'>
			<img alt="" src="${contextPath}/resources/img/feeling/bad.png" style="width: 46%">
			<h4>
			<fmt:formatNumber value="${avg2}" type="number"/>원 이라니..홀리...마마</h4>
			</div>
			</c:when>
			</c:choose>
      		
      		<br>
      		<hr>
      		<br>
      		
      		<h3>한눈에 보는 내 공과금 </h3>
      		<br>
      		<!-- 전원 당월 막대그래프 비교 -->
      		<figure class="highcharts-figure">
		    <div id="container1"></div>
		    <p class="highcharts-description">
		      
		    </p>
			</figure>
			
			<br><br>
      		
      		<%--
      		<!-- 6개월간 총 지출 금액 차트 -->
      		<figure class="highcharts-figure">
		    <div id="container6"></div>
		    <p class="highcharts-description">
		        
		    </p>
			</figure>
			
			<br><br>
      		 --%>
      		
      		<!-- 12개월간 총 지출 금액 차트 -->
      		<figure class="highcharts-figure">
		    <div id="container12"></div>
		    <p class="highcharts-description">
		        
		    </p>
			</figure>
			

				</div>
              </div>
            </div>
          </div>

  </main><!-- End #main -->
</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>

	
	// 가스비 상세요금의 합으로 공과금 전체 테이블 가스 데이터 업로드
	// 데이터 일치 시켜주기 위해서
	function upMM(){
		
		
		var jiML = [];
		$( "input[name='jiM']").each( function ( i ) {
			if ($(this).val()== "" || $(this).val() == null || $(this).val() == undefined || ( $(this).val() != null && typeof $(this).val() == "object" && !Object.keys($(this).val()).length )){
				
			}else{
			jiML.push( $( this ).val() );
			}
		} );
		
		$.ajax({
			type : "post",
			dataType : "text", 
			 async : false,
			 traditional : true,
			url : "updateTMm.do",
			data : {
				
				idx: $("input:hidden[name='jidx']").val(),  
				jiML: jiML 
			},
			success : function(result){
				//alert("등록완료");
				//reload();
			},
			error : function(result){
				errMsg(result);
			}
		});
	}
	
	
	
	

	// 검색 버튼
	function schGo(){
		
		location.href='manage.do?yyyy='+ $("select[name=yyyyC]").val() + '&mm=' + $("select[name=mmC]").val() + '&uId=' + $("input:hidden[name='uId']").val(); 
		/*
		$.ajax({
			type : "post",
			  dataType : "JSON",
			 async : false,
			url : "schGoGas.do",
			data : {
					yyyy: $("select[name=yyyyC]").val(), 
					mm: $("select[name=mmC]").val(), 
					uId: $("input:hidden[name='uId']").val(), 
			},
			success : function(result){
				 console.log(JSON.parse(result));
	           	 list = JSON.parse(result);
				alert("등록완료");
				//reload();
			},
			error : function(result){
				errMsg(result);
			}
		});
		*/
	}
	

	// 전체 수정 버튼
	function allUpdateGas(idx, val){
		
		
		if(val == "등록"){
			
				var jiTL = [];
				$( "input[name='jiT']").each( function ( i ) {
					if ($(this).val()== "" || $(this).val() == null || $(this).val() == undefined || ( $(this).val() != null && typeof $(this).val() == "object" && !Object.keys($(this).val()).length )){
						
					}else{
					jiTL.push( $( this ).val() );
					}
				} );
			
				var idxL = [];
				$( "input[name='idxL']").each( function ( i ) {
					if ($(this).val()== "0" || $(this).val() == null || $(this).val() == undefined || ( $(this).val() != null && typeof $(this).val() == "object" && !Object.keys($(this).val()).length )){
					
						if($(this).next().val() == null){
							console.log("들어옴");
							$( this ).attr('disabled','true');
						}
						else{
							idxL.push( $( this ).val() );
						}
					}else{
					idxL.push( $( this ).val() );
					}
					console.log(  $.type($( this ).val())+ " ///////");
				} );
				
				
				var jiML = [];
				$( "input[name='jiM']").each( function ( i ) {
					if ($(this).val()== "" || $(this).val() == null || $(this).val() == undefined || ( $(this).val() != null && typeof $(this).val() == "object" && !Object.keys($(this).val()).length )){
						
					}else{
					jiML.push( $( this ).val() );
					}
				} );
				
				console.log(jiTL+ " ///////");
				console.log(jiML+ " ///////");
				console.log(idxL+ " ///////");
			//	console.log( $.type(idxL)+ " ///////");
			
			if(confirm("등록하시겠습니까?")){
				
		$.ajax({
			type : "post",
			dataType : "text", 
			 async : false,
			 traditional : true,
			url : "allUpMm.do",
			data : {
					yyyy: $("input:hidden[name='yyyy']").val(), 
					mm: $("input:hidden[name='mm']").val(), 
					mode: $("input:hidden[name='mode']").val(), 
					uId: $("input:hidden[name='uId']").val(), 
					jidx: $("input:hidden[name='jidx']").val(), 
					gChk: $("input[name='gChk']:checked").val(), 
					idxL: idxL,
					jiTL: jiTL, 
					jiML: jiML 
			},
			success : function(result){
			//	if(confirm("현재 등록한 데이터로 총 인터넷 요금으로 업데이트 하시겠습니까? \n 확인을 누르시면 전체 공과금 페이지에서 작성한 데이터가 업데이트 됩니다")){
					
					upMM();
					
			//	alert("등록완료");
			//	}else{
			//	alert("세부 데이터만 등록완료");
			//	}
				reload();
			},
			error : function(result){
				errMsg(result);
			}
		});
			}
		}
		

		$(".nomalForm").css("display", "none");
		$(".copybtn").css("display", "none");
		$(".upForm").css("display", "block");
		$(".upFormTable").css("display", "table-row");
		$("#noData").remove();
		$(".disN").css("display", "");
		$(".upbtn").val("등록");
		$("#upbtn").css("width", "100%");
		
		if($("input[name='autoM']:checked").val() == 'Y'){
			$(".showAuto").css("display", "inline");
			$(".showAuto").css("width", "100%");
			$(".showAutoT").css("display", "table-row");
		}
		
		$("#formDel").append("<input style='float: none;' class='upbtn btn btn-danger' type='button' onclick='del();' value='삭제'/>");	
		
	}
	
	function reload() { (location || window.location || document.location).reload(); }
	
	
	


	</script>
	
</html>