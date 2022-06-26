<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>방명록</title>
</head>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <script src="${contextPath}/resources/js/common.js"></script>
  <script>
  $(document).ready(function(){
	  
	  proc('indexProc.do');
	  
	});
  
  function proc(url){
		$.ajaxSettings.traditional = true;
			$.ajax({
				type : "post"
				,dataType : "html"
				,data :{
				 key :$("#key option:selected").val(),
				 word:$("#word").val(),
				 sdt :$("#sdt").val(),
				 edt :$("#edt").val()
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
          <li><a href="index.html">마이페이지</a></li>
          <li>방명록</li>
        </ol>
        <h2>방명록</h2>

      </div>
    </section><!-- End Breadcrumbs -->
      <div class="container">

        <div class="row  justify-content-center">
          <div class="col-lg-6">

            <div class="form">
            
            <form id='frmReg' name="frmReg" method="post" action="javascript:proc('indexProc.do');">
            <select id='key' name='key' class="form-control selectInput">
            	<option value="all">전체</option>
            	<option value="cont">내용</option>
            	<option value="nm">이름</option>
            </select>
            	
            <input type="text" id='word' name='word' />
            <a onclick="proc('indexProc.do');">검색</a> 
            
            
            <div class="none wi100" style="display: none;">
            <span class="selectInput">방문일</span>
            <input  type="date" id='sdt' name='sdt' class="form-control selectInput2"/>
            ~
            <input type="date" id='edt' name='edt' class="form-control selectInput2"/>
            </div>
            <p class='noneText' onclick="showView()">>날짜로 검색</p>
            
            </form>
            
            
            <div  class="section-bg" style="width: 100%;">😁친구에게 링크를 보내줘!  
            <img  onclick="copy('${contextPath}/visit/write.do?id=${sessionScope.ssID}', '방명록 주소 복사 완료');" alt="" src="${contextPath}/resources/img/icon/setting/copy.png"> 
            </div>
     
		<%-- 리스트 출력 --%> 		
 		<span id='ListFrm'></span>
 		
            </div>

          </div>

        </div>
 
      </div>
      
</body>
</html>