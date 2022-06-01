<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
 <script src="https://code.highcharts.com/highcharts.js"></script>
<script type="text/javascript">

// 공과금에 사용하는 펑션 모음
/* 사용방법 
 * 1. 해당 파일 include
   2. 원하는 차트,데이터 ${list} 이름으로 뽑기
   3. html은 아래 적어둠. id값만 맞춰서 잘 쓰면 됨
 
   
   
   jsp 파일에 쓰는 html
  
	<figure class="highcharts-figure">
   <div id="container1"></div>
   <p class="highcharts-description">
   </p>
	</figure>
   
 */

var chart01;
var chart03;
var chart06;	
var chart12;	


// 콤마 값 찍어주는 옵션
function chartOption(){
	Highcharts.setOptions({
		lang: {
			thousandsSep: ','
		}
	});
}

//전월 당월 비교 // ${arrViewPast}
function chart1(type, text, text2, xcategories){
				// 차트타입, 타이틀, 서브타이들, x축 컬럼명
	chartOption();
				
				console.log()
	
	//전월 당월 비교
	chart01 = new Highcharts.chart('container1', {
	    chart: {
	        type: type
	    },
	    title: {
	        text: text
	    },
	    subtitle: {
	        text: text2
	    },
	    xAxis: {
	        categories: 
	        	xcategories
	        ,
	        crosshair: true
	    },
	    yAxis: {
	       	//max: 50000,
	        title: {
	            text: '금액(원)'
	        },
		    labels : {

				format: '{value:,.0f}',

			},
	    },
	    tooltip: {
	        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
	        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
	            '<td style="padding:0"><b>{point.y:,0f}</b></td></tr>',
	        footerFormat: '</table>',
	        shared: true,
	        useHTML: true
	    },
	    plotOptions: {
	        
	    },
	    series: [
	    	<c:forEach var="arrC2" items="${arrViewPast}" varStatus="st">
	    	 	{
	        name: '${arrC2.mm}월',
	        <c:if test="${type == 'all'}">
	        data : [${arrC2.gasM}, ${arrC2.elM}, ${arrC2.wtM}, ${arrC2.itM}, ${arrC2.maM}]
			</c:if>	
    	 	<c:if test="${type == 'gas'}">
    	 	 data : [${arrC2.suma}, ${arrC2.uGm}, ${arrC2.monGu}, ${arrC2.useG}]
    	 	</c:if>	
    	 	<c:if test="${type == 'it'}">
   		 	 data : [${arrC2.defM}, ${arrC2.aGm}, ${arrC2.sGm}, ${arrC2.mGm}, ${arrC2.suma}]
   	 	</c:if>	
    	 	
	    },
	    </c:forEach>
	   ]

	});
	
	}
	
// 랜덤으로 색상 배정하는 건데 안됨 ^^
function getRandColor(brightness){
	//6 levels of brightness from 0 to 5, 0 being the darkest
	var rgb = [Math.random() * 256, Math.random() * 256, Math.random() * 256, Math.random() * 256];
	var mix = [brightness*51, brightness*51, brightness*51, brightness*51]; //51 => 255/5
	var mixedrgb = [rgb[0] + mix[0], rgb[1] + mix[1], rgb[2] + mix[2], rgb[3] + mix[3]].map(function(x){ return Math.round(x/2.0)})
	console.log("rgba(" + mixedrgb.join(",") + ")");
	return "rgba(" + mixedrgb.join(",") + ")";
	}

function chart3(type, text, text2, xcategories){
	chartOption();
	
	console.log(type + " / " + text + " / " + xcategories);
//총합 3개월 총 지출 금액 차트	
chart03 = new Highcharts.chart('container3', {
    chart: {
        type: type
    },
    title: {
        text: text
    },
    subtitle: {
        text: text2
    },
    xAxis: {
        categories: xcategories,
        crosshair: true
    },
    yAxis: {
       	//max: 50000,
        title: {
            text: '금액(원)'
        },
	    labels : {

			format: '{value:,.0f}',

		},
    },
    tooltip: {
        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
            '<td style="padding:0"><b>{point.y:,0f} 원</b></td></tr>',
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
    	
    	<c:forEach var="arrC2" items="${arrViewPast3}" varStatus="st">
    	 	{
        name: '${arrC2.mm}월',
        <c:if test="${type == 'gas'}">
        data : [${arrC2.suma}]
		</c:if>
    	<c:if test="${type == 'all'}">
    	  data : [${arrC2.gasM}, ${arrC2.elM}, ${arrC2.wtM}, ${arrC2.itM}, ${arrC2.maM}]
    	</c:if>
        
    },
    </c:forEach>
   ]
    

		});

}
	
	
//총합 6개월 총 지출 금액 차트	  // ${arrViewPast6}	
function chart6(type, text, text2, xcategories){
			// 차트타입, 타이틀, 서브타이들, x축 컬럼명
	chartOption();
	
			console.log(type + " / " + text + " / " + xcategories);
	//총합 6개월 총 지출 금액 차트	
		chart06 = new Highcharts.chart('container6', {
		    chart: {
		        type: type
		    },
		    title: {
		        text: text
		    },
		    subtitle: {
		        text: text2
		    },
		    xAxis: {
		        categories: xcategories,
		        crosshair: true
		    },
		    yAxis: {
		       	//max: 50000,
		        title: {
		            text: '금액(원)'
		        },
			    labels : {

					format: '{value:,.0f}',

				},
		    },
		    tooltip: {
		        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		            '<td style="padding:0"><b>{point.y:,0f} 원</b></td></tr>',
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
		    	
		    	<c:forEach var="arrC2" items="${arrViewPast6}" varStatus="st">
		    	 	{
		        name: '${arrC2.mm}월',
		        <c:if test="${type == 'gas'}">
		        data : [${arrC2.suma}]
				</c:if>
		    	<c:if test="${type == 'all'}">
		    	  data : [${arrC2.gasM}, ${arrC2.elM}, ${arrC2.wtM}, ${arrC2.itM}, ${arrC2.maM}]
		    	</c:if>
		        
		    },
		    </c:forEach>
		   ]
		    

				});

}

//1년치 // ${arrViewPast12}
function chart12(text, text2,  cList, rList){
			// 타이틀, 서브타이들,  type 배열 리스트, x컬럼 데이터
			// 반복횟수는 컨트롤러에서 세팅
	chartOption();
		
			console.log("확인");
			
	// x축 컬럼 개수만큼 돌리기 위해 셋팅 (10개까지 될 것 같지 않아서 10개로 제한)
			
			
	
	// 1년치
	chart12 = new Highcharts.chart('container12', {
	    title: {
	        text: text
	    },

	    subtitle: {
	        text: text2
	    },

	    yAxis: {
	        title: {
	            text: '금액(원)'
	        },
	    labels : {

			format: '{value:,.0f}',

		},
	    },
	    xAxis: {
	    	   categories: [<c:forEach items="${arrViewPast12}" var="v12"> '${v12.yyyy}/${v12.mm}', </c:forEach>],
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
	            }
	        }
	    },

	    series: [
	    	<c:forEach var="i" begin="0" end='${repeat}'>
	    	{
	    	  type: cList[${i}],
	        name: rList[${i}],
	        <c:if test="${type == 'all'}">
	        data : [<c:forEach items="${arrViewPast12}" var="v12"> 
	        <c:if test="${i == 0}">
	        ${v12.gasM}, 
	        </c:if>
	        <c:if test="${i == 1}">
	        ${v12.elM}, 
	        </c:if>
	        <c:if test="${i == 2}">
	        ${v12.wtM}, 
	        </c:if>
	        <c:if test="${i == 3}">
	        ${v12.itM}, 
	        </c:if>
	        <c:if test="${i == 4}">
	        ${v12.maM}, 
	        </c:if>
	        </c:forEach>]
	        </c:if>
	        <c:if test="${type == 'gas'}">
	        data : [<c:forEach items="${arrViewPast12}" var="v12"> ${v12.suma }, </c:forEach>]
			</c:if>
	        <c:if test="${type == 'it'}">
	        data : [<c:forEach items="${arrViewPast12}" var="v12"> ${v12.suma }, </c:forEach>]
			</c:if>
	    },
	    </c:forEach>
	   
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
}
</script>
<body>

</body>
</html>