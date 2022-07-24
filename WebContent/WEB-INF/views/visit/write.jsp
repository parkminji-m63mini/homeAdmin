<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%> 
<!DOCTYPE html>
<html lang="kn">

<head>
<meta charset="UTF-8">
<title>방명록 작성</title>

  
</head>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
	
<!-- ------------------------- header ---------------------------- -->
  <script src="${contextPath}/resources/js/common.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		
		// 오늘 날짜 세팅
		$("#vdt").val(new Date().toISOString().substring(0, 10));
	});
	
	function chk(){
		console.log($("#photo2").val());
	}
	
	function insert(){
		
		if($("#vNm").val() == ""){
			alert("닉네임을 작성해주세요");
			return;
		}
		
		if($("#cont").val() == ""){
			alert("방명록을 작성해주세요");
			return;
		}
		$('#cont').val().replace(/\r\n|\n/ , "<br>"); 
		var frm = document.frmReg;

		
		var pNo = $("input:radio[name='pNo2']:checked").val();
		
		frm.photo.value = $("#photo2").val();
		frm.pNo.value = pNo;
		frm.submit();
		
	}
	</script>
	
<body>


	
	
	<main>
	    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="">

          <div class="">
          
	
	 <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

	
			<h2>${vo.uNm }네 방명록</h2>
			
			
      </div>
    </section>
    
	  <!-- ======= Portfolio Details Section ======= -->
    <div class="portfolio-info">
              <div class="swiper-wrapper align-items-center">


					<%--이번달 요금 --%>
                <div class="swiper-slide">
        <div class="">

          <div class="">
          <form name="frmReg" method="post" action="insert.do" enctype="multipart/form-data">
          <input type="hidden" name="photo" id="photo"/>
          <input type="hidden" name="pNo" id="pNo"/>
          <input type="hidden" name="uId" id="uId" value="${vo.uId}"/>
          <p class='ContD' style="font-weight: bold;">방문일</p>
          <div class='subContCenter'>
          <input type="date" name="vdt" id="vdt" class='form-control'>
          </div>
          <p class='ContD' style="font-weight: bold;">닉네임</p>
          <div class='subContCenter'>
          <input type="text" name="vNm" id="vNm" placeholder="닉네임 또는 성함을 입력해주세요" class='form-control' maxlength="100">
          </div>
          
          <p class='ContD' style="font-weight: bold;">프로필 사진</p>
          <div  style="width: 100%;">
          <table style="width: 100%;">
          <colgroup>
          	<col style="width: 20%;">
          	<col style="width: 20%;">
          	<col style="width: 20%;">
          	<col style="width: 20%;">
          	<col style="width: 20%;">
          </colgroup>
          <tbody>
          <tr>
          	<th><label for="pNo1"><img src="${contextPath}/resources/img/profile/1.jpg"  alt="" class="profile"/></label></th>
          	<th><label for="pNo2"><img src="${contextPath}/resources/img/profile/2.jpg" class="profile" alt="" /></label></th>
          	<th><label for="pNo3"><img src="${contextPath}/resources/img/profile/3.jpg" class="profile" alt="" /></label></th>
          	<th><label for="pNo4"><img src="${contextPath}/resources/img/profile/4.jpg" class="profile" alt="" /></label></th>
          	<th><label for="pNo5"><img src="${contextPath}/resources/img/profile/5.jpg" class="profile" alt="" /></label></th>
          </tr>
          <tr>
          	<th class="thc"><input type="radio" name="pNo2" id="pNo1" value="1" checked="checked"></th>
          	<th class="thc"><input type="radio" name="pNo2" id="pNo2" value="2"></th>
          	<th class="thc"><input type="radio" name="pNo2" id="pNo3" value="3"></th>
          	<th class="thc"><input type="radio" name="pNo2" id="pNo4" value="4"></th>
          	<th class="thc"><input type="radio" name="pNo2" id="pNo5" value="5"></th>
          </tr>
          </tbody>
          </table>
          </div>
          <br>
          <p  class='ContD' style="font-weight: bold;" >사진 업로드</p>
          <input type="file" name="photo2" id="photo2" onchange="chk();">
          <br><br>
          <p  class='ContD' style="font-weight: bold;" >방명록</p>
		 <textarea  class='form-control' name="cont" id="cont" style="width: 100%; height: 200px;" rows="" cols=""></textarea>          
          
          
          </form>
          <br>
           <input style="float: none; width: 100%;" id='upbtn' onclick="insert();" class="btn-primary-1 upbtn btn " type="button"  value="보내기"/>
          <div>
          </div>
          </div>
          </div>
          </div>
          </div>
          </div>
          </div>
          </div>
          </div>
          </section>
          
	</main>

</body>
</html>