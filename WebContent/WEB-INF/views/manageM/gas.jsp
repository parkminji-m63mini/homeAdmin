<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="kn">
<head>

<meta charset="UTF-8">
<title>공과금 - 가스</title>
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

list =['총 금액','사용요금', '당월지침(m3)','사용량(m3)'];

// 전월, 당월
chart1("column", '전월 vs 당월','(전월) ${arrViewPast[0].yyyy}년도 ${arrViewPast[0].mm}월 | (당월) ${arrViewPast[1].yyyy}년도 ${arrViewPast[1].mm}월 ', list ); // ${arrViewPast}
//차트타입, 타이틀, 서브타이들, x축 컬럼명

list = ['총 금액'];
// 6개월
chart6("column", '최근 6개월',' ', list); // ${arrViewPast6}
//차트타입, 타이틀, 서브타이들, x축 컬럼명



var cList = ["line","column"]; 
var  rList = ["총 가스비", "사용량"]; 



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
		          <li>가스</li>
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
                <div class="swiper-slide">
                	<c:forEach var='arr' items='${arrViewNow}' varStatus="st">
						<c:set var='addGas' value='${arr.defM + arr.cGm + arr.uGm - arr.sGm + arr.kGm +arr.mGm+ arr.aGm + arr.avgGm - arr.jsGm + arr.enGu}'/>
                	 <h3>${arr.yyyy}년도 ${arr.mm}월 가스 상세요금 <c:if test="${arr.gasM ne null || arr.gasM ne '0'}">  (<span><fmt:formatNumber value="${arr.gasM}" type="number"/>원</span>)</c:if> </h3>
                	 
                	
                	
                	  <div>
                	  	<table style="width: 100%;">
                	  		<colgroup>
						<col style="width: 30%"/>
						<col style="width: 50%">
						<col style="width: 15%">
					</colgroup>
							 <c:if test="${arr.gChk eq 'Y' }">
							<tr>
                	  			<th colspan="3">
                	  				 <span class="nomalForm" style="font-size: 14px;">
				                	 <c:if test="${arr.gChk eq 'Y'}">
				                	 * 사용요금을  
				                	  <c:if test="${my:NVL(arr.autoWhen,0) ne 0 && arr.autoM eq 'Y'}">
				                	 	${arr.autoWhen}일에
				                	 </c:if>
				                	 <c:if test="${my:NVL(arr.autoHow,'0') ne '0'  && arr.autoM eq 'Y'}">${arr.autoHow}로</c:if> 
				                	 납부했습니다.
				                	
				                	 </c:if>
						                	 
						                	 </span>
		                	  			</th>
		                	  		</tr>
									</c:if>
		                			 <c:if test="${arr.gChk eq 'N' || arr.gChk eq null}">
									<tr>                	  			
	                	  			<th colspan="3">
	                	  			<span class="nomalForm">
					                	 사용요금을 납부하지 않았습니다
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
							            <input type="radio" name="gChk" id="gChk1" <c:if test="${arr.gChk eq 'Y'}">checked="checked"</c:if> value="Y" />
							            <label for="gChk1">네</label>
							        </div>
							        <div class="funkyradio-primary">
							            <input type="radio" name="gChk" id="gChk2"<c:if test="${arr.gChk eq 'N'}">checked="checked"</c:if> value="N" />
							            <label for="gChk2">아니오</label>
							        </div>
							        <div class='mar25' ></div>
							        </div>
                				
                				</span> 
                	  			</th>
                	  		
                	  		<tr class="upFormTable" style="display: none;">
                	  			<th colspan="4" >
                	  				 <span class="upForm" style="display: none;">자동이체로 납부하시나요?</span>
                	  			</th>
                	  		</tr>
                	  		
                	  		<tr class="upFormTable" style="display: none;">
                	  			<th colspan="4" class="cen_radio">
                	  				 <span class="upForm" style="display: none;">
                	  				 
               	  				 		 <div class="funkyradio">
								         <div class="funkyradio-primary">
								            <input type="radio" name="autoM" id="autoM1" <c:if test="${arr.autoM eq 'Y'}">checked="checked"</c:if> value="Y" />
								            <label for="autoM1">네</label>
								        </div>
								        <div class="funkyradio-primary">
								            <input type="radio" name="autoM" id="autoM2"<c:if test="${arr.autoM eq 'N'}">checked="checked"</c:if> value="N" />
								            <label for="autoM2">아니오</label>
								        </div>
								        <div class='mar25' ></div>
								        </div>
                	  				 
                	  				 </span>
                	  			</th>
                	  		</tr>
                	  		
                	  		<tr class=" showAutoT " style="display: none;">
                	  			<th colspan="4">
                	  				 <span class='showAuto' style="display: none;" >
										어떤 방법으로 납부하시나요? 
										
									 </span>  	
                	  			</th>
                	  		</tr>
                	  		
                	  		<tr class=" showAutoT" style="display: none;">
                	  			<th colspan="4" class="subContCenter" style="height: 60px;">
                	  				<input  class='manageI form-control showAuto'  style="display: none;" type="text" name='autoHow' value="${arr.autoHow}" placeholder="ex)기업은행,삼성카드.."/>
                	  			</th>
                	  		</tr>
                	  		
                	  		<tr class=" showAutoT" style="display: none;">
                	  			<th colspan="4" > <span class='showAuto' style="display: none;">이체 날은 언제인가요?</span></th>
                	  		</tr>
                	  		
                	  		<tr class=" showAutoT" style="display: none;">
                	  			<th colspan="4" class="subContCenter" style="height: 60px;">
                	  				<input  class='manageI form-control showAuto'  style="display: none;" type="text" onlyNumber name='autoWhen' value="${arr.autoWhen}" placeholder="숫자만 작성"/>
                	  			</th>
                	  		</tr>
                	  		<tr>
                	  			<th>
                	  			</th>
                	  		</tr>
                	  		
                	  		<tr>
                	  			<th>
                	  			<c:if test="${my:NVL(arr.gNum,0) ne 0 }">
                	  				<span class='nomalForm'>
                	  				계량기 
                	  				</span>
                	  				</c:if>
                	  				<span class='upForm' style="display: none;">
                	  				계량기
                	  				</span>
                	  			</th>
                	  			
								                	  			
                	  			 <c:choose>
				                	 <c:when test="${my:NVL(arr.gNum,0) ne 0 }">
				                	 <th colspan="2">
				                		<span class='nomalForm'> ${arr.gNum} 
				                		<span>
				                		<input id='copybtn2' onclick="copy(${arr.gNum}, '고객 번호 복사 완료');" class='btn_yellowNfloat copybtn' type="button" value="copy"/> 
				                		</span>
				                		</span>
				                		<span class='upForm'  style="display: none;"><input id='gNumC' onlyNumber class='form-control' type="text" name='gNum' value="${arr.gNum}"/></span>
				                	</th>
				                	<th>
				                		<span class='upForm'  style="display: none;"><input type="button" onclick="newUpwa('${vo.yyyy}',${arr.idx}, 2)" value="불러오기"/> </span>
				                	</th>
				                	 </c:when>
				                	 <c:otherwise>
				                	<th>
				                	<span class='upForm'  style="display: none;">
				                	<input  id='gNumC' onlyNumber  class='form-control' type="text" name='gNum' value="" placeholder="숫자만 입력"/>
				                	</span>
				                	</th>
				                	<th>
				                	<span class='upForm'  style="display: none;"><input type="button" onclick="newUpwa('${vo.yyyy}',${arr.idx}, 2)" value="불러오기"/> </span>
				                	</th>
				                	 </c:otherwise>
				                	 </c:choose>
                	  		</tr>
                	  		
                	  		
                	  		<tr>
                	  			<th>
                	  			<c:if test="${my:NVL(arr.pNum,0) ne 0 }">
                	  			<span class='nomalForm'>
                	  				고객 번호
                	  				</span>
                	  				</c:if>
                	  				<span class='upForm' style="display: none;">
                	  				고객 번호
                	  				</span>
                	  			</th>
                	  			
								                	  			
                	  			 <c:choose>
				                	 <c:when test="${my:NVL(arr.pNum,0) ne 0 }">
				                	 <th  colspan="2">
				                		<span class='nomalForm'> ${arr.pNum} 
				                		<span>
				                		<input id='copybtn2' onclick="copy(${arr.pNum}, '고객 번호 복사 완료');" class='btn_yellowNfloat copybtn' type="button" value="copy"/> 
				                		</span>
				                		</span>
				                		<span class='upForm'  style="display: none;"><input id='pNumC' onlyNumber class='form-control' type="text" name='pNum' value="${arr.pNum}"/></span>
				                	</th>
				                	<th>
				                		<span class='upForm'  style="display: none;"><input type="button" onclick="newUpwa('${vo.yyyy}',${arr.idx}, 1)" value="불러오기"/> </span>
				                	</th>
				                	 </c:when>
				                	 <c:otherwise>
				                	<th>
				                	<span class='upForm'  style="display: none;">
				                	<input  id='pNumC' onlyNumber  class='form-control' type="text" name='pNum' value="" placeholder="숫자만 입력"/>
				                	</span>
				                	</th>
				                	<th>
				                	<span class='upForm'  style="display: none;"><input type="button" onclick="newUpwa('${vo.yyyy}',${arr.idx}, 1)" value="불러오기"/> </span>
				                	</th>
				                	 </c:otherwise>
				                	 </c:choose>
                	  		</tr>
                	  	</table>
                	  </div>
                	
                	
                	<hr>
                	 
             
                	
				<form name="frmReg${st.index}" class='' method="post">
				
				
				<c:set var='mode' value='u'/>
				<%--<c:if test="${arr.gasM == null && arr.elM == null && arr.wtM == null && arr.itM == null}"> --%>
				<c:if test="${arr.idx == null}"> 
				<c:set var='mode' value='i'/>
				</c:if>
				
                <input type="hidden" value="${arr.idx}" name='idx' id='idx'/>
                <input type="hidden" value="${arr.jidx}" name='jidx' id='jidx'/>
                <input type="hidden" value="${mode}" name='mode' id='mode'/>
                <input type="hidden" value="${arr.yyyy}" name='yyyy' id='yyyy'/>
                <input type="hidden" value="${arr.mm}" name='mm' id='mm'/>
                <input type="hidden" value="${arr.uId}" name='uId' id='uId'/>
                <input type="hidden" value="${arr.gChk}" name='gChk' id='gChk'/>
                	
                	<table class='' style="width: 100%;">
                	<colgroup>
							<col style="width: 100%">
						</colgroup>
                	<tbody>
					<tr>
						<th   class='ContD'>기본료 </th>
					</tr>
					<tr>
						<th  class='subContCenter '>
						<c:choose>
						<c:when test="${arr.defM ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.defM}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name='defM' value="${arr.defM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name='defM' value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
				</tbody>
				</table>
				
				 <div class="moreDiv">
              <a id='moreData' href='javascript:showMoreD();' >。。。</a>
              </div>
               <div  id='moreDData' style=" width: 100%; display: none;">
				<table class='' style="width: 100%;">
                	<colgroup>
							<col style="width: 100%">
						</colgroup>
				<tbody>	
					<tr>	
						<th   class='ContD'>교체비</th>
					</tr>
					<tr>	
						<th  class='subContCenter '>
						<c:choose>
						<c:when  test="${arr.cGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.cGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="cGm" value="${arr.cGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="cGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
					<tr>
						<th   class='ContD'>사용요금</th>
					</tr>
						<tr>	
						<th  class='subContCenter '>
						<c:choose>
						<c:when  test="${arr.uGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.uGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="uGm" value="${arr.uGm}""/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="uGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
					<tr>
						<th  class='ContD'>부가세</th>
					</tr>
						<tr>	
						<th  class='subContCenter '>
						<c:choose>
						<c:when test="${arr.aGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.aGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="aGm"  value="${arr.aGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="aGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
					<tr>
						<th   class='ContD'>할인금액</th>
					</tr>
					<tr>	
							<th  class='subContCenter '>
						<c:choose>
						<c:when test="${arr.sGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.sGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="sGm"  value="${arr.sGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="sGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
					</tr>
					
					<tr>
						<th   class='ContD'>가산금</th>
					</tr>
					<tr>
					
						<th  class='subContCenter '>
						<c:choose>
						<c:when test="${arr.kGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.kGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="kGm"  value="${arr.kGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="kGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
					
					<tr>
						<th   class='ContD'>미납금</th>
					</tr>
					<tr>	
							<th  class='subContCenter '>
						<c:choose>
						<c:when test="${arr.mGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.mGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="mGm"  value="${arr.mGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="mGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
					
					<tr>
						<th  class='ContD'>정산금액</th>
					</tr>
					<tr>	
							<th  class='subContCenter '>
						<c:choose>
						<c:when test="${arr.avgGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.avgGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="avgGm"  value="${arr.avgGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="avgGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
					
					
					<tr>
						<th   class='ContD'>절사금액</th>
					</tr>
						<tr>	
							<th  class='subContCenter '>
						<c:choose>
						<c:when test="${arr.jsGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.jsGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="jsGm"  value="${arr.jsGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="jsGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
					
					
					<tr>
						<th  class='ContD'>에너지바우처</th>
					</tr>
					<tr>	
							<th class='subContCenter '>
						<c:choose>
						<c:when test="${arr.enGu ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.enGu}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="enGu"  value="${arr.enGu}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI form-control moneyInputWon' type="text" name="enGu" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
                	
					<tr>
						<th   class='ContD'>당월지침</th>
					</tr>
					<tr>
						<th  class='subContCenter '>
						<c:choose>
						<c:when test="${arr.monGu ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.monGu}" type="number"/>m³</span>
						<span class='upForm' style="display: none;"><input  class='manageI form-control moneyInputWon' type="text" name='monGu' value="${arr.monGu}"/>m³</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0m³</span>
						<span class='upForm' style="display: none;"><input  class='manageI form-control moneyInputWon' type="text" name='monGu' value="0"/>m³</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
					
					<tr>
						<th   class='ContD'>사용량</th>
					</tr>
						<tr>	
						<th  class='subContCenter '>
						<c:choose>
						<c:when  test="${arr.useG ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.useG}" type="number"/>m³</span>
						<span class='upForm' style="display: none;"><input  class='manageI form-control moneyInputWon' type="text" name="useG" value="${arr.useG}"/>m³</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0m³</span>
						<span class='upForm' style="display: none;"><input   class='manageI form-control moneyInputWon' type="text" name="useG" value="0"/>m³</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
					<tr>
						<th   class='ContD'>사용열량</th>
					</tr>
					<tr>	
						<th  class='subContCenter '>
						<c:choose>
						<c:when  test="${arr.useB ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.useB}" type="number"/>MJ</span>
						<span class='upForm' style="display: none;"><input  class='manageI form-control moneyInputWon' type="text" name="useB" value="${arr.useB}"/>MJ</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0MJ</span>
						<span class='upForm' style="display: none;"><input  class='manageI form-control moneyInputWon' type="text" name="useB" value="0"/>MJ</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
					</tbody>
                	</table>
                	</div>
					
					<table class='' style="width: 100%;">
                	<colgroup>
							<col style="width: 100%">
						</colgroup>
					<tbody>	
					<tr>
					<th> <hr>
					</th>
					</tr>
					<tr>
					<th class='subContCenter-total'> 
					<span class='nomalForm' >총 금액 : 
					<fmt:formatNumber value="${arr.gasM}" type="number"/>원
					</span>
					 <input style="float: none;" id='upbtn' class="upbtn btn btn-primary-1" type="button" onclick="allUpdateGas('${arr.idx}', this.value);" value="수정"/>
					  </th>
					</tr>
                	</tbody>
                	</table>
                	
</form>
                		</c:forEach>
                		
                </div>
              </div>
               <div class="moreDiv">
              <a id='more' href='javascript:showMore();' >자세히 비교 >></a>
              </div>
               <div  id='moreD' style=" width: 100%; height: 130px; display: none;">
              <hr>
              <div class="swiper-slide">
               <h3 class="subTitle">이번 달엔 얼마나 줄였을까? </h3>
                <div  class="tableDiv">
      		<table class="tb">
      				<colgroup>	
      				<col style="min-width: 60px;">
      				<col style="min-width: 80px;">
      				<col style="min-width: 80px;">
      				<col style="min-width: 80px;">
      				<col style="min-width: 80px;">
      			</colgroup>
      		<thead>
      			<tr>
      			<th  class=''>년/월</th>
      			<th  class=''>당월지침</th>
      			<th  class=''>사용량</th>
      			<th  class=''>사용요금</th>
      			<th  class=''>총 금액</th>
      			</tr>
      		</thead>	
      		<tbody>
		      <c:forEach var='arrC' items='${arrViewPast}' varStatus="st">
      			<tr>
      			<th  class=''>${fn:substring(arrC.yyyy,2,4)}/${arrC.mm}</th>
      			
      			<th  class=''>
      			<span class=''><fmt:formatNumber value="${my:NVL(arrC.monGu,0)}" type="number"/>m³
      			</span>
      			</th>
      			
      			<th  class=''>
      			<span class=''><fmt:formatNumber value="${my:NVL(arrC.useG,0)}" type="number"/>m³
      			</span>
      			</th>
      			
      			<th  class=''>
      			<span class=''><fmt:formatNumber value="${my:NVL(arrC.uGm,0)}" type="number"/>원
      			</span>
      			</th>
      			
      			<th  class=''>
      			<span class=''><fmt:formatNumber value="${my:NVL(arrC.gasM,0)}" type="number"/>원
      			</span>
      			</th>      			
      			</tr>	
      			</c:forEach>
      		</tbody>
      			
      			<tfoot>
      			<c:set var='monGu' value='${arrViewPast[0].monGu - arrViewPast[1].monGu}'/>
      			<c:set var='useG' value='${arrViewPast[0].useG - arrViewPast[1].useG}' />
      			<c:set var='uGm' value='${arrViewPast[0].uGm - arrViewPast[1].gasM}'/>
      			<c:set var='gasM' value='${arrViewPast[0].gasM - arrViewPast[1].gasM}' />
      		
      			<tr>
      				<th style="font-size: 11px;">(당월 - 전월)</th>
      				<th class=''><fmt:formatNumber value="${monGu}" type="number"/>m³</th>
      				<th class=''><fmt:formatNumber value="${useG}" type="number"/>m³</th>
      				<th class=''><fmt:formatNumber value="${uGm}" type="number"/>원</th>
      				<th class=''><fmt:formatNumber value="${gasM}" type="number"/>원</th>
      			</tr>	
      			</tfoot>    
     		</table>
     		 </div>
     		<a id='passY' class="fontS" href='javascript:show();' >>> 작년에는 얼마 썼을까?</a>
     			 <div  id='passYTD' class="tableDiv" style="display: none; ">
     		<table class="tb disNone" id = 'passYT' style="display: none;">
     				<colgroup>	
      				<col style="min-width: 60px;">
      				<col style="min-width: 80px;">
      				<col style="min-width: 80px;">
      				<col style="min-width: 80px;">
      				<col style="min-width: 80px;">
      			</colgroup>
      		<thead>
      			<tr>
      			<th  class=''>년/월</th>
      			<th  class=''>당월지침</th>
      			<th  class=''>사용량</th>
      			<th  class=''>사용요금</th>
      			<th  class=''>총 금액</th>
      			</tr>
      		</thead>	
      		<tbody>
		      <c:forEach var='arrC' items='${arrViewPastY}' varStatus="st">
      			<tr>
      			<th  class=''>${fn:substring(arrC.yyyy,2,4)}/${arrC.mm}</th>
      			
      			<th  class=''>
      			<span class=''><fmt:formatNumber value="${arrC.monGu}" type="number"/>m³
      			</span>
      			</th>
      			
      			<th  class=''>
      			<span class=''><fmt:formatNumber value="${arrC.useG}" type="number"/>m³
      			</span>
      			</th>
      			
      			<th  class=''>
      			<span class=''><fmt:formatNumber value="${arrC.uGm}" type="number"/>원
      			</span>
      			</th>
      			
      			<th  class=''>
      			<span class=''><fmt:formatNumber value="${my:NVL(arrC.gasM,0)}" type="number"/>원
      			</span>
      			</th>      			
      			</tr>	
      			</c:forEach>
      			
      			<c:set var='monGu2' value='${arrViewPastY[0].monGu - arrViewPastY[1].monGu}'/>
      			<c:set var='useG2' value='${arrViewPastY[0].useG - arrViewPastY[1].useG}' />
      			<c:set var='uGm2' value='${arrViewPastY[0].uGm - arrViewPastY[1].gasM}'/>
      			<c:set var='gasM2' value='${arrViewPastY[0].gasM - arrViewPastY[1].gasM}' />
      		
      		</tbody>
      		<tfoot>	
      			<tr>
      				<th style="font-size: 11px;">(당년 - 전년)</th>
      				<th class=''><fmt:formatNumber value="${monGu2}" type="number"/>m³</th>
      				<th class=''><fmt:formatNumber value="${useG2}" type="number"/>m³</th>
      				<th class=''><fmt:formatNumber value="${uGm2}" type="number"/>원</th>
      				<th class=''><fmt:formatNumber value="${gasM2}" type="number"/>원</th>
      			</tr>	
      		</tfoot>    
     		</table>
     		</div>
     		
      		<c:set var='avg' value="${gasM}" ></c:set>
			<c:choose>
			<c:when test="${avg >= 0}">
			<div style="text-align: center;" class='savingDiv'>
			<img alt="" src="${contextPath}/resources/img/feeling/good1.png" style="width: 46%">
			<h4>
			<span><fmt:formatNumber value="${avg}" type="number"/>원 절약했어!</span></h4>
			</div>
			
			</c:when>
			<c:when test="${avg < 0}">
			<c:set var='avg2' value="${(avg)* -1}" ></c:set>
			<div style="text-align: center;" class='savingDiv'>
			<img alt="" src="${contextPath}/resources/img/feeling/bad.png" style="width: 46%">
			<h4>
			<span><fmt:formatNumber value="${avg2}" type="number"/>원 이라니..홀리...마마</span></h4>
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
      		
      		
      		<!-- 6개월간 총 지출 금액 차트 -->
      		<figure class="highcharts-figure">
		    <div id="container6"></div>
		    <p class="highcharts-description">
		        
		    </p>
			</figure>
			
			<br><br>
      		
      		
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
	function upGasM(){
		
		//DEF_M + C_GM + U_GM + A_GM + S_GM + M_GM + K_GM + AVG_GM - JS_GM + EN_GU) AS gasM
		$.ajax({
			type : "post",
			dataType : "text", 
			 async : false,
			url : "updateTgasM.do",
			data : {
				
				idx: $("input:hidden[name='jidx']").val(),  
				defM: $("input[name='defM']").val(), 
				cGm: $("input[name='cGm']").val(), 
				uGm: $("input[name='uGm']").val(), 
				aGm: $("input[name='aGm']").val(), 
				sGm: $("input[name='sGm']").val(), 
				kGm: $("input[name='kGm']").val(), 
				mGm: $("input[name='mGm']").val(), 
				avgGm: $("input[name='avgGm']").val(), 
				jsGm: $("input[name='jsGm']").val(), 
				enGu: $("input[name='enGu']").val(), 
				 
				
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
		
		location.href='gas.do?yyyy='+ $("select[name=yyyyC]").val() + '&mm=' + $("select[name=mmC]").val() + '&uId=' + $("input:hidden[name='uId']").val(); 
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
		
		console.log($("input[name='gChk']:checked").val()+ " ///////");
		if(val == "등록"){
			if(confirm("등록하시겠습니까?")){
		$.ajax({
			type : "post",
			dataType : "text", 
			 async : false,
			url : "allUpdateGas.do",
			data : {
					yyyy: $("input:hidden[name='yyyy']").val(), 
					mm: $("input:hidden[name='mm']").val(), 
					mode: $("input:hidden[name='mode']").val(), 
					uId: $("input:hidden[name='uId']").val(), 
					idx: $("input:hidden[name='idx']").val(), 
					jidx: $("input:hidden[name='jidx']").val(), 
					defM: $("input[name='defM']").val(), 
					cGm: $("input[name='cGm']").val(), 
					uGm: $("input[name='uGm']").val(), 
					aGm: $("input[name='aGm']").val(), 
					sGm: $("input[name='sGm']").val(), 
					kGm: $("input[name='kGm']").val(), 
					mGm: $("input[name='mGm']").val(), 
					avgGm: $("input[name='avgGm']").val(), 
					jsGm: $("input[name='jsGm']").val(), 
					enGu: $("input[name='enGu']").val(), 
					monGu: $("input[name='monGu']").val(), 
					useG: $("input[name='useG']").val(), 
					useB: $("input[name='useB']").val(), 
					pNum: $("input[name='pNum']").val(), 
					gNum: $("input[name='gNum']").val(), 
					gChk: $("input[name='gChk']:checked").val(), 
					autoM: $("input[name='autoM']:checked").val(),
					autoHow: $("input[name='autoHow']").val(),
					autoWhen: $("input[name='autoWhen']").val(),
					
				
			},
			success : function(result){
			//	if(confirm("현재 등록한 데이터로 총 가스비를 업데이트 하시겠습니까? \n 확인을 누르시면 전체 공과금 페이지에서 작성한 데이터가 업데이트 됩니다")){
			
					upGasM();
					
					alert("등록완료");
		
	//			}else{
			//	alert("세부 데이터만 등록완료");
		//		}
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
		$(".upForm").css("display", "inline");
		$(".upFormTable").css("display", "table-row");
		
		if($("input[name='autoM']:checked").val() == 'Y'){
			$(".showAuto").css("display", "inline");
			$(".showAuto").css("width", "100%");
			$(".showAutoT").css("display", "table-row");
		}
		
		$(".upbtn").val("등록");
		$("#upbtn").css("width", "100%");
		
		
	}
	
	function reload() { (location || window.location || document.location).reload(); }
	
	
	function newUp(yyyy,idx, tp){
		
		$.ajax({
			type : "post",
			dataType : "JSON", 
			url : "newUp.do",
			data : {
				yyyy : yyyy,
				idx : idx,
				tp : tp
			},
			success : function(result){
				if(tp == 1){
				$("#pNumC").val(result);
				}else if(tp == 2){
				$("#gNumC").val(result);
				}
				
				//alert("완료" + result);
			},
			error : function(result){
				errMsg(result);
			}
		});
		
		return false;
		
	}



	</script>
	
</html>