<%@ page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

	.homeImg { width : 500px; height : auto;}
	.petImg { width : 500px; height : auto;}
	.basic{display : none}
	.contract{display : none}
	.basic-group{
		border: 1px solid gray;
	}
</style>
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
              
               <div class="form-inline mb-2">
				
					<div class = "select_homeImg"><img src = "${pageContext.request.contextPath}${selectHome.homeImg }" class = "homeImg" /></div>
				</div>
         <div class = "basic-group">
              <h1><p onclick='basicShow()'>기본정보</p></h1>
               <div class="form-group mt-3 basic">
                <h3 class="section-title ">집이름</h3>  <p> ${selectHome.hnm} </p>
                </div>
                     <div class="form-group mt-3 basic" >
                   <h3 class="section-title basic">집주소  </h3>     <p>${selectHome.address}</p>
                </div>
                
              <div class="form-group mt-3 basic">
                     <h3 class="section-title">오는길  </h3>     <p>${selectHome.direction}</p>
                     
                     
                </div>
                
                
                <div class="form-group mt-3 basic">
                <h3 class="section-title ">반려동물 </h3> <br>
               
                 <div class="form-inline mb-2">
				
					<div class = "select_img"><img class = "petImg" src = "${pageContext.request.contextPath}${selectHome.petImg }" /></div>
				</div>
               
                </div>
               
                <div class="form-group mt-3 basic">
             <h3 class="section-title"> 정보 </h3>    <p>${selectHome.info}</p>
                </div>
                
                <div class="form-group mt-3 basic">
           <h3 class="section-title">공지사항  </h3>     <p>${selectHome.notice}</p>
                </div>
               <div class="form-group mt-3 basic">
                   <h3 class="section-title">와이파이 이름  </h3>     <p>${selectHome.wifiNm}</p>
                </div>
              <div class="form-group mt-3 basic">
                     <h3 class="section-title">와이파이 비밀번호  </h3>     <p>${selectHome.wifiPw}</p>
                </div>
           </div>
                <br><br>
                <h1><p onclick='contractShow()'>계약정보</p></h1>
                
                <div class="form-group contract">
               	<h3 class="section-title">계약</h3>  <br>
               	<p> ${selectHome.contractCnm} </p>
                </div>              
               
                <div class="form-group mt-3 contract">
                 <h3 class="section-title">평수</h3>  <p>${selectHome.size}  </p>
                </div>
                <div class="form-group mt-3 contract">
                  <h3 class="section-title">방</h3>	<br>
                 <p> ${selectHome.roomCnm} </p>
                </div>
                 <div class="form-group mt-3 contract">
                <h3 class="section-title">층수</h3>  <p>${selectHome.floor} </p>
                </div>
                
                <div class="form-group mt-3 contract">
               <h3 class="section-title"> 보증금</h3>  <p>${selectHome.deposit} </p>
                </div>
                <div class="form-group mt-3 contract">
                <h3 class="section-title">월세</h3> <p>${selectHome.rentalFee}</p>
                </div>
                
              <div class="form-group mt-3 contract">
               <h3 class="section-title"> 월세이체일 </h3><p>${selectHome.payDate}</p>
                
                </div>
               
                <div class="form-group mt-3 contract">
                <h3 class="section-title">계약기간</h3> 
                 <p><fmt:formatDate pattern="yyyy-MM-dd" value = "${selectHome.contractDateFr}" />~ <fmt:formatDate pattern="yyyy-MM-dd" value = "${selectHome.contractDateTo}" /> </p>
                </div>
                
                
            
                
            
                


                
                <br><br>
               
              
                	<div class="text-center"><button class = "btn btn-primary btn-lg" type="button" id="updateBtn" title="Send Message" onclick = "location.href = 'updateView/${selectHome.id}'" >수정</button></div>
                	
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
	
     function basicShow(){
    	 
    	 if($(".basic").css("display") == "none"){
    		
    		 $(".basic").show("slow");
    	 }else{
    		 $(".basic").hide("slow"); 
    	 }
    		
    	 
     }
     
 function contractShow(){
    	 
    	 if($(".contract").css("display") == "none"){
    		
    		 $(".contract").show("slow");
    	 }else{
    		 $(".contract").hide("slow"); 
    	 }
    		
    	 
     }
	

</script>

</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>