<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터</title>
</head>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <script src="${contextPath}/resources/js/common.js"></script>
  <script>
  $(document).ready(function(){
	  
	  
	});
  
 
  
  function showView(){
 
		if(	$(".none").css("display") == "inline" || $(".none").css("display") == "inline-block"){
		$(".none").css("display","none");
		$(".noneText").text(">날짜로 검색");
		}else{
		$(".none").css("display","inline-block");
		$(".noneText").text("닫기");
		}
  }
		
	 </script>
<body>

<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">고객센터</a></li>
          <li>자주 묻는 질문</li>
        </ol>
        <h2>자주 묻는 질문</h2>

      </div>
    </section><!-- End Breadcrumbs -->
      <div class="container">

        <div class="row  justify-content-center">
          <div class="col-lg-6">

            <div class="form">
            
                <br><br>
            <form id='frmReg' name="frmReg" method="post" action="javascript:proc('indexProc.do');">
            	
            
            // 1:1 문의 사항 어느정도 쌓였을 때 그것을 기반으로 제작
            
            </form>
            
        
     	
 		
            </div>

          </div>

        </div>
 
      </div>
      
</body>
</html>