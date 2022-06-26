<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="kn">
<head>

<meta charset="UTF-8">
<title>공과금 - 전기</title>
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
		$("#showAuto").css("display", "inline");
	}else if($("input[name='autoM']:checked").val() == 'N'){
		$("#showAuto").css("display", "none");
	}
	
});

// 차트 x축 컬럼 이름
var list;

list =['총 금액', '사용량(kWh)'];

// 전월, 당월
chart1("column", '전월 vs 당월','(전월) ${arrViewPast[0].yyyy}년도 ${arrViewPast[0].mm}월 | (당월) ${arrViewPast[1].yyyy}년도 ${arrViewPast[1].mm}월 ', list ); // ${arrViewPast}
//차트타입, 타이틀, 서브타이들, x축 컬럼명

list = ['총 금액'];
// 6개월
chart6("column", '최근 6개월',' ', list); // ${arrViewPast6}
//차트타입, 타이틀, 서브타이들, x축 컬럼명



var cList = ["line","column"]; 
var  rList = ["총 전기료", "사용량"]; 



// 1년
chart12('최근 12개월','${my:NVL(arrViewPast12[0].yyyy, 0)}년도 ${my:NVL(arrViewPast12[0].mm, 0)}월 ~${arrViewPast12[12].yyyy}년도 ${arrViewPast12[12].mm}월  ',cList, rList );
//타이틀, 서브타이들,  type 배열 리스트, x컬럼 데이터
// 반복횟수는 컨트롤러에서 세팅
// ${arrViewPast12}

});



function show(){
	if(	$("#passY").text() == "접기"){
	$("#passYT").css("display","none");
	$("#passY").text(">> 작년에는 얼마 썼을까?");
	$(".savingDiv").css("display","inline");
	}else{
	$("#passYT").css("display","table");
	$("#passY").text("접기");
	$('.savingDiv').css("display","none");
	}
}




</script>

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <ol>
          <li><a href="index.html">공과금</a></li>
          <li>전기</li>
        </ol>
        <h2>전기</h2>

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
					<option value="2022" <c:if test='${arrViewNow[0].yyyy eq "2022"}'>selected="selected"</c:if>>2022</option>
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
						<c:set var='add' value='${arr.defM + arr.lEm + arr.woEm -arr.miEm+ arr.aEm + arr.gyEm - arr.jsEm + arr.tvEm + arr.etcEm}'/>
                	 <h3>${arr.yyyy}년도 ${arr.mm}월 전기 상세요금 <c:if test="${add ne '0' }">  (<span><fmt:formatNumber value="${add}" type="number"/>원</span>)</c:if>
                	  <c:if test="${arr.elM  eq '0' && arr.elM ne '' }"> (<span><fmt:formatNumber value="${arr.elM}" type="number"/>원</span>) </c:if>
                	  </h3>
                	 
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
					<input onlyNumber style="width: 20%;" class='manageI' type="text" name='autoWhen' value="${arr.autoWhen}" placeholder="숫자만 작성"/>
					</p> 
				 </div>  
				       
               </div>
               
             
                
                
                	 
                	 <div>
                	 <p>계량기 번호 : 
                	 <c:choose>
                	 <c:when test="${arr.gNum ne null }">
                		<span class='nomalForm'>: ${arr.gNum} </span>
                		<span class='upForm'  style="display: none;"><input id='gNumC' onlyNumber class='manageI' type="text" name='gNum' value="${arr.gNum}"/> 
                		<input type="button" onclick="newUp('${vo.yyyy}',${arr.idx}, 2)" value="최근 데이터 가져오기"/></span>
                	 <span><input id='copybtn1' onclick="copy(${arr.gNum}, '계량기 번호 복사 완료');" class='btn_yellowNfloat copybtn' type="button" value="copy"/> </span>  
                	 </c:when>
                	 <c:otherwise>
                	<span>
                	<span class='nomalForm'>데이터가 없습니다</span>
                	<span class='upForm'  style="display: none;"><input  id='gNumC' onlyNumber style="width: 15%;" class='manageI' type="text" name='gNum' value="" placeholder="숫자만 입력"/>
                	<input type="button" onclick="newUp('${vo.yyyy}',${arr.idx}, 2)" value="최근 데이터 가져오기"/>
                	</span>
                	 </c:otherwise>
                	 </c:choose>
                	 </p>
                	 </div>
                	 
                	 	 <div>
                	 <p>고객 번호 : 
                	 <c:choose>
                	 <c:when test="${arr.pNum ne null }">
                		<span class='nomalForm'>: ${arr.pNum} </span>
                		<span class='upForm'  style="display: none;"><input id='pNumC' onlyNumber class='manageI' type="text" name='pNum' value="${arr.pNum}"/>
                			<input type="button" onclick="newUp('${vo.yyyy}',${arr.idx}, 1)" value="최근 데이터 가져오기"/> </span>
                	 <span><input id='copybtn2' onclick="copy(${arr.pNum}, '고객 번호 복사 완료');" class='btn_yellowNfloat copybtn' type="button" value="copy"/> </span>  
                	 </c:when>
                	 <c:otherwise>
                	<span>
                	<span class='nomalForm'>데이터가 없습니다</span>
                	<span class='upForm'  style="display: none;"><input  id='pNumC' onlyNumber style="width: 15%;" class='manageI' type="text" name='pNum' value="" placeholder="숫자만 입력"/>
                	<input type="button" onclick="newUp('${vo.yyyy}',${arr.idx}, 1)" value="최근 데이터 가져오기"/> </span>
                	</span>
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
						<th  class='boder-black'>전력량요금</th>
						<th  class='boder-black'>기후환경요금</th>
						<th  class='boder-black'>필수사용공제(-)</th>
						<th  class='boder-black'>부가가치세</th>
					</tr>
										
					<tr>
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.defM ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.defM}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI' type="text" name='defM' value="${arr.defM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI' type="text" name='defM' value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.lEm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.lEm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI' type="text" name="lEm" value="${arr.lEm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI' type="text" name="lEm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.woEm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.woEm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI' type="text" name="woEm" value="${arr.woEm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI' type="text" name="woEm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.miEm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.miEm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI' type="text" name="miEm"  value="${arr.miEm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI' type="text" name="miEm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.aEm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.aEm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI' type="text" name="aEm"  value="${arr.aEm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI' type="text" name="aEm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						</th>
						
					</tr>
					
					<tr>
						
						<th  class='boder-black'>전력 기금</th>
						<th  class='boder-black'>원단위 절사(-)</th>
						<th  class='boder-black'>TV 수신료</th>
						<th  class='boder-black'>미납, 미청구</th>
						<th  class='boder-black'>사용량</th>
						
					</tr>
					
					<tr>
					
					
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.gyEm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.gyEm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI' type="text" name="gyEm"  value="${arr.gyEm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI' type="text" name="gyEm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.jsEm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.jsEm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI' type="text" name="jsEm"  value="${arr.jsEm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI' type="text" name="jsEm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.tvEm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.tvEm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI' type="text" name="tvEm"  value="${arr.tvEm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI' type="text" name="tvEm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.etcEm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.etcEm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI' type="text" name="etcEm"  value="${arr.etcEm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI' type="text" name="etcEm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					
						<th  class='boder-black' colspan="5">
						<c:choose>
						<c:when test="${arr.useE ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.useE}" type="number"/>kWh</span>
						<span class='upForm' style="display: none;"><input onlyNumber class='manageI' type="text" name="useE"  value="${arr.useE}"/>kWh</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input onlyNumber class='manageI' type="text" name="useE" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
					<tr>
					<th colspan="5"> 총 사용 금액 : <fmt:formatNumber value="${my:NVL(arr.elM,0) }" type="number"/>원 </th>
					</tr>
                	</tbody>
                	</table>
                	
                	<!--  사용량 -->
                		<input class='btn_brown upbtn' type="button" onclick="allUpdate('${arr.idx}', this.value);" value="수정"/> 
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
      			<th  class='boder-black'>사용량</th>
      			<th  class='boder-black'>총 금액</th>
      			</tr>
		      <c:forEach var='arrC' items='${arrViewPast}' varStatus="st">
      			<tr>
      			<th  class='boder-black'>${arrC.yyyy}년 ${arrC.mm}월</th>
      			
      			
      			<th  class='boder-black'>
      			<span class=''><fmt:formatNumber value="${my:NVL(arrC.useE,0)}" type="number"/>kWh
      			</span>
      			</th>
      			
      			
      			<th  class='boder-black'>
      			<span class=''><fmt:formatNumber value="${my:NVL(arrC.elM,0)}" type="number"/>원
      			</span>
      			</th>      			
      			</tr>	
      			</c:forEach>
      			
      			<c:set var='useE' value='${arrViewPast[0].useE - arrViewPast[1].useE}' />
      			<c:set var='elM' value='${arrViewPast[0].elM - arrViewPast[1].elM}' />
      		
      			
      			<tr>
      				<th>(당월 - 전월)</th>
      				<th class='boder-black'><fmt:formatNumber value="${useE}" type="number"/>kWh</th>
      				<th class='boder-black'><fmt:formatNumber value="${my:NVL(elM,0)}" type="number"/>원</th>
      			</tr>	    
      		</tbody>
     		</table>
     		
     		<br>
     		<a id='passY' href='javascript:show();' >>> 작년에는 얼마 썼을까?</a>
     		<table class="tb disNone" id = 'passYT' style="display: none;">
      		<tbody>
      			<tr>
      			<th  class='boder-black'>년/월</th>
      			<th  class='boder-black'>사용량</th>
      			<th  class='boder-black'>총 금액</th>
      			</tr>
		      <c:forEach var='arrC' items='${arrViewPastY}' varStatus="st">
      			<tr>
      			<th  class='boder-black'>${arrC.yyyy}년 ${arrC.mm}월</th>
      			
      			
      			<th  class='boder-black'>
      			<span class=''><fmt:formatNumber value="${my:NVL(arrC.useE,0)}" type="number"/>kWh
      			</span>
      			</th>

      			<th  class='boder-black'>
      			<span class=''><fmt:formatNumber value="${my:NVL(arrC.elM,0) }" type="number"/>원
      			</span>
      			</th>      			
      			</tr>	
      			</c:forEach>
      			
      			<c:set var='useE2' value='${arrViewPastY[0].useE - arrViewPastY[1].useE}' />
      			<c:set var='elM2' value='${arrViewPastY[0].elM - arrViewPastY[1].elM}' />
      		
      			
      			<tr>
      				<th>(당년 - 전년)</th>
      				<th class='boder-black'><fmt:formatNumber value="${useE2}" type="number"/>kWh</th>
      				<th class='boder-black'><fmt:formatNumber value="${elM2}" type="number"/>원</th>
      			</tr>	    
      		</tbody>
     		</table>
     		
     		<br>
     		
     		
      		<c:set var='avg' value="${elM}" ></c:set>
			<c:choose>
			<c:when test="${avg >= 0}">
			<div style="text-align: center;" class='savingDiv'>
			<h4>
			<img alt="" src="${contextPath}/resources/img/feeling/good1.png" style="width: 34%">
			<fmt:formatNumber value="${avg}" type="number"/>원 절약했어!</h4>
			</div>
			
			</c:when>
			<c:when test="${avg < 0}">
			<c:set var='avg2' value="${(avg)* -1}" ></c:set>
			<div style="text-align: center;" class='savingDiv'>
			<h4>
			<img alt="" src="${contextPath}/resources/img/feeling/bad.png" style="width: 34%">
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

  </main><!-- End #main -->
</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>

	
	// 전기료 상세요금의 합으로 공과금 전체 테이블 전기 데이터 업로드
	// 데이터 일치 시켜주기 위해서
	function upElM(){
		
		$.ajax({
			type : "post",
			dataType : "text", 
			 async : false,
			url : "updateTelM.do",
			data : {
				uId: $("input:hidden[name='uId']").val(), 
				idx: $("input:hidden[name='jidx']").val(),  
				defM: $("input[name='defM']").val(), 
				lEm: $("input[name='lEm']").val(), 
				woEm: $("input[name='woEm']").val(), 
				miEm: $("input[name='miEm']").val(), 
				aEm: $("input[name='aEm']").val(), 
				gyEm: $("input[name='gyEm']").val(), 
				jsEm: $("input[name='jsEm']").val(),
				tvEm: $("input[name='tvEm']").val(), 
				etcEm: $("input[name='etcEm']").val(), 
				useE: $("input[name='useE']").val(), 
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
		
		location.href='electric.do?yyyy='+ $("select[name=yyyyC]").val() + '&mm=' + $("select[name=mmC]").val() + '&uId=' + $("input:hidden[name='uId']").val(); 
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
	function allUpdate(idx, val){
		
		console.log($("input[name='gChk']:checked").val()+ " ///////");
		if(val == "등록"){
			if(confirm("등록하시겠습니까?")){
		$.ajax({
			type : "post",
			dataType : "text", 
			 async : false,
			url : "allUpdateEl.do",
			data : {
					yyyy: $("input:hidden[name='yyyy']").val(), 
					mm: $("input:hidden[name='mm']").val(), 
					mode: $("input:hidden[name='mode']").val(), 
					uId: $("input:hidden[name='uId']").val(), 
					idx: $("input:hidden[name='idx']").val(), 
					jidx: $("input:hidden[name='jidx']").val(), 
					defM: $("input[name='defM']").val(), 
					lEm: $("input[name='lEm']").val(), 
					woEm: $("input[name='woEm']").val(), 
					miEm: $("input[name='miEm']").val(), 
					aEm: $("input[name='aEm']").val(), 
					gyEm: $("input[name='gyEm']").val(), 
					jsEm: $("input[name='jsEm']").val(), 
					tvEm: $("input[name='tvEm']").val(), 
					etcEm: $("input[name='etcEm']").val(),
					useE: $("input[name='useE']").val(), 
					pNum: $("input[name='pNum']").val(), 
					gNum: $("input[name='gNum']").val(), 
					gChk: $("input[name='gChk']:checked").val(), 
					autoM: $("input[name='autoM']:checked").val(),
					autoHow: $("input[name='autoHow']").val(),
					autoWhen: $("input[name='autoWhen']").val(),
					
				
			},
			success : function(result){
				//if(confirm("현재 등록한 데이터로 총 전기료를 업데이트 하시겠습니까? \n 확인을 누르시면 전체 공과금 페이지에서 작성한 데이터가 업데이트 됩니다")){
			
					upElM();
					
					alert("등록완료");
		
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
		$(".upForm").css("display", "inline");
		
		$(".upbtn").val("등록");
		
		
	}
	
	function reload() { (location || window.location || document.location).reload(); }
	
	
	function newUp(yyyy,idx, tp){
		
		$.ajax({
			type : "post",
			dataType : "JSON", 
			url : "newUpel.do",
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