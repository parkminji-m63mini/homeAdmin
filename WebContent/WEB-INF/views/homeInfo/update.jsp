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
     
    
	

</script>

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

              

              <form id='updateHomeForm' name='updateHomeForm' method="post" role="form" class="form-horizontal" enctype="multipart/form-data" action="../update.do" >
              
              
              <div class="form-group mb-2">
					<label class="control-label for="homeImg">업로드<br>이미지</label>
					<input type = "file" id = "homeImg" name = "homeImgFile"/>
					<div class = "select_img"><img src = "${selectHome.homeImg }" /></div>
				</div>
				
				<script>
				
				$("#homeImg").change(function(){
					alert(this.files)
					if(this.files && this.files[0]){
						var reader = new FileReader;
						reader.onload = function(data){
							
							$(".select_img img").attr("src", data.target.result).width(500);
							
						}
						reader.readAsDataURL(this.files[0]);
						
					}
				})
				</script>
              
              <%= request.getRealPath("/") %> 
              
               <div class="form-group mt-3">
                집이름 <input type="text" class="form-control" name="hnm" id="hnm"  value = "${selectHome.hnm}" >
                </div>
                <div class="form-group">
               	계약 <br>
               	<span id='ListContract'></span>
                </div>              
                    <div class="form-group">
    <label for="address" class="col-sm-2 control-label">집주소</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" id="inputEmail3" placeholder="address">
    </div>
  </div>  
                 <div class="form-group mt-3">
                오는길  <input type="text" class="form-control" name="direction" id="direction"   value = "${selectHome.direction}" >
                </div>
                <div class="form-group mt-3">
                 평수  <input type="text" class="form-control" name="size" id="size"   value = "${selectHome.size}" >
                </div>
                <div class="form-group mt-3">
                  방	<br>
                  <span id='ListRoom'></span>
                </div>
                    <div class="form-group mt-3">
                층수  <input type="text" class="form-control" name="floor" id="floor"  value = "${selectHome.floor}" >
                </div>
                <div class="form-group mt-3">
                보증금  <input type="text" class="form-control" name="deposit" id="deposit"value = "${selectHome.deposit}" >
                </div>
                <div class="form-group mt-3">
                월세  <input type="text" class="form-control" name="rentalFee" id="rentalFee"   value = "${selectHome.rentalFee}" >
                </div>
                
              <div class="form-group mt-3">
                월세이체일  <input type="text" class="form-control" name="payDate" id="payDate"  value = "${selectHome.payDate}" >
                
                </div>
            
                <div class="form-group mt-3">
                계약기간  <input type="date" class="form-control" name="contractDateFr" id="contractDateFr"  value = "${selectHome.contractDateFr}" >
                <input type="date" class="form-control" name="contractDateTo" id="contractDateTo"   value = "${selectHome.contractDateTo}" >
                </div>
                
                  <div class="form-group mt-3">
                반려동물  <br>
                </div>
                     <div class="form-inline mb-2">
					<label for="petImg">업로드<br>이미지</label>
					<input type = "file" id = "petImg" name = "petImgFile"/>
					<div class = "select_petImg"><img src = "${selectHome.petImg }" /></div>
				</div>
				
				<script>
				
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
				</script>
               
                <div class="form-group mt-3">
              정보     <textarea class="form-control" name="info" rows="5" placeholder="정보" >${selectHome.info}</textarea>
                </div>
                
                <div class="form-group mt-3">
           공지사항       <textarea class="form-control" name="notice" rows="5" placeholder="공지사항"   >${selectHome.notice}</textarea>
                </div>

           <div class="form-group mt-3">
                와이파이 이름  <input type="text" class="form-control" name="wifiNm" id="wifiNm"  value = "${selectHome.wifiNm}" >
                </div>
                
                    <div class="form-group mt-3">
                와이파이 비밀번호  <input type="text" class="form-control" name="wifiPw" id="wifiPw"  value = "${selectHome.wifiPw}" >
                </div>
                <br><br>
               
                	<div class="text-center">
            
               		
					<button class="btn btn-primary btn-lg" type = "submit" id = "updateBtn">저장 </button>
						<button class = "btn btn-primary btn-lg" id="deleteBtn"  >삭제</button>

                    </div>
                
              </form>

            </div>

          </div>

        </div>
 
      </div>
  <!--   </div>  -->

    
 <!-- </footer>  -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>