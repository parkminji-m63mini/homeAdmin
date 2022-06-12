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
          <li>1:1 문의</li>
        </ol>
        <h2>1:1 문의</h2>

      </div>
    </section><!-- End Breadcrumbs -->
      <div class="container">

        <div class="row  justify-content-center">
          <div class="col-lg-6">

            <div class="form">
            
            	<a href="write.do" style="float: right;">작성하기</a>
            	<%-- 리스트 출력 --%> 		
 		<span id='ListFrm'></span>
                <br><br>
            <form id='frmReg' name="frmReg" method="post" action="javascript:proc('indexProc.do');">
            <select id='key' name='key'>
            	<option value="all">전체</option>
            	<option value="cont">내용</option>
            	<option value="nm">이름</option>
            </select>
            	
            <input type="text" id='word' name='word' />
            <a onclick="proc('indexProc.do');">검색</a> 
            
            
            </form>
            
        
     	
 		
            </div>

          </div>

        </div>
 
      </div>
      
</body>
</html>