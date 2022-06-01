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
      <div class="container">

        <ol>
          <li><a href="index.html">집정보</a></li>
          <li>전체</li>
        </ol>
        <h2>전체</h2>

      </div>
    </section><!-- End Breadcrumbs -->
      <div class="container">

        <div class="row  justify-content-center">
          <div class="col-lg-6">

            <div class="form">
        <c:choose>
     	<c:when test = "${empty selectHome}">
     		<p>등록된 정보가 없습니다.</p>
     		<a href = "insertView.do" >등록하기</a>
     	</c:when>
     	<c:otherwise>
     	
              

              <form method="post" role="form" class="php-email-form" name="submit">
              
               <div class="form-group mt-3">
                <h3 class="section-title">집이름</h3>  <p> ${selectHome.hnm} </p>
                </div>
                     <div class="form-group mt-3">
                   <h3 class="section-title">집주소  </h3>     <p>${selectHome.address}</p>
                </div>
                
              <div class="form-group mt-3">
                     <h3 class="section-title">오는길  </h3>     <p>${selectHome.direction}</p>
                </div>
                
                <div class="form-group">
               	<h3 class="section-title">계약</h3>  <br>
               	<p> ${selectHome.contractCnm} </p>
                </div>              
               
                <div class="form-group mt-3">
                 <h3 class="section-title">평수</h3>  <p>${selectHome.size}  </p>
                </div>
                <div class="form-group mt-3">
                  <h3 class="section-title">방</h3>	<br>
                 <p> ${selectHome.roomCnm} </p>
                </div>
                 <div class="form-group mt-3">
                <h3 class="section-title">층수</h3>  <p>${selectHome.floor} </p>
                </div>
                
                <div class="form-group mt-3">
               <h3 class="section-title"> 보증금</h3>  <p>${selectHome.deposit} </p>
                </div>
                <div class="form-group mt-3">
                <h3 class="section-title">월세</h3> <p>${selectHome.rentalFee}</p>
                </div>
                
              <div class="form-group mt-3">
               <h3 class="section-title"> 월세이체일 </h3><p>${selectHome.payDate}</p>
                
                </div>
               
                <div class="form-group mt-3">
                <h3 class="section-title">계약기간</h3>  <p>${selectHome.contractDateFr} ~ ${selectHome.contractDateTo} </p>
                </div>
                
                
                  <div class="form-group mt-3">
                <h3 class="section-title">반려동물 </h3> <br>
               
                <c:if test="${selectHome.petYN eq 'Y'}"><p>있음</p></c:if>
               <c:if test="${selectHome.petYN eq 'N'}"> <p>없음</p></c:if>
               
                </div>
               
                <div class="form-group mt-3">
             <h3 class="section-title"> 정보 </h3>    <p>${selectHome.info}</p>
                </div>
                
                <div class="form-group mt-3">
           <h3 class="section-title">공지사항  </h3>     <p>${selectHome.notice}</p>
                </div>
               <div class="form-group mt-3">
                   <h3 class="section-title">와이파이 이름  </h3>     <p>${selectHome.wifiNm}</p>
                </div>
              <div class="form-group mt-3">
                     <h3 class="section-title">와이파이 비밀번호  </h3>     <p>${selectHome.wifiPw}</p>
                </div>
                
            
                


                
                <br><br>
               
              
                	<div class="text-center"><button type="button" id="updateBtn" title="Send Message" onclick = "location.href = 'updateView/${selectHome.id}'" >수정</button></div>
                	
              </form>
        </c:otherwise>
 	</c:choose>
            </div>

          </div>

        </div>
 
      </div>
  <!--   </div>  -->

    
 <!-- </footer>  -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<script language=javascript>
$(document).ready(function(){
	
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
					//document.getElementById('cdCT').className = 'form-control';
				}else if(cd == "RC"){
					RoomListGo(msg)
					//document.getElementById('cdRC').className = 'form-control';
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