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
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
 <link href="${contextPath}/resources/css/chart/chart.css" rel="stylesheet">
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
<script type="text/javascript">




// 체크박스 바로 업데이트
/*function chpayChk(idx, yn, gb){

	var url;
	
	if(gb =='gChk'){
		url = 'updateGchk.do';		
	}else if(gb == 'autoM'){
		url = 'updateGchkA.do';		
		
	}
	
	
	 
	$.ajax({
		type : "post",
		dataType : "text", 
		 async : false,
		url : url,
		data : {
			
			idx: idx, 
			gChk: yn, 
			autoM : yn
			 
			
		},
		success : function(result){
			alert("등록완료");
			reload();
		},
		error : function(result){
			errMsg(result);
		}
	});
}
*/



$(document).ready(function(){
	if($("input[name='autoM']:checked").val() == 'Y'){
		$("#showAuto").css("display", "inline");
	}
	
$("input[name='autoM']").click(function(){
	
	if($("input[name='autoM']:checked").val() == 'Y'){
		$("#showAuto").css("display", "inline");
	}else if($("input[name='autoM']:checked").val() == 'N'){
		$("#showAuto").css("display", "none");
	}
	
});
});


//총합 6개월 총 지출 금액 차트
var chart;
$(document).ready(function() {
	
	chart = new Highcharts.chart('container', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: '공과금 세부 비교 (3개월)'
	    },
	    subtitle: {
	        text: ''
	    },
	    xAxis: {
	        categories: [
	            '가스',
	            '전기',
	            '수도',
	            '인터넷'
	        ],
	        crosshair: true
	    },
	    yAxis: {
	        min: 0,
	       	//max: 50000,
	        title: {
	            text: '금액(원)'
	        }
	    },
	    tooltip: {
	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	            '<td style="padding:0"><b>{point.y:.0f} 원</b></td></tr>',
	        footerFormat: '</table>',
	        shared: true,
	        useHTML: true
	    },
	    plotOptions: {
	        column: {
	            pointPadding: 0.2,
	            borderWidth: 0
	        }
	    },
	    series: [
	    	<c:forEach var="arrC2" items="${arrViewPast2}" varStatus="st">
	    	 	{
	        name: '${arrC2.mm}월',
	        data : [${arrC2.suma}]

	    },
	    </c:forEach>
	   ]
	    
	    
	//	<c:forEach var="arrC2" items="${arrViewPast}" varStatus="st">
	//	<c:if test='${st.index ne fn:length(arrViewPast)}'>		                 
	//	{
	//	name : '${arrC2.mm}',
		//data : [0, 1, 2, 3],
	//	data : [${arr.gasM}, ${arr.elM}, ${arr.wtM}, ${arr.itM}],
	//	color : '#0072bc'
	//	}
	//		</c:if>   					
				
	//	</c:forEach>
	    
	    

	});
});






</script>
<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <ol>
          <li><a href="index.html">공과금</a></li>
          <li>가스</li>
        </ol>
        <h2>가스</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="">

          <div class="">
          
					<div>
					<select id='yyyyC' name='yyyyC'>
					<option>년도</option>
					<option value="2021" <c:if test='${arrViewNow[0].yyyy eq "2021"}'>selected="selected"</c:if>>2021</option>
					<option value="2020" <c:if test='${arrViewNow[0].yyyy eq "2020"}'>selected="selected"</c:if>>2020</option>
					<option value="2019" <c:if test='${arrViewNow[0].yyyy eq "2019"}'>selected="selected"</c:if>>2019</option>
					</select>
					
					<select id='mmC' name='mmC'>
					<option>월</option>
					<c:forEach var="i" begin="1" end="12" step="1">
					<option value="${i}"<c:if test='${arrViewNow[0].mm eq i}'>selected="selected"</c:if>>${i}</option>
					</c:forEach>
					</select>
					
					<button onclick="schGo();">검색</button>
					
					</div>
					
            <div class="portfolio-info">
              <div class="swiper-wrapper align-items-center">


					<%--이번달 요금 --%>
                <div class="swiper-slide">
                	<c:forEach var='arr' items='${arrViewNow}' varStatus="st">
						<c:set var='addGas' value='${arr.defM + arr.cGm + arr.uGm - arr.sGm + arr.kGm +arr.mGm+ arr.aGm + arr.avgGm - arr.jsGm + arr.enGu}'/>
                	 <h3>${arr.yyyy}년도 ${arr.mm}월 가스 상세요금 <c:if test="${addGas ne null || addGas ne '0'}">  (<span><fmt:formatNumber value="${addGas}" type="number"/>원</span>)</c:if> </h3>
                	 
                	 <p class="nomalForm">
                	 <c:if test="${arr.gChk eq 'Y'}">
                	 이번 달 사용요금을 
                	  <c:if test="${arr.autoWhen ne null}">
                	 	${arr.autoWhen}일에
                	 </c:if>
                	 <c:if test="${arr.autoHow ne null}">${arr.autoHow}로</c:if> 
                	 납부했습니다.
                	
                	 </c:if>
                	 
                	 <c:if test="${arr.gChk eq 'N'}">
                	 이번 달은 아직 사용요급을 납부하지 않았습니다
                	 </c:if>
                	 
                	 
                	 </p>
                	 
                	 <div class="upForm" style="display: none;"> 
                	   <p>이번 달 사용요금 지출을 완료하였나요?
                <span><input type="radio" name='gChk'  <c:if test="${arr.gChk eq 'Y'}">checked="checked"</c:if> value="Y" >네</span>
                <span>
                <input type="radio" name='gChk'  <c:if test="${arr.gChk eq 'N'}">checked="checked"</c:if> value="N" >아니요
                	</span> 
                </p>	
                </div>
                	 
                	 
               <div class="upForm" style="display: none;">
                <p>자동이체로 납부하시나요?
                 <span>
                 <input type="radio" name='autoM' <c:if test="${arr.autoM eq 'Y'}">checked="checked"</c:if> value="Y" >네</span>
                <span>
                <input type="radio" name='autoM'  <c:if test="${arr.autoM eq 'N'}">checked="checked"</c:if> value="N" >아니요</span>
				       </p>       
				       
				  <!-- 디자인 좀 넣기 -->     
				 <div id='showAuto' style="display: none;">
					<p>어떤 방법으로 납부하시나요? 
					<input  style="width: 48%;" class='manageI' type="text" name='autoHow' value="${arr.autoHow}" placeholder="ex)기업은행,삼성카드.."/>
					</p>
					 
					<p>이체 날은 언제인가요? 
					<input  style="width: 20%;" class='manageI' type="text" name='autoWhen' value="${arr.autoWhen}" placeholder="숫자만 작성"/>
					</p> 
				 </div>  
				       
               </div>
               
             
                
                
                	 
                	 <div>
                	 <p>계량기 번호 : 
                	 <c:choose>
                	 <c:when test="${arr.gNum ne null }">
                		<span class='nomalForm'>: ${arr.gNum} </span>
                		<span class='upForm'  style="display: none;"><input id='gNumC' class='manageI' type="text" name='gNum' value="${arr.gNum}"/> </span>
                	 <span><input id='copybtn1' onclick="copy(${arr.gNum}, '계량기 번호 복사 완료');" class='btn_yellowNfloat copybtn' type="button" value="copy"/> </span>  
                	 </c:when>
                	 <c:otherwise>
                	<span>
                	<span class='nomalForm'>데이터가 없습니다</span>
                	<span class='upForm'  style="display: none;"><input  style="width: 10%;" class='manageI' type="text" name='gNum' value="" placeholder="숫자만 입력"/></span>
                	 </c:otherwise>
                	 </c:choose>
                	 </p>
                	 </div>
                	 
                	 	 <div>
                	 <p>고객 번호 : 
                	 <c:choose>
                	 <c:when test="${arr.pNum ne null }">
                		<span class='nomalForm'>: ${arr.pNum} </span>
                		<span class='upForm'  style="display: none;"><input id='pNumC' class='manageI' type="text" name='pNum' value="${arr.pNum}"/> </span>
                	 <span><input id='copybtn2' onclick="copy(${arr.pNum}, '고객 번호 복사 완료');" class='btn_yellowNfloat copybtn' type="button" value="copy"/> </span>  
                	 </c:when>
                	 <c:otherwise>
                	<span>
                	<span class='nomalForm'>데이터가 없습니다</span>
                	<span class='upForm'  style="display: none;"><input  style="width: 10%;" class='manageI' type="text" name='pNum' value="" placeholder="숫자만 입력"/></span>
                	 </c:otherwise>
                	 </c:choose>
                	 </p>
                	 </div>
                	 
                	 
             
                	
				<form name="frmReg${st.index}" class='boder-black' method="post">
				
				
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
                	
                	<table class='tb'>
                	<tbody>
					<tr>
						<th  class='boder-black'>기본료 </th>
						<th  class='boder-black'>교체비</th>
						<th  class='boder-black'>사용요금</th>
						<th  class='boder-black'>부가세</th>
						<th  class='boder-black'>할인금액</th>
					</tr>
										
					<tr>
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.defM ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.defM}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name='defM' value="${arr.defM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name='defM' value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.cGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.cGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="cGm" value="${arr.cGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="cGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.uGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.uGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="uGm" value="${arr.uGm}""/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="uGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.aGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.aGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="aGm"  value="${arr.aGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="aGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.sGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.sGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="sGm"  value="${arr.sGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="sGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
					</tr>
					
					<tr>
						<th  class='boder-black'>가산금</th>
						<th  class='boder-black'>미납금</th>
						<th  class='boder-black'>정산금액</th>
						<th  class='boder-black'>절시금액</th>
						<th  class='boder-black'>에너지바우처</th>
					</tr>
					
					<tr>
					
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.kGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.kGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="kGm"  value="${arr.kGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="kGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.mGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.mGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="mGm"  value="${arr.mGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="mGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.avgGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.avgGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="avgGm"  value="${arr.avgGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="avgGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.jsGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.jsGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="jsGm"  value="${arr.jsGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="jsGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th colspan="2" class='boder-black'>
						<c:choose>
						<c:when test="${arr.enGu ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.enGu}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="enGu"  value="${arr.enGu}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="enGu" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
                	</tbody>
                	</table>
                	
                	<!--  사용량 -->
                	<table class='tb'>
                	<tbody>
					<tr>
						<th  class='boder-black'>당월지침</th>
						<th  class='boder-black'>사용량</th>
						<th  class='boder-black'>사용열량</th>
					</tr>
					<tr>
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.monGu ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.monGu}" type="number"/>m³</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name='monGu' value="${arr.monGu}"/>m³</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0m³</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name='monGu' value="0"/>m³</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.useG ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.useG}" type="number"/>m³</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="useG" value="${arr.useG}"/>m³</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0m³</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="useG" value="0"/>m³</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.useB ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.useB}" type="number"/>m³</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="useB" value="${arr.useB}""/>m³</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0m³</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="useB" value="0"/>m³</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
                	</tbody>
                	</table>
                		<input class='btn_brown upbtn' type="button" onclick="allUpdateGas('${arr.idx}', this.value);" value="수정"/> 
</form>
<iframe id="frmSys" name="frmSys" allowTransparency="true" width="0" height="0" scrolling="no" frameborder="0"></iframe>
                		</c:forEach>
                		
                </div>
              </div>
              
              <br><br>
              <div class="swiper-slide">
               <h3>이번달엔 얼마나 줄였을까? </h3>
      		<table class="tb">
      		<tbody>
      			<tr>
      			<th  class='boder-black'>년/월</th>
      			<th  class='boder-black'>당월지침</th>
      			<th  class='boder-black'>사용량</th>
      			<th  class='boder-black'>사용요금</th>
      			<th  class='boder-black'>총 금액</th>
      			</tr>
		      <c:forEach var='arrC' items='${arrViewPast}' varStatus="st">
      			<tr>
      			<th  class='boder-black'>${arrC.yyyy}년 ${arrC.mm}월</th>
      			
      			<th  class='boder-black'>
      			<span class='nomalForm'><fmt:formatNumber value="${arrC.monGu}" type="number"/>m³
      			</span>
      			</th>
      			
      			<th  class='boder-black'>
      			<span class='nomalForm'><fmt:formatNumber value="${arrC.useG}" type="number"/>m³
      			</span>
      			</th>
      			
      			<th  class='boder-black'>
      			<span class='nomalForm'><fmt:formatNumber value="${arrC.uGm}" type="number"/>원
      			</span>
      			</th>
      			
      			<th  class='boder-black'>
      			<span class='nomalForm'><fmt:formatNumber value="${arrC.suma}" type="number"/>원
      			</span>
      			</th>      			
      			</tr>	
      			</c:forEach>
      			
      			<c:set var='monGu' value='${arrViewPast[1].monGu - arrViewPast[0].monGu}'/>
      			<c:set var='useG' value='${arrViewPast[1].useG - arrViewPast[0].useG}' />
      			<c:set var='uGm' value='${arrViewPast[1].uGm - arrViewPast[0].suma}'/>
      			<c:set var='suma' value='${arrViewPast[1].suma - arrViewPast[0].suma}' />
      		
      			
      			<tr>
      				<th>개별 총</th>
      				<th class='boder-black'><fmt:formatNumber value="${monGu}" type="number"/>원</th>
      				<th class='boder-black'><fmt:formatNumber value="${useG}" type="number"/>원</th>
      				<th class='boder-black'><fmt:formatNumber value="${uGm}" type="number"/>원</th>
      				<th class='boder-black'><fmt:formatNumber value="${suma}" type="number"/>원</th>
      			</tr>	    
      		</tbody>
     		</table>
     		
     		<br><br>
     		
      		<c:set var='avg' value="${suma}" ></c:set>
			<c:choose>
			<c:when test="${avg >= 0}">
			<div style="text-align: center;">
			<h4>
			<img alt="" src="${contextPath}/resources/img/feeling/good1.png" style="width: 34%">
			<fmt:formatNumber value="${avg}" type="number"/>원 절약했어!</h4>
			</div>
			
			</c:when>
			<c:when test="${avg < 0}">
			<div style="text-align: center;">
			<h4>
			<img alt="" src="${contextPath}/resources/img/feeling/bad.png" style="width: 34%">
			<fmt:formatNumber value="${avg}" type="number"/>원 이라니..홀리...마마</h4>
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
		    <div id="container2"></div>
		    <p class="highcharts-description">
		      
		    </p>
			</figure>
			
			<br><br>
      		
      		
      		<!-- 3개월간 총 지출 금액 차트 -->
      		<figure class="highcharts-figure">
		    <div id="container"></div>
		    <p class="highcharts-description">
		        
		    </p>
			</figure>

			
              </div>
            </div>
          </div>

  </main><!-- End #main -->
</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>
	$(document).ready(function(){ 
		
		//alert(${addGas});
	//	upGasM(${addGas});
	});
	
	
	// 가스비 상세요금의 합으로 공과금 전체 테이블 가스 데이터 업로드
	// 데이터 일치 시켜주기 위해서
	function upGasM(gas){
		$.ajax({
			type : "post",
			dataType : "text", 
			 async : false,
			url : "updateTgasM.do",
			data : {
				
				idx: $("input:hidden[name='jidx']").val(),  
				gasM: gas, 
				 
				
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
				if(confirm("현재 등록한 데이터로 총 가스비를 업데이트 하시겠습니까? \n 확인을 누르시면 전체 공과금 페이지에서 작성한 데이터가 업데이트 됩니다")){
					upGasM(${addGas});
					// 기능 체크해봐야함
				alert("등록완료");
				}else{
				alert("세부 데이터만 등록완료");
				}
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
		
		$(".upbtn").val("등록");
		
		
	}
	
	function reload() { (location || window.location || document.location).reload(); }

	</script>
	
</html>