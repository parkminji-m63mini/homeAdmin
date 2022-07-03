<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="kn">

<head>
<meta charset="UTF-8">
<title>냉장고</title> 
</head>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	 <link rel="stylesheet" href="${contextPath}/resources/css/common.css">
	<script type="text/javascript">
$(document).ready(function(){
	console.log("jsp 확인");
	selectCode();
});

function selectCode(){
	
	var mode = '${vo.mode}';
	
	
	$.ajaxSettings.traditional = true;
		$.ajax({
			type : "post"
			,dataType : "html"
			,data :{
			  mode : mode
			}
			,url :"frTypeProc.do"
			,success : listGo  
			,error : function(result) { alert(result + "실패"); }
		});
	}
	function listGo(msg) { 
		$("#ListFrm").html(msg);	
	}

</script>
	
<body>
<main>

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="">

          <div class="">
			<!-- ======= Breadcrumbs ======= -->
			    <section id="breadcrumbs" class="breadcrumbs">
			      <div class="container">
			
			        <ol>
			          <li><a href="index.html">식재료</a></li>
			          <li>전체</li>
			        </ol>
			
			      </div>
			    </section><!-- End Breadcrumbs -->
          	
          	<span id='ListFrm'></span>
          <div>
          </div>
          </div>
          </div>
          </div>
          </section>
          

  </main><!-- End #main -->
</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>