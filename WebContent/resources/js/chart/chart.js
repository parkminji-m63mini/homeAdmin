<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>

function chart1(){

Highcharts.setOptions({
	lang: {
		thousandsSep: ','
	}
});


//총합 6개월 총 지출 금액 차트	
	chart = new Highcharts.chart('container', {
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: '공과금 세부 비교 (6개월)'
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
	    	<c:forEach var="arrC2" items="${arrViewPast2}" varStatus="st">
	    	 	{
	        name: '${arrC2.mm}월',
	        data : [${arrC2.suma}]

	    },
	    </c:forEach>
	   ]
	    

			});

}