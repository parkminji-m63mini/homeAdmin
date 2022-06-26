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

<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">공지사항</a></li>
          <li>공지사항</li>
        </ol>
        <h2>공지사항</h2>

      </div>
    </section><!-- End Breadcrumbs -->
      <div class="container">

        <div class="row  justify-content-center">
          <div class="col-lg-6">

            <div class="form">

<span id='ListFrm'></span>
</div>
</div>
</div>
</div>

</body>
</html>