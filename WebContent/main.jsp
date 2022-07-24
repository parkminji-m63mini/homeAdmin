<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>

		<!-- 차트 -->
	<jsp:include page="/WEB-INF/views/common/chart.jsp"/>
	
<!DOCTYPE html>
<html lang="kn">

<head>
<style>


</style>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/series-label.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>
 <script type="text/javascript" src="${contextPath}/resources/js/loginchk.js"></script>
<!-- ------------------------- header ---------------------------- -->
<jsp:include page="WEB-INF/views/common/header.jsp" />
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<script src="${contextPath}/resources/js/common.js"></script>




<script type="text/javascript">


</script>

<body>



	<main id="main">


		<!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details"    style="padding-top: 102px;">
      <div class="container">

        <div class="">

          <div class="">
			 <div class="portfolio-info">
              <div class="swiper-wrapper align-items-center">


					<%--이번달 요금 --%>
                <div class="swiper-slide">
                 <p></p>
							<div style="float: right;">
							<a href="homeInfo/index.do">
              				 <img  class="main_set_Btn mobile-nav-toggle" alt="" src="${contextPath}/resources/img/icon/setting/settingBtn.png">
              				 </a>
              				 </div>
							<c:if test="${homeImg == null}">
							<div class="imgW">
								<img id="homeImg" style="left: 23%;"
									src="${contextPath}/resources/img/profile/defaultProfile.jpg" class="img">
								
								
								<c:if test="${list.photo ne null}">
				              	  <img class="img_s" id="preview"   alt="" src="${contextPath}/upload/${list.photo}">
				              	 </c:if>
				              	 <c:if test="${list.photo eq null}">
				              	 	<c:if test="${list.profile ne null}">
				              	 		<img class="img_s" id="preview"  alt="" src="${list.profile}">
				              	 	</c:if>
				              	 	<c:if test="${list.profile eq null}">
				              	 <img class="img_s" id="preview"  style="border: 4px solid #0000005c;" alt="" src="${contextPath}/resources/img/profile/defaultProfile.jpg">
				              	 	</c:if>
				              	 </c:if>
								
							</div>
							</c:if>
							<c:if test="${homeImg != null}">
							<div class="imgW">
							<img id="homeImg" style="left: 23%;"
							 src="${contextPath}${homeImg }" class="img">
							 
							 <c:if test="${list.photo ne null}">
				              	  <img class="img_s" id="preview"   alt="" src="${contextPath}/upload/${list.photo}">
				              	 </c:if>
				              	 <c:if test="${list.photo eq null}">
				              	 	<c:if test="${list.profile ne null}">
				              	 		<img class="img_s" id="preview"  alt="" src="${list.profile}">
				              	 	</c:if>
				              	 	<c:if test="${list.profile eq null}">
				              	 <img class="img_s" id="preview"  style="border: 4px solid #0000005c;" alt="" src="${contextPath}/resources/img/profile/defaultProfile.jpg">
				              	 	</c:if>
				              	 </c:if>
							</div>
							</c:if>

				</div>
			</div>
			<br>
			<div style="width: 100%; text-align: center;">
			<h4 style=" margin: 0 0 4px 0;">${sessionScope.ssnNM} 00 하우스</h4>
			<a href="#" style="text-decoration: revert;" onclick="copy('${contextPath}/visit/write.do?uId=${sessionScope.ssID}', '방명록 주소 복사 완료! 링크를 친구에게 보내줘!');">방명록 주소 복사</a>
			</div>
		<!-- End Services Section -->
			<hr>
				<div class="container-fluid" data-aos="fade-up">

					<p class="main-t">아! 맞다 오늘!</p>
					

				<div class="row">
						<ul>
							<li>ss</li>
							<li>ss</li>
							<li>ss</li>
						</ul>
				</div>

			</div>
			<hr>
			
			    <section id="services" class="services section-bg service3" style="">
			<div class= "checkList-container container" >
				 <span><a  href="checkList/index.do"style="float: right; text-align:right;" > &gt;&gt;&gt;</a></span>
					<p class="main-t">체크리스트
					</p>
				
				
				<ul class = "slider-container simple-list" id="slider">
					    <c:choose>
					    	<c:when test = "${empty checkList }">
					    	<div class="col-md-6 col-lg-4 " >
					    		<p><a href="checkList/insertView" >체크리스트 만들기</a></p>
					    	</div>
					    	</c:when>
					    	<c:otherwise>
					    			<c:forEach var="item" items = "${checkList }">
										<li class = "slide">
				     						<table style="width: 100%;">
				     							<colgroup>
				     								<col style="width: 100%;">
				     							</colgroup>
				     							<tr>
				     								<th>
				           						 <div class="box">
				            					
				            					
				              						<h4 class="title">${item.listName }</h4>
				              						<div class = "row">
				              						<div class="col-4 " ></div>
				              						 <div class="col-4 " >
				                               	<table>
				             						<c:forEach var="detail" items = "${checkListDetail }">
				              								<c:if test = "${item.idx == detail.mIdx }">
				              								 
				            									  		<tr>
				            									  			<th><input  id = "${detail.dIdx}" type="checkbox" name = "color" value ="blue" <c:if test = '${detail.checkYN eq "Y" }'>checked = "checked"</c:if>/></th>
				            									  			<th>${detail.content }</th>
				            									  		</tr>
				            									 
				             									 
				              								</c:if>
				             							 </c:forEach>
				             						</table>
				             						</div>
				             						<div class="col-4 " ></div>
				             						</div>
				           				        </div>
				           				        </th>
				     							</tr>
				     						</table>
				         		     </li>
     							</c:forEach>
					    	
					    	</c:otherwise>
					    </c:choose>
			
				
			
			
				</ul>
				<a href = "#" id="prev">&lt; </a>
				<a href = "#" id="next">></a>
				
			
			</div><!-- end container -->
		</section>
			<hr>
		<!-- ======= Why Us Section ======= -->
			<div class="container-fluid" data-aos="fade-up">
 <span><a  href="manageM/index.do"style="float: right; text-align:right;" > &gt;&gt;&gt;</a></span>
					<p class="main-t">공과금</p>
					

				<div class="row">
					<!-- 전원 당월 막대그래프 비교 -->
      			<figure class="highcharts-figure">
		    	<div id="container1"></div>
		    	<p class="highcharts-description">
				</figure>
				</div>

			</div>

			<hr>
		<!-- End Why Us Section -->



	

		<!-- ======= 체크리스트 ======= -->
		
			
		
	
		<!-- End Testimonials Section -->

		
				<!--  방문자   -->
	
		<section id="services" class="services visit" style="padding-top: 10px;padding-bottom: 10px;">
		<div class="container">
		 <div class="container-fluid" data-aos="fade-up">
		 <span><a  href="visit/index.do"style="float: right; text-align:right;" > &gt;&gt;&gt;</a></span>
					<p class="main-t">방명록</p>
					
	 			<c:choose>
	 				<c:when test = "${empty visitList }">
	 				<section id="services" class="services section-bg" style="padding-top: 10px;padding-bottom: 10px;">
     		<div  class="col-md-6 col-lg-4 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100" style="width: 100%;">
	 			<%-- 상단 --%>
	 			<div  class="box">
     		<span>데이터가 없습니다</span>
     		</div>
     		</div>
     		</section>
	 				</c:when>
	 				
	 				<c:otherwise>
	 				<div  class="col-lg-6" data-aos="zoom-in" data-aos-delay="100" style="width: 100%;  ">
			 				<%-- 상단 --%>
			 			<div  class="box" style = "padding : 10px">
			 			<table id="visitList" style="width: 100%;">
			 				<colgroup>
								<col style="width: 15%">
								<col style="width: 65%">
								<col style="width: 10%">
							</colgroup>
			 			<tbody>
			 				<tr style = "background-color : #f5f8fd;">
			 				    <th>작성자</th>
			 					<th>내용</th>
			 					<th>방문일</th>
			 					
			 				</tr>
			 				<c:forEach var='arr' items="${visitList}" varStatus="st">
			 				<tr onclick="location.href='visit/index.do'" style="cursor:hand">
			 					<th>${arr.vNm }	</th>
			 				    <th>${arr.cont }	</th>
			 					<th>${arr.vdt }	</th>
			 					
			 				</tr>
			 				</c:forEach>	
			 				
			 			</tbody>
			 			</table>
			 			</div>
			 			<%-- 상단 end --%>
			 			</div>
	 				</c:otherwise>
	 			
	 			</c:choose>
	 		
	 			
	 		
	 		
	 		
	 		
	 		</div>
	 		</div>
	 		</section>
			</div>
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
			
			sliderWrapper[0].style.height = (topHeight*2)+'px';
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
			console.log("클릭")
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
			console.log("클릭")
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
	
	

	
function prevClick(){
	console.log($("#prev").val());
	$("#prev").click();
}


</script>

</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous"></script>
</html>