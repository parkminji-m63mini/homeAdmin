<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" uri="myFunc"%> 


<!DOCTYPE html>
<html lang="kn">

<head>
<meta charset="UTF-8">
<title>공과금 전체</title> 
</head>

<!--  차트 -->
<%-- <script src="${contextPath}/resources/css/chart/highcharts.js"></script> --%>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

	
<body>

<script type="text/javascript">

// 수정 버튼을 눌렀을 때, 입력폼으로 전환
function up(index){
	
	if($("#upbtn").val() == "등록"){
		if(confirm("등록하시겠습니까?")){
			
			/* 그냥 form 액션
			if(index == 0)var frm = document.forms[0];
			if(index == 1)var frm = document.forms[1];
			
					frm.action = 'updateMAll.do';
					frm.target = "frmSys";
					frm.meth  class='boder-black'od = 'post';
					frm.submit();
					
					
					$(".nomalFrom").css("display", "inline");
					$(".upFrom").css("display", "none");
					$("#upbtn").val("수정");
					
					reload();
			 form 액션 종료 */
			 
			 // 음 필요없을지도?
			$.ajax({
				type : "post",
				dataType : "text", 
				 async : false,
				url : "updateMAll.do",
				data : {
					yyyy: $("input:hidden[name='yyyy']").val(), 
					mm: $("input:hidden[name='mm']").val(), 
					mode: $("input:hidden[name='mode']").val(), 
					uId: $("input:hidden[name='uId']").val(), 
					idx: $("input:hidden[name='idx']").val(), 
					gasM: $("input[name='gasM']").val(), 
					elM: $("input[name='elM']").val(), 
					wtM: $("input[name='wtM']").val(), 
					itM: $("input[name='itM']").val(), 
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
		return;
	}
	$(".nomalFrom").css("display", "none");
	$(".upFrom").css("display", "inline");
	
	$("#upbtn").val("등록");
	
}

function reload() { (location || window.location || document.location).reload(); }




// 총합 3개월 총 지출 금액 차트
var chart;
$(document).ready(function() {
	
	// 전월, 전전월 데이터 없을 때 0으로 채워주기
	//<c:set var='mode' value='i'/>
	
	chart = new Highcharts.chart('container', {

	    title: {
	        text: '공과금 비교 (최근 3개월)'
	    },

	    subtitle: {
	        text: '${my:NVL(arrViewPast3[2].yyyy, 0)}년도 ${my:NVL(arrViewPast3[2].yyyy, 0)}월 ~${arrViewPast3[0].yyyy}년도 ${arrViewPast3[0].mm}월 '
	    },

	    yAxis: {
	        title: {
	            text: '금액(원)'
	        }
	    },

	    xAxis: {
	        accessibility: {
	            rangeDescription: '??? 잘모르겠음 Range: 2010 to 2017'
	        }
	    },

	    legend: {
	        layout: 'vertical',
	        align: 'right',
	        verticalAlign: 'middle'
	    },

	    plotOptions: {
	        series: {
	            label: {
	                connectorAllowed: false
	            },
	            pointStart: ${arrViewPast3[0].mm-2}
	        }
	    },

	    series: [{
		        name: '가스',
		        data : [${my:NVL(arrViewPast3[2].gasM,0)},${my:NVL(arrViewPast3[1].gasM,0)}, ${arrViewPast3[0].gasM}]
		    },
		    {
		        name: '전기',
		        data : [${my:NVL(arrViewPast3[2].elM,0)}, ${my:NVL(arrViewPast3[1].elM,0)}, ${arrViewPast3[0].elM}]
		
		    },
		    {
		        name: '수도',
		        data : [${my:NVL(arrViewPast3[2].wtM,0)}, ${my:NVL(arrViewPast3[1].wtM,0)},${arrViewPast3[0].wtM}]
		
		    },
		    {
		        name: '인터넷',
		        data : [${my:NVL(arrViewPast3[2].itM,0)}, ${my:NVL(arrViewPast3[1].itM,0)}, ${arrViewPast3[0].itM}]
		
		    },
	     ],

	    responsive: {
	        rules: [{
	            condition: {
	                maxWidth: 500
	            },
	            chartOptions: {
	                legend: {
	                    layout: 'horizontal',
	                    align: 'center',
	                    verticalAlign: 'bottom'
	                }
	            }
	        }]
	    }

	});
});


//전월,당월 막대 그래프 비교 차트
var chart2;
$(document).ready(function() {
	
	chart = new Highcharts.chart('container2', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: '공과금 세부 비교 (전월)'
	    },
	    subtitle: {
	        text: '(당월) ${arrViewPast[0].yyyy}년도 ${arrViewPast[0].mm}월 | (전월) ${arrViewPast[1].yyyy}년도 ${arrViewPast[1].mm}월'
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
	    	<c:forEach var="arrC2" items="${arrViewPast}" varStatus="st">
	    	 	{
	        name: '${arrC2.mm}월',
	        data : [${arrC2.gasM}, ${arrC2.elM}, ${arrC2.wtM}, ${arrC2.itM}]

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
          <li>전체</li>
        </ol>
        <h2>전체</h2>

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
                	<!-- !!이건 나중에 고지서 보고 컬럼 더 만들어야함 -->
                	 <span style="float: right;" ><a href="#" > >> 자세히 보러가기</a></span>
                	 <h3>${arr.yyyy}년도 ${arr.mm}월 공과금</h3>
				<form name="frmReg${st.index}" meth  class='boder-black'od="post">
				
				
				<c:set var='mode' value='u'/>
				<%--<c:if test="${arr.gasM == null && arr.elM == null && arr.wtM == null && arr.itM == null}"> --%>
				<c:if test="${arr.idx == null}"> 
				<c:set var='mode' value='i'/>
				</c:if>
				
                <input type="hidden" value="${arr.idx}" name='idx' id='idx'/>
                <input type="hidden" value="${mode}" name='mode' id='mode'/>
                <input type="hidden" value="${arr.yyyy}" name='yyyy' id='yyyy'/>
                <input type="hidden" value="${arr.mm}" name='mm' id='mm'/>
                <input type="hidden" value="${arr.uId}" name='uId' id='uId'/>
                	<table class='tb'>
                	<tbody>
					<tr>
						<th  class='boder-black'>가스비</th>
						<th  class='boder-black'>전기세</th>
						<th  class='boder-black'>수도세</th>
						<th  class='boder-black'>인터넷</th>
					</tr>
					<tr>
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.gasM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.gasM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name='gasM' value="${arr.gasM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom' ><input  class='manageI' type="text" name='gasM' value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.elM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.elM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="elM" value="${arr.elM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom'><input  class='manageI' type="text" name="elM" value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.wtM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.wtM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="wtM" value="${arr.wtM}""/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom' ><input  class='manageI' type="text" name="wtM" value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.itM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.itM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="itM"  value="${arr.itM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom'><input  class='manageI' type="text" name="itM" value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
                	</tbody>
                	</table>
                		<input id='upbtn' class='btn_brown' type="button" onclick="up(${st.index});" value="수정"/> 
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
      			<th  class='boder-black'>가스</th>
      			<th  class='boder-black'>전기</th>
      			<th  class='boder-black'>수도</th>
      			<th  class='boder-black'>인터넷</th>
      			</tr>
		      <c:forEach var='arrC' items='${arrViewPast}' varStatus="st">
      			<tr>
      			<th  class='boder-black'>${arrC.yyyy}년 ${arrC.mm}월</th>
      			
      			<th  class='boder-black'>
      			<span class='nomalFrom'><fmt:formatNumber value="${arrC.gasM}" type="number"/>원
      			</span>
      			</th>
      			
      			<th  class='boder-black'>
      			<span class='nomalFrom'><fmt:formatNumber value="${arrC.elM}" type="number"/>원
      			</span>
      			</th>
      			
      			<th  class='boder-black'>
      			<span class='nomalFrom'><fmt:formatNumber value="${arrC.wtM}" type="number"/>원
      			</span>
      			</th>
      			
      			<th  class='boder-black'>
      			<span class='nomalFrom'><fmt:formatNumber value="${arrC.itM}" type="number"/>원
      			</span>
      			</th>      			
      			</tr>	
      			</c:forEach>
      			
      			<c:set var='gas' value='${arrViewPast[1].gasM - arrViewPast[0].gasM}'/>
      			<c:set var='el' value='${arrViewPast[1].elM - arrViewPast[0].elM}' />
      			<c:set var='wt' value='${arrViewPast[1].wtM - arrViewPast[0].wtM}'/>
      			<c:set var='it' value='${arrViewPast[1].itM - arrViewPast[0].itM}' />
      		
      			
      			<tr>
      				<th>개별 총</th>
      				<th class='boder-black'><fmt:formatNumber value="${gas}" type="number"/>원</th>
      				<th class='boder-black'><fmt:formatNumber value="${el}" type="number"/>원</th>
      				<th class='boder-black'><fmt:formatNumber value="${wt}" type="number"/>원</th>
      				<th class='boder-black'><fmt:formatNumber value="${it}" type="number"/>원</th>
      			</tr>	    
      		</tbody>
     		</table>
     		
     		<br><br>
     		
      		<c:set var='avg' value="${gas+el+wt+it}" ></c:set>
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
      		
      		<h3>한눈에 보는 내 공과금</h3>
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
          <script>
      	// 검색 버튼
      	function schGo(){
      		
      		location.href='index.do?yyyy='+ $("select[name=yyyyC]").val() + '&mm=' + $("select[name=mmC]").val() + '&uId=' + $("input:hidden[name='uId']").val(); 
      		
      	}
          </script>
<%-- 
          <div class="col-lg-4">
            <div class="portfolio-info">
              <h3>Project information</h3>
              <ul>
                <li><strong>Category</strong>: Web design</li>
                <li><strong>Client</strong>: ASU Company</li>
                <li><strong>Project date</strong>: 01 March, 2020</li>
                <li><strong>Project URL</strong>: <a href="#">www.example.com</a></li>
              </ul>
            </div>
            <div class="portfolio-description">
              <h2>th  class='boder-black'is is an example of portfolio detail</h2>
              <p>
                Autem ipsum nam porro corporis rerum. Quis eos dolorem eos itaque inventore commodi labore quia quia. Exercitationem repudiandae officiis neque suscipit non officia eaque itaque enim. Voluptatem officia accusantium nesciunt est omnis tempora consectetur dignissimos. Sequi nulla at esse enim cum deserunt eius.
              </p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Portfolio Details Section -->
--%>
  </main><!-- End #main -->

</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>