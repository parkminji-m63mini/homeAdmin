<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="kn">
<head>

<meta charset="UTF-8">
<title>내정보</title>
</head>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
table {
  border-spacing: 16px;
  border-collapse: separate;
}


</style>
	
<body>
<script type="text/javascript">
$(document).ready(function(){
	
	//input에  onlyNumber 추가하면 자동으로 숫자만 들어가게 함
	$('input[onlyNumber]').on('keyup', function () {
			console.log("들어옴");
		    $(this).val($(this).val().replace(/[^0-9]/g, ""));
		});
	//------------------------------
	
	
	selectCode('ST');
});

function selectCode(cd){
	var mcd = "${list.sta}";
	$.ajaxSettings.traditional = true;
		$.ajax({
			type : "post"
			,dataType : "html"
			,data :{
			  cd : cd,
			  mcd : mcd
			}
			,url :"${contextPath}/my/code.do"
			,success : listGo  
			
			,error : function(result) { alert(result + "실패"); }
		});
	}
	function listGo(msg) { 
		$("#ListFrm").html(msg);	
		document.getElementById('cdST').className = 'form-control';
	}
	
	
	function chk(){
		console.log($("#photo2").val());
		$("#photo2").click();
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
	
	
	function update(){
		var born = $("#born").val();
		var birth = $("#birth").val();
		
		
		if(born.length != 4){
			alert("생년을 4자리로 작성해주세요");
			return;
			}
		
		if(birth.length != 4){
			alert("생일을 4자리로 작성해주세요");
			return;
			}
		
		var frm = document.frmReg;

	frm.cd.value = $("select[name=cdST]").val();
		frm.submit();
		
	}
	
		
</script>
<body>


<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <ol>
          <li><a href="index.html">마이페이지</a></li>
          <li>내정보</li>
        </ol>
        <h2>내정보수정</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="">

          <div class="" style="padding-bottom: 11%;">
          
           <form id='frmReg' name='frmReg' method="post" role="form" class="form-horizontal" enctype="multipart/form-data" action="update.do" >
              
              	 <input type="file" name="photo2" id="photo2"  style="display: none;" onchange="readURL(this);">
              	 <input type="hidden" name="cd" id="cd"/>
              	 <input type="hidden" name="photo" id="photo" value="${list.photo}"/>
              <table style="width: 100%;">
              	<colgroup>
						<col style="width: 25%">
						<col style="width: 35%">
						<col style="width: 35%">
					</colgroup>
              <tr class=''>
              	<th colspan="3" style="text-align: center;">
              	
              	 <div class="imgW">
              	 <c:if test="${list.photo ne null}">
              	  <img  class="img"  id="preview"   alt="" src="${contextPath}/upload/${list.photo}">
              	 </c:if>
              	 <c:if test="${list.photo eq null}">
              	 	<c:if test="${list.profile ne null}">
              	 		<img class="img" id="preview"  alt="" src="${list.profile}">
              	 	</c:if>
              	 	<c:if test="${list.profile eq null}">
              	 <img class="img"  id="preview"  style="border: 4px solid #0000005c;" alt="" src="${contextPath}/resources/img/profile/defaultProfile.jpg">
              	 	</c:if>
              	 </c:if>
              	 </div>
              	
              	
              	<div style="float: right;">
              	 <img onclick="chk()" class="settingBtn mobile-nav-toggle" alt="" src="${contextPath}/resources/img/icon/setting/settingBtn.png">
              	 </div>
              	
              	 
              	</th>
              </tr>
              <tr class=''>
              	<th>닉네임</th>
              	<th colspan="2"> <input type="text" class="form-control" name="nNm" id="nNm"  value = "${list.nNm}" ></th>
              </tr>
              
              <tr class=''>
              	<th>생년월일</th>
              	<th> <input type="text" onlyNumber class="form-control" name="born" id="born"  value = "${list.born}" ></th>
              	<th> <input type="text" onlyNumber class="form-control" name="birth" id="birth"  value = "${list.birth}" ></th>
              </tr>
              
              <tr class=''>
              	<th>현재 상태</th>
              	<th colspan="2"><span id='ListFrm'></span></th>
              </tr>
              
              </table>
              
               <a href="#" onclick="update();">수정</a>
                
              </form>

            </div>

          </div>

        </div>
 
          </section>
          </main>
          
          
    <!-- ------------------------- footer ---------------------------- -->
    <jsp:include page="/WEB-INF/views/common/footer.jsp" />
    
          
</body>
</html>