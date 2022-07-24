<%@ page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>집정보</title>
</head>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<link rel="stylesheet" href="${contextPath}/resources/css/common.css">

<script language=javascript>
$(document).ready(function(){
	//alert("${selectHome.contractDateFr}");
	selectCode('CT');
	selectCode('RC');
});



function selectCode(cd){
	var searchVar;
	var value = document.getElementById('cd'+cd);
	//alert("${selectHome.contract}");
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
					document.getElementById('cdCT').name = 'contract';
					$('#cdCT').val("${selectHome.contract}").prop("selected", true);
					 
				}else if(cd == "RC"){
					RoomListGo(msg)
					document.getElementById('cdRC').className = 'form-control';
					document.getElementById('cdRC').name = 'room';
					$('#cdRC').val("${selectHome.room}").prop("selected", true);
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
     
     function readURL(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview').src = "";
		  }
		}
    function readURL2(input) {
		  if (input.files && input.files[0]) {
		    var reader = new FileReader();
		    reader.onload = function(e) {
		      document.getElementById('preview2').src = e.target.result;
		    };
		    reader.readAsDataURL(input.files[0]);
		  } else {
		    document.getElementById('preview2').src = "";
		  }
		}
	
	
    
</script>

<body>
<main id="main">
  <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">
  		<div class="">

          <div class="">
           <section id="breadcrumbs" class="breadcrumbs">
	      <div class="container">
	        <ol>
	          <li><a href="index.html">집정보</a></li>
	          <li>전체</li>
	        </ol>
	      </div>
	    </section><!-- End Breadcrumbs -->
    
     <div class="portfolio-info">
              <div class="swiper-wrapper align-items-center">
  <div class="swiper-slide">
              <form id='updateHomeForm' name='updateHomeForm' method="post" role="form" class="php-email-form" enctype="multipart/form-data" action="../update.do" >
              
             <div class="form-group mt-3">
              <p class='ContD' style="font-weight: bold;"> 우리집 사진  </p>
             <div style="width: 100%;" class = "home_img">
             <c:if test="${selectHome.homeImg ne null}">
             <img  id="preview" style="width: 100%;" src = "${selectHome.homeImg }" />
             </c:if>
             <c:if test="${selectHome.homeImg eq null}">
             <img  id="preview"  style="border: 4px solid #0000005c; width: 100%;" alt="" src="${contextPath}/resources/img/profile/nomal_Home.jpg">
             </c:if>
             </div>
              <input type = "file" id = "homeImg" name = "file"  style="display: none;" onchange="readURL(this);"/>
              
              <div style="float: right;">
              	 <img onclick="chk()" class="settingBtn2 mobile-nav-toggle" alt="" src="${contextPath}/resources/img/icon/setting/settingBtn.png">
              	 </div>
              </div>
				
				
              
             <%--  <%= request.getRealPath("/") %>  --%> 
              
                 <hr>
               <div class="form-group mt-3">
                 <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">집이름</p>
                   <input type="text" class="form-control" name="hnm" id="hnm"  value = "${selectHome.hnm}"  >
                </div>
                
                 <div class="form-group mt-3">
                  <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">집주소</p>
                   <input type="text" class="form-control" name="address" id="inputEmail3" placeholder="" value = "${selectHome.address}"   >
                </div>
                
                 <div class="form-group mt-3">
                  <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">오는 길</p>
                    <input type="text" class="form-control" name="direction" id="direction" placeholder="" value = "${selectHome.direction}" >
                </div>
                
                 <div class="form-group mt-3">
                 <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">계약</p> 
               	<span id='ListContract'></span>
                </div>   
                
                
                <div class="form-group mt-3">
                 <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">평수</p>
                   <input type="number" class="form-control" name="size" id="size" placeholder="" value = "${selectHome.size}" >
                </div>
                
                 <hr>
                <div class="form-group mt-3">
                 <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">방</p>
                  <span id='ListRoom'></span>
                </div>
                
                
                 <div class="form-group mt-3">
                <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">보증금</p>
                  <input type="number" class="form-control" name="deposit" id="deposit" placeholder=""  value = "${selectHome.deposit}">
                </div>
                
                 <div class="form-group mt-3">
                 <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">월세날</p>
                   <input type="number" class="form-control" name="rentalFee" id="rentalFee" placeholder=""   value = "${selectHome.rentalFee}" >
                </div>
                
                 <div class="form-group mt-3">
                 <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">층수</p>
                  <input type="number" class="form-control" name="floor" id="floor" placeholder=""  value = "${selectHome.floor}"  >
                </div>
                
                
                 <div class="form-group mt-3">
                 <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">계약기간</p>
                  <input type="date" style=" width: 45%; display: inline;" class="form-control" name="contractDateFr" id="contractDateFr" value = "${selectHome.contractDateFr}"   >
                  ~
                <input type="date" style=" width: 45%; display: inline;" class="form-control" name="contractDateTo" id="contractDateTo"  value = "${selectHome.contractDateTo}"  >
                </div>
                
                 <div class="form-group mt-3">
               <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">월세이체일</p>               
                 <input type="number" class="form-control" name="payDate" id="payDate"  value = "${selectHome.payDate}"   >
                </div>
                <hr>
                
               <div class="form-group mt-3">
                <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">정보</p>
                  <textarea class="form-control" name="info" rows="5" placeholder="정보" >${selectHome.info}</textarea>
                </div>
                
                  <div class="form-group mt-3">
                <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">공지사항</p>
                  <textarea class="form-control" name="notice" rows="5" placeholder="공지사항"   >${selectHome.notice}</textarea>
                </div>
                
                 <div class="form-group mt-3">
           <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">와이파이 이름</p>
            <input type="text" class="form-control" name="wifiNm" id="wifiNm" placeholder="와이파이 이름"  value = "${selectHome.wifiNm}"   >
                 </div>
                 
              <div class="form-group mt-3">
                    <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;">와이파이 비밀번호</p>
                   <input type="text" class="form-control" name="wifiPw" id="wifiPw" placeholder="와이파이 비밀번호" value = "${selectHome.wifiPw}"   >
                </div>    
                
				
                 <div class="form-group mt-3">
                   <p class='ContD' style="font-weight: bold;margin: 0 0 10px 0;"> 반려동물 </p>
                   <div style="width: 100%;" class = "pet_img">
                   <c:if test="${selectHome.petImg ne null}">
		             <img  id="preview2" style="width: 100%;" src = "${selectHome.petImg }" />
		             </c:if>
		             <c:if test="${selectHome.petImg eq null}">
		             <img  id="preview2"  style="border: 4px solid #0000005c; width: 100%;" alt="" src="${contextPath}/resources/img/profile/nomal_Home.jpg">
		             </c:if>
		             </div>
		             
		              <input type = "file" id = "petImg" name = "file"  style="display: none;" onchange="readURL2(this);"/>
				 <div style="float: right;">
              	 <img onclick="chk2()" class="settingBtn2 mobile-nav-toggle" alt="" src="${contextPath}/resources/img/icon/setting/settingBtn.png">
              	 </div>
              </div>
				
				 	<br>
				 	<br>
            
               		<div style="width: 100%;text-align: center;">
					<button style="float: none;" class="upbtn btn btn-primary-1" type = "submit" id = "updateBtn">저장 </button>
						<button  class="upbtn btn btn-danger" id="deleteBtn"  >삭제</button>
					</div>
              </form>

            </div>

          </div>

        </div>
 
      </div>
      </div>
      </div>
      </section>
      </main>
      
  <!--   </div>  -->

    
 <!-- </footer>  -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

</body>

<script>
				
				$("#homeImg").change(function(){
					alert(this.files)
					if(this.files && this.files[0]){
						var reader = new FileReader;
						reader.onload = function(data){
							
							$(".select_img img").attr("src", data.target.result);
							
						}
						reader.readAsDataURL(this.files[0]);
						
					}
				})
				
				$("#petImg").change(function(){
					alert(this.files)
					if(this.files && this.files[0]){
						var reader = new FileReader;
						reader.onload = function(data){
							
							$(".select_petImg img").attr("src", data.target.result).width(500);
							
						}
						reader.readAsDataURL(this.files[0]);
						
					}
				})
				
				 function chk(){
 		console.log($("#homeImg").val());
 		$("#homeImg").click();
 	}
				
				function chk2(){
					console.log($("#petImg").val());
					$("#petImg").click();
				}
				</script>

<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>