<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<!DOCTYPE html>
<html lang="kn">

<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
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




// 총합 6개월 총 지출 금액 차트
var chart;
$(document).ready(function() {
	
	chart = new Highcharts.chart('container', {

	    title: {
	        text: '공과금 비교 (최근 6개월)'
	    },

	    subtitle: {
	        text: '(당월) 00년도 00월 | (전월) 00년도 00월'
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
	            pointStart: 2010
	        }
	    },

	    series: [{
	        name: 'Installation',
	        data: [43934, 52503, 57177, 69658, 97031, 119931, 137133, 154175]
	    }, {
	        name: 'Manufacturing',
	        data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
	    }, {
	        name: 'Sales & Distribution',
	        data: [11744, 17722, 16005, 19771, 20185, 24377, 32147, 39387]
	    }, {
	        name: 'Project Development',
	        data: [null, null, 7988, 12169, 15112, 22452, 34400, 34227]
	    }, {
	        name: 'Other',
	        data: [12908, 5948, 8105, 11248, 8989, 11816, 18274, 18111]
	    }],

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

        <div class="row gy-4">

          <div class="col-lg-8">
            <div class="portfolio-info">
              <div class="swiper-wrapper align-items-center">

					<%--이번달 요금 --%>
                <div class="swiper-slide">
                	<c:forEach var='arr' items='${arrViewNow}' varStatus="st">
                	<!-- 이건 나중에 고지서 보고 컬럼 더 만들어야함 -->
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
      		<c:set var='avg' value="${gas+el+wt+it}" ></c:set>
			<h4><fmt:formatNumber value="${avg}" type="number"/>원 절약했어!</h4>
      		
      		
      		<!-- 전원 당월 막대그래프 비교 -->
      		<figure class="highcharts-figure">
		    <div id="container2"></div>
		    <p class="highcharts-description">
		        Basic line chart showing trends in a dataset. This chart includes the
		        <code>series-label</code> module, which adds a label to each line for
		        enhanced readability.
		    </p>
			</figure>
      		
      		
      		<!-- 6개월간 총 지출 금액 차트 -->
      		<figure class="highcharts-figure">
		    <div id="container"></div>
		    <p class="highcharts-description">
		        Basic line chart showing trends in a dataset. This chart includes the
		        <code>series-label</code> module, which adds a label to each line for
		        enhanced readability.
		    </p>
			</figure>

			
              </div>
            </div>
          </div>

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

  </main><!-- End #main -->

</body>
</html>