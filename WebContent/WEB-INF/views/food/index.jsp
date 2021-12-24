<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" uri="myFunc"%> 


<!DOCTYPE html>
<html lang="kn">

<head>
<meta charset="UTF-8">
<title>냉장고</title> 
</head>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<script type="text/javascript">
$(document).ready(function(){
	
	selectCode();
});

function selectCode(){
	$.ajaxSettings.traditional = true;
		$.ajax({
			type : "post"
			,dataType : "html"
			,data :{
			  
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
<!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">식재료</a></li>
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
          <style>
          .bodyFR01{
          border: 1px solid black;
          width: 70%;
		  text-align: center;
		  margin: 0 auto;
          }
          </style>
          	
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