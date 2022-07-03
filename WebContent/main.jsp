<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>

		<!-- 차트 -->
	<jsp:include page="/WEB-INF/views/common/chart.jsp"/>
<!DOCTYPE html>
<html lang="kn">

<head>
<style>

.checkList-container{
	position:relative;
	width : 100%;
	over-flow : hidden;
}

.slider-container{
	position : absolute;
	width:100%;
	}
	
.slide {
	position : absolute;
	width : 100%;
	padding : 0 10%;
	box-sizing : border-box;
	top : 50%;
	transform : translateY(-50%);
	text-align : center;
	overflow : hidden;
}

.slider-container.animated{
	-webkit-transition : left .3s ease-in;
	transition : left .3s ease-in;
}

#prev,#next{
	position : absolute;
	top : 50%;
	left : 50%;
	transform : translateY(-50%);
	z-index : 999999;
	display : inline-block;
	height : 5em;
	width : 5em;
	border-radius : 50%;
	background-position : center center;
	background-repeat : no-repeat;
	-webkit-transition : all .3s ease-in;
	transition : all .3s ease-in; 
}

#prev.disabled, #next.disabled{display:none;}

#prev{
	margin-left : -100px;
}

#next{
	margin-left : 100px;
}
</style>
</head>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
 <script type="text/javascript" src="${contextPath}/resources/js/loginchk.js"></script>
<!-- ------------------------- header ---------------------------- -->
<jsp:include page="WEB-INF/views/common/header.jsp" />

<script type="text/javascript">


</script>

<body>



	<main id="main">

		<!-- ======= About Section ======= -->
		<section id="hero" class="clearfix">

			<div class="container">
				<div class="row">
                 <p> 집사진</p>
					<div class="col-lg-5 col-md-6">
						<div class="about-img" data-aos="fade-right" data-aos-delay="100">
							<c:if test="${sessionScope.ssID == null}">
								<img id="homeImg"
									src="<%=request.getContextPath()%>/resources/img/main_home_img.png" class="img-fluid">
							</c:if>
							<c:if test="${sessionScope.ssID != null}">
							<img id="homeImg" src="${pageContext.request.contextPath}${homeImg }" class="img-fluid">
							</c:if>
						</div>
					</div>

				</div>
			</div>

		</section>
		<!-- End About Section -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services section-bg">
			
			
		</section>
		<!-- End Services Section -->

		<!-- ======= Why Us Section ======= -->
		<section id="why-us" class="why-us">
			<div class="container-fluid" data-aos="fade-up">

				<header class="section-header">
					<h3>공과금</h3>
					
				</header>

				<div class="row">

					<!-- 전원 당월 막대그래프 비교 -->
      			<figure class="highcharts-figure">
		    	<div id="container1"></div>
		    	<p class="highcharts-description">
				</figure>
				</div>

			</div>

			
		</section>
		<!-- End Why Us Section -->



	

		<!-- ======= Testimonials Section ======= -->
		<section id="services" class="services section-bg">
		
			<div class= "checkList-container container">
				<ul class = "slider-container simple-list" id="slider">
					    <div class="row">
						<c:forEach var="item" items = "${checkList }">
						<li class = "slide">
     						<div class="col-lg-10"  >
           						 <div class="box">
            					 
              						<h4 class="title"><a href="">${item.listName}</a></h4>
              
             						<c:forEach var="detail" items = "${checkListDetail }">
              								<c:if test = "${item.idx == detail.mIdx }">
              								 <div class="about-content detailContent" >
            								  <ul>
            									  <div id="box" >
              										  <li style="list-style:none;"> 
              											  <input  id = "${detail.dIdx}" type="checkbox" name = "color" value ="blue" <c:if test = '${detail.checkYN eq "Y" }'>checked = "checked"</c:if>/>
              													  ${detail.content }
              				 							 </li>
                 									 </div>
             									 </ul>
                    						 </div>
              								</c:if>
             							 </c:forEach>
               
           						 </div>
         					</div>
     					</c:forEach>
					
				</div>
				</ul>
				
				<a href = "#" id="prev">prev</a>
				<a href = "#" id="next">next</a>
			
			
			</div><!-- end container -->
		
		
	
		</section>
		<!-- End Testimonials Section -->

		
				
	
		<section id="services" class="services section-bg" style="padding-top: 10px;padding-bottom: 10px;">
		<div class="container">
		 <div class="row  justify-content-center">
	 		<div  class="col-lg-6" data-aos="zoom-in" data-aos-delay="100" style="width: 100%;">
	 			<%-- 상단 --%>
	 			<div  class="box">
	 			<table style="width: 100%;">
	 				<colgroup>
						<col style="width: 15%">
						<col style="width: 65%">
						<col style="width: 10%">
					</colgroup>
	 			<tbody>
	 				<tr>
	 				    <th>내용	</th>
	 					<th>작성자	</th>
	 					<th>방문일	</th>
	 					
	 				</tr>
	 				<c:forEach var='arr' items="${visitList}" varStatus="st">
	 				<tr>
	 				    <th>${arr.cont }	</th>
	 					<th>${arr.vNm }	</th>
	 					<th>${arr.vdt }	</th>
	 					
	 				</tr>
	 				</c:forEach>	
	 				
	 			</tbody>
	 			</table>
	 			</div>
	 			<%-- 상단 end --%>
	 		
	 		
	 		</div>
	 		
	 		</div>
	 		</div>
	 		</section>
			
			
		

		


		


		<!-- ------------------------- footer ---------------------------- -->
		<jsp:include page="WEB-INF/views/common/footer.jsp" />



	</main>
	<!-- End #main -->
	<script>
	$(document).ready(function(){
	    
		
	/*	
		$.ajax({
			type : "post",
			dataType : "text",
			url : "${contextPath}/main/getData.do",
			data : {"id" : ${sessionScope.ssID }},
			success : function(data){
				console.log("성공");
				console.log(data);
				$.each(data,function(index, item){
					colsole.log(item);
				});
			},
			error : function(){
				console.log("실패")
			}
			
		});
		
		*/
		list =['가스','전기', '수도','인터넷', '관리비'];
		
		// 전월, 당월
		chart1("column", '전월 vs 당월','(전월) ${arrViewPast[0].yyyy}년도 ${arrViewPast[0].mm}월 | (당월) ${arrViewPast[1].yyyy}년도 ${arrViewPast[1].mm}월 ', list); // ${arrViewPast}
		//차트타입, 타이틀, 서브타이들, x축 컬럼명
		
		
		var sliderWrapper = document.getElementsByClassName("checkList-container");
		var sliderContainer = document.getElementsByClassName("slider-container");
		var slides = document.getElementsByClassName("slide");
		var slideCount = slides.length;
		console.log(slideCount)
		var currentIndex = 0;
		var topHeight = 0;
		var navPrev = document.getElementById("prev");
		var navNext = document.getElementById("next");
		
		
		// 슬라이드의 높이 확인하여 부모의 높이로 지정하기
		function calculateTallestSlide(){
			
			for(var i = 0 ; i < slideCount ; i++){
				if(slides[i].offsetHeight > topHeight){
					topHeight = slides[i].offsetHeight;
				}
				
			}
			sliderWrapper[0].style.height = topHeight+'px';
			sliderContainer[0].style.height = topHeight+'px';
			
		}
		calculateTallestSlide();
		console.log(topHeight)
		
		// 슬라이드가 있으면 가로로 배열하기
		for(var i = 0 ; i < slideCount ; i++){
			slides[i].style.left = i*100 + '%';
		}
		
		// 슬라이드 이동 함수
		function goToSlide(idx){
			sliderContainer[0].style.left = idx * -100  + '%';
			sliderContainer[0].classList.add('animated');
			currentIndex = idx;
			
			//updateNav();
		}
		
		// 버튼기능 업데이트 함수
		function updateNav(){
			console.log("currentIndex"+currentIndex)
			console.log("slideCount"+slideCount)
			// 처음일때
			if(currentIndex == 0){
				console.log("여기다")
				navPrev.classList.add('disabled');
			}else{
				console.log("!")
				navPrev.classList.remove('disabled');
			}
			//  마지막일때
			if(currentIndex == (slideCount-1)){
				console.log("2")
				navNext.classList.add('disabled');
			}else{
				console.log("3")
				navPrev.classList.remove('disabled');
			}
		}
		
		
		// 버튼을 클릭하면 슬라이드 이동시키기
		navPrev.addEventListener('click', function(e){
			e.preventDefault();
			//goToSlide(currentIndex-1);
			// 처음이 아니라면 goToSlide(currentIndex-1);
			// 처음이라면 
			
			if(currentIndex > 0 ){
				goToSlide(currentIndex-1);
				
			}else{
				goToSlide(slideCount-1)
			}
		});
		
		navNext.addEventListener('click', function(e){
			e.preventDefault();
			//goToSlide(currentIndex+1);
			if(currentIndex < slideCount -1){
				goToSlide(currentIndex +1);
			}else{
				goToSlide(0);
			}
		});
		
		
		// 첫번째슬라이드 먼저 보이도록 하기
		goToSlide(0);
	});
	
	

	



</script>



</body>

</html>