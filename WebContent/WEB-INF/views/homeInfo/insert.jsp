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

<script language=javascript>
$(document).ready(function(){
	
	selectCode('CT');
	selectCode('RC');
});

$("#updateBtn").on("click", function(){
	
	var frm = document.frmReg;
	
	alert(frm  + " chk");
	
	location.href="homeInfo/index";
	
	//frm.submit();
});

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
					document.getElementById('cdRC').name = 'contract';
				}else if(cd == "RC"){
					RoomListGo(msg)
					document.getElementById('cdRC').className = 'form-control';
					document.getElementById('cdRC').name = 'room';
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
     
     $(function(){
    	 $("#fileArea").hide();
    	 
    	 $("#homeImgArea").click(function(){
    		 $("#img").click();
    	 })
     });
     
     function LoadImg(value){
    	 if(value.files){
    		 var reader = new FileReader();
    		 
    		 reader.onload = function(e){
    			 $("#homeImg").attr("src", e.target.result);
    		 }
    		 reader.readAsDataURL(value.files[0])
    	 }
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

              

              <form id='insertHomeForm' name='insertHomeForm' method="post" role="form" class="php-email-form"  enctype="multipart/form-data" action="insert.do" >
              
               <div class="form-inline mb-2">
					<label for="homeImg">업로드<br>이미지</label>
					<input type = "file" id = "homeImg" name = "file"/>
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
              
               <div class="form-group mt-3">
                집이름  <input type="text" class="form-control" name="hnm" id="hnm" placeholder="집이름"  >
                </div>
                 <div class="form-group mt-3">
                집주소 <input type="text" class="form-control" name="address" id="address" placeholder="집주소"  >
                </div>
                 <div class="form-group mt-3">
                오는길  <input type="text" class="form-control" name="direction" id="direction" placeholder="오는길"  >
                </div>
                <div class="form-group">
               	계약 <br>
               	<span id='ListContract'></span>
                </div>              
               
                <div class="form-group mt-3">
                 평수  <input type="text" class="form-control" name="size" id="size" placeholder="평수"  >
                </div>
                <div class="form-group mt-3">
                  방	<br>
                  <span id='ListRoom'></span>
                </div>
                <div class="form-group mt-3">
                보증금  <input type="text" class="form-control" name="deposit" id="deposit" placeholder="보증금"  >
                </div>
                <div class="form-group mt-3">
                월세  <input type="text" class="form-control" name="rentalFee" id="rentalFee" placeholder="월세"  >
                </div>
                <div class="form-group mt-3">
                층수  <input type="text" class="form-control" name="floor" id="floor" placeholder="층수"   >
                </div>
                <div class="form-group mt-3">
                계약기간  <input type="date" class="form-control" name="contractDateFr" id="contractDateFr"  >
                <input type="date" class="form-control" name="contractDateTo" id="contractDateTo"   >
                </div>
                
              <div class="form-group mt-3">
                월세이체일  <input type="text" class="form-control" name="payDate" id="payDate"   >
                
                </div>
                  <div class="form-group mt-3">
                반려동물  <br>
              
                </div>
                 <div class="form-inline mb-2">
					<label for="petImg">업로드<br>이미지</label>
					<input type = "file" id = "petImg" name = "file"/>
					<div class = "select_img"><img src = "${selectHome.petImg }" /></div>
				</div>
				
				<script>
				
				$("#petImg").change(function(){
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
				
                <div class="form-group mt-3">
              정보     <textarea class="form-control" name="info" rows="5" placeholder="정보" ></textarea>
                </div>
                
                <div class="form-group mt-3">
           공지사항       <textarea class="form-control" name="notice" rows="5" placeholder="공지사항"   ></textarea>
                </div>

           <div class="form-group mt-3">
      와이파이 이름  <input type="text" class="form-control" name="wifiNm" id="wifiNm" placeholder="와이파이 이름"   >
                 </div>
                    <div class="form-group mt-3">
                와이파이 비밀번호 <input type="text" class="form-control" name="wifiPw" id="wifiPw" placeholder="와이파이 비밀번호"   >
                </div>

                <br><br>
               
                	<div class="text-center">
               
					<button class = "btn btn-primary btn-lg" type = "submit" id = "insertBtn">저장 </button>
						
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