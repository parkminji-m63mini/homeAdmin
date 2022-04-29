<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" uri="myFunc"%> 


<!DOCTYPE html>
<html lang="kn">

<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<script type="text/javascript">

function signUp(){
	
	var frm = document.frmReg;
	frm.submit();
}

$(document).ready(function(){
	ltype();
	htype();
	
});
</script>
<body>
<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
<%-- sns 연동예정 기본 폼만 만들어두고 나중에 연동하기 --%>
        <ol>
          <li><a href="index.html">로그인</a></li>
          <li>회원가입</li>
        </ol>
      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="">

          <div class="">
     
					
            <div class="portfolio-info">
              <div class="swiper-wrapper align-items-center">

				
                <div class="swiper-slide">
                	 <h3>회원가입</h3>
				<form name="frmReg" method="post" action="${contextPath}/my/signUp.do">
					<input type="hidden" name='gb' value="1"/>
				
                	<table class='tb'>
                	<tbody>
					<tr>
						<th  class='boder-black'>성명</th>
						<th  class='boder-black'><input type='text' name='nm' id='nm'/></th>
					</tr>
					<tr>
						<th  class='boder-black'>아이디</th>
						<th  class='boder-black'><input type='text' name='id' id='id'/> <button>중복검사</button></th>
					</tr>
					<tr>
						<th  class='boder-black'>비밀번호</th>
						<th  class='boder-black'><input type='text' name='pw1' id='pw1'/></th>
					</tr>
					<tr>
						<th  class='boder-black'>비밀번호 확인</th>
						<th  class='boder-black'><input type='text' name='pw' id='pw'/></th>
					</tr>
					<tr>
						<th  class='boder-black'>닉네임</th>
						<th  class='boder-black'><input type='text' name='nNm' id='nNm'/></th>
					</tr>
					<tr>
						<th  class='boder-black'>성별</th>
						<th  class='boder-black'><select name='sex'><option value="1">남자</option><option value="2">여자</option></select></th>
					</tr>
					<tr>
						<th  class='boder-black'>거주타입</th>
						<th  class='boder-black'><span id='ltype'></span></th>
					</tr>
					<tr>
						<th  class='boder-black'>주거타입</th>
						<th  class='boder-black'><span id='htype'></span></th>
					</tr>
					<tr>
						<th  class='boder-black'>생년월일</th>
						<th  class='boder-black'><input type="date" name='birth' id='birth'/></th>
					</tr>
                	</tbody>
                	</table>
                		<input id='upbtn' class='btn_brown' type="button" onclick="signUp();" value="가입하기"/> 
                </form>
                </div>
              </div>
              
  </main><!-- End #main -->

</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</html>