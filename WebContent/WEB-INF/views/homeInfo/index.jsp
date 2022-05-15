<%@ page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집정보</title>
</head>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<body>

  <section id="breadcrumbs" class="breadcrumbs">
  <!--  <footer id="footer" class="section-bg">-->
   <!-- <div class="footer-top">  -->
     <header class="section-header">
         
          <h4>집정보</h4>
              <p>집정보 입력해주세요</p>
          </header>
      <div class="container">

        <div class="row  justify-content-center">
          <div class="col-lg-6">

            <div class="form">

              

              <form method="post" role="form" class="php-email-form" name="submit">
              
               <div class="form-group mt-3">
                집이름  <input type="text" class="form-control" name="homeName" id="homeName" placeholder="보증금"  value = "${selectHome.deposit}" required>
                </div>
                <div class="form-group">
               	계약 <br>
               	<span id='ListContract'></span>
                </div>              
               
                <div class="form-group mt-3">
                 평수  <input type="text" class="form-control" name="size" id="size" placeholder="평수"  value = "${selectHome.size}" required >
                </div>
                <div class="form-group mt-3">
                  방	<br>
                  <span id='ListRoom'></span>
                </div>
                <div class="form-group mt-3">
                보증금  <input type="text" class="form-control" name="deposit" id="deposit" placeholder="보증금"  value = "${selectHome.deposit}" >
                </div>
                <div class="form-group mt-3">
                월세  <input type="text" class="form-control" name="rentalFee" id="rentalFee" placeholder="월세"  value = "${selectHome.rentalFee}" >
                </div>
                <div class="form-group mt-3">
                층수  <input type="text" class="form-control" name="floor" id="floor" placeholder="층수"  value = "${selectHome.floor}" >
                </div>
                <div class="form-group mt-3">
                계약기간  <input type="date" class="form-control" name="contractDateFr" id="contractDateFr"  value = "${selectHome.contractDateFr}" >
                <input type="date" class="form-control" name="contractDateTo" id="contractDateTo"  value = "${selectHome.contractDateTo}" >
                </div>
                
                  <div class="form-group mt-3">
                반려동물  <br>
                <select id="petYN" name="petYN" class = "form-control">
                <option value = "Y" <c:if test="${selectHome.petYN eq 'Y'}"> selected = "selected" </c:if>>있음</option>
                <option value = "N" <c:if test="${selectHome.petYN eq 'N'}"> selected = "selected" </c:if>>없음</option>
                </select>
                </div>
               
                <div class="form-group mt-3">
              정보     <textarea class="form-control" name="info" rows="5" placeholder="정보" >${selectHome.info}</textarea>
                </div>
                
                <div class="form-group mt-3">
           공지사항       <textarea class="form-control" name="notice" rows="5" placeholder="공지사항"   >${selectHome.notice}</textarea>
                </div>


              <div class="form-group mt-3">
                월세이체일  <input type="text" class="form-control" name="payDate" id="payDate"  value = "${selectHome.payDate}" >
                
                </div>
                <br><br>
               
                <c:choose>
                	<c:when test="${ empty selectHome}">
                	<div class="text-center"><button type="button" id="insertBtn" title="Send Message" onclick = "getPost('01')">저장</button></div>
                	</c:when>
                	<c:otherwise>
                	<div class="text-center"><button type="button" id="updateBtn" title="Send Message" onclick = "getPost('02')">수정</button></div>
                	</c:otherwise>
                
                </c:choose>
              </form>

            </div>

          </div>

        </div>
 
      </div>
  <!--   </div>  -->

    
 <!-- </footer>  -->
</section>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<script language=javascript>
$(document).ready(function(){
	console.log("selectCode");
	selectCode('CT');
	selectCode('RC');
});

function getPost(mode){
	
	var theForm = document.submit;
	if(mode == "01"){
		theForm.action = "${contextPath}/homeInfo/insertHomeInfo.do";
	}else if (mode == "02"){
		
		theForm.action = "${contextPath}/homeInfo/updateHomeInfo.do";
	
	}
	theForm.submit();
	
};


function selectCode(cd){
	var searchVar;
	$.ajaxSettings.traditional = true;
		$.ajax({
			type : "post"
			,dataType : "html"
			,data :{
			  cd : cd
			}
			,url :"${contextPath}/my/code.do"
			,success : function(msg){
				if(cd == "CT"){
					ContractListGo(msg);
					document.getElementById('cdCT').className = 'form-control';
				}else if(cd == "RC"){
					RoomListGo(msg)
					document.getElementById('cdRC').className = 'form-control';
				}
				
			}			
			,error : function(result) { 
				alert(result + "실패"); }
		});
	}
	function ContractListGo(msg) { 
		
		$("#ListContract").html(msg);
	}
	
     function RoomListGo(msg) { 
    	
		$("#ListRoom").html(msg);
	}
	
	

</script>

</body>
</html>