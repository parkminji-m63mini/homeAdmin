<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="kn">

<head>
<meta charset="UTF-8">
<title>냉장고</title> 
</head>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<link rel="stylesheet" href="${contextPath}/resources/css/common.css">	
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
   

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details"  class="portfolio-details">
      <div class="container">

        <div class="">

          <div class="">
          
           <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">식재료</a></li>
          <li>냉장고 타입 설정</li>
        </ol>
			
			
      </div>
    </section><!-- End Breadcrumbs -->
          <div class="portfolio-info">
          <form name="frmReg" method="post" action="foodTypeInsert.do">
          <input type="hidden" id='cd' name='cd'/> 
          <h3>냉장고 타입 선택</h3>
         <br>
         <select id="cdFR" name="cdFR" class='form-control'>
		<option value="FR01">일반 투도어</option>
		</select>
		         
		         <br><br>
         <%-- 현재 투도어 타입밖에 지원하지 않아서 나중에 코드 사용 시 사용 
          <span id='ListFrm'></span>
         --%>
         
          <input style="float: none; width: 100%;" class="upbtn btn btn-primary-1" type="button" onclick="insertType();" value="생성"/>
          </form>
          </div>
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