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
  <script src="${contextPath}/resources/js/common.js"></script>
	<script type="text/javascript">
$(document).ready(function(){
	
	selectCode('FR');
});

function selectCode(cd){
	$.ajaxSettings.traditional = true;
		$.ajax({
			type : "post"
			,dataType : "html"
			,data :{
			  cd : cd
			}
			,url :"${contextPath}/my/code.do"
			,success : listGo  
			,error : function(result) { alert(result + "실패"); }
		});
	}
	function listGo(msg) { 
		$("#ListFrm").html(msg);	
	}
	
function insertType(){
	console.log($("select[name=cdFR]").val());
	var frm = document.frmReg;
	frm.cd.value = $("select[name=cdFR]").val();
	frm.submit();
}	
</script>
<body>
<main>
<!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">식재료</a></li>
          <li>냉장고 타입 설정</li>
        </ol>
        <h2>생성 및 수정(최초)</h2>
			
			
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details"  class="portfolio-details">
      <div class="container">

        <div class="">

          <div class="">
          <form name="frmReg" method="post" action="foodTypeInsert.do">
          <input type="hidden" id='cd' name='cd'/> 
          <h4>냉장고 타입 선택</h4>
          <span id='ListFrm'></span>
          <a href="#" onclick="insertType();">생성</a>
          </form>
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