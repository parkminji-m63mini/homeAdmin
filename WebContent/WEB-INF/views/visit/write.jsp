<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%> 
<!DOCTYPE html>
<html lang="kn">

<head>
<meta charset="UTF-8">
<title>방명록 작성</title>

<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<link rel="stylesheet" href="${contextPath}/resources/css/common.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.js"></script>
  <link rel="stylesheet" href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.css">
  <!-- Favicons -->
  <!-- <link href="${contextPath}/resources/img/favicon.png" rel="icon">  -->
  <link href="${contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${contextPath}/resources/vendor/aos/aos.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${contextPath}/resources/css/style.css" rel="stylesheet"> 
  
  
   <script src="${contextPath}/resources/vendor/aos/aos.js"></script>
  <script src="${contextPath}/resources/js/common.js"></script>
  <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${contextPath}/resources/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${contextPath}/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${contextPath}/resources/vendor/php-email-form/validate.js"></script>
  <script src="${contextPath}/resources/vendor/purecounter/purecounter.js"></script>
  <script src="${contextPath}/resources/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="${contextPath}/resources/js/main.js"></script>
  
</head>
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
		
		$('#cont').val().replace(/\r\n|\n/ , "<br>"); 
		var frm = document.frmReg;

		
		var pNo = $("input:radio[name='pNo2']:checked").val();
		
		frm.photo.value = $("#photo2").val();
		frm.pNo.value = pNo;
		frm.submit();
		
	}
	</script>
	
<body>

	<header id="header" class="fixed-top d-flex align-items-center header-transparent">
	    <div class="container d-flex align-items-center">
	
	      <h1 class="logo me-auto"><a href="${contextPath}">homeA</a></h1>
	      <!-- Uncomment below if you prefer to use an image logo -->
	      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
	</div>
	</header>
	
	
	<main>
	
	 <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

			<h2>${vo.uNm }네 방명록</h2>
			
			
      </div>
    </section>
    
	  <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details"  class="portfolio-details">
      <div class="container">
        <div class="">

          <div class="">
          <form name="frmReg" method="post" action="insert.do" enctype="multipart/form-data">
          <input type="hidden" name="photo" id="photo"/>
          <input type="hidden" name="pNo" id="pNo"/>
          <input type="hidden" name="uId" id="uId" value="${vo.uId}"/>
          <h4>방문일</h4>
          <input type="date" name="vdt" id="vdt">
          <br><br>
          <h4>닉네임</h4>
          <input type="text" name="vNm" id="vNm" placeholder="닉네임 또는 성함을 입력해주세요">
          <br><br>
          <h4>프로필 사진</h4>
          <table>
          <tbody>
          <tr>
          	<th><label for="pNo1"><img src="${contextPath}/resources/img/profile/1.jpg"  alt="" class="profile"/></label></th>
          	<th><label for="pNo2"><img src="${contextPath}/resources/img/profile/2.jpg" class="profile" alt="" /></label></th>
          	<th><label for="pNo3"><img src="${contextPath}/resources/img/profile/3.jpg" class="profile" alt="" /></label></th>
          	<th><label for="pNo4"><img src="${contextPath}/resources/img/profile/4.jpg" class="profile" alt="" /></label></th>
          	<th><label for="pNo5"><img src="${contextPath}/resources/img/profile/5.jpg" class="profile" alt="" /></label></th>
          </tr>
          <tr>
          	<th class="thc"><input type="radio" name="pNo2" id="pNo1" value="1"></th>
          	<th class="thc"><input type="radio" name="pNo2" id="pNo2" value="2"></th>
          	<th class="thc"><input type="radio" name="pNo2" id="pNo3" value="3"></th>
          	<th class="thc"><input type="radio" name="pNo2" id="pNo4" value="4"></th>
          	<th class="thc"><input type="radio" name="pNo2" id="pNo5" value="5"></th>
          </tr>
          </tbody>
          </table>
          
          <br><br>
          <h4>사진 업로드</h4>
          <input type="file" name="photo2" id="photo2" onchange="chk();">
          <br><br>
          <h4>방명록</h4>
		 <textarea name="cont" id="cont" style="width: 380px; height: 200px;" rows="" cols=""></textarea>          
          
          
          <a href="#" onclick="insert();">저장</a>
          </form>
          <div>
          </div>
          </div>
          </div>
          </div>
          </section>
          
	</main>

</body>
</html>