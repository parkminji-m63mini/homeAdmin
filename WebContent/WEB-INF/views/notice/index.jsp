<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="kn">

<head>
<meta charset="UTF-8">
<title>공지사항</title> 
</head>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	  <script src="${contextPath}/resources/js/common.js"></script>
	<script type="text/javascript">  
	    $(document).ready(function(){
	  
	  proc('indexProc.do?curPage=' + ${curPage});
	  
	});
  
  function proc(url){
		$.ajaxSettings.traditional = true;
			$.ajax({
				type : "post"
				,dataType : "html"
				,data :{
				 limit :10
				}
				,url : url
				,success : listGo  
				,error : function(result) { alert(result + "실패"); }
			});
		}
		function listGo(msg) { 
			$("#ListFrm").html(msg);	
		}
		
		</script>
<body>
<main id="main">

 <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="">

          <div class="">
				
				<section id="breadcrumbs" class="breadcrumbs">
				<div class="container">
				        <ol>
				          <li><a href="index.html">공지사항</a></li>
				          <li>공지사항</li>
				        </ol>
				
				      </div>
				    </section><!-- End Breadcrumbs -->

   <div class="portfolio-info">
              <div class="swiper-wrapper align-items-center">


					<%--이번달 요금 --%>
                <div class="swiper-slide">

<span id='ListFrm'></span>
</div>
</div>
</div>
</div>
</div>
</div>
</section>
</main>

</body>
</html>