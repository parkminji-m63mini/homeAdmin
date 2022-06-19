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
		
		selectCode('HP');
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
		
		
		function submit(){
			var frm = document.frmReg;
			
				frm.type.value= $("select[name=cdHP]").val();	
				
				//console.log($("select[name=cdHP]").val() + "  ///");
			
			frm.submit();
		}
  </script>
</head>
<body>

<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">고객센터</a></li>
          <li>1:1 문의</li>
        </ol>
        <h2>1:1 문의작성</h2>

      </div>
    </section><!-- End Breadcrumbs -->

  <div class="container">

        <div class="row  justify-content-center">
          <div class="col-lg-6">

            <div class="form">
		  <form id='frmReg' name='frmReg' method="post" role="form" class="php-email-form" action="submitHelp.do">
               <div class="form-group mt-3">
                <p class="section-title">문의 종류  ${arrList[0].cnm }</p>
                </div>
                     <div class="form-group mt-3">
                   <p class="section-title">제목  ${arrList[0].title }</p>
                </div>
                
              <div class="form-group mt-3">
					<textarea rows="" cols="" name='cont' id='cont'>${arrList[0].cont }</textarea>                     
                </div>
                
                </form>
                </div>
                
                <c:if test="${arrList[0].answer ne null}">
                <div> <%-- 답변 있으면 --%>
                <hr>
              <div class="form-group mt-3">
					<textarea rows="" cols="" name='cont' id='cont'>${arrList[0].answer}</textarea>                     
                </div>
                
                <p>${arrList[0].counId} ${arrList[0].adt}</p>
                </div>
                
                </c:if>
                
                </div>
                </div>
                </div>
                
</body>
</html>