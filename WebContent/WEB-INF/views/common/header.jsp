<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>    
<%String myId = ""+session.getAttribute("ssID");%>
<%String myNnm = ""+session.getAttribute("ssnNM");%>
<%String myNm = ""+session.getAttribute("ssNM");%>
<%String myGb= ""+session.getAttribute("ssGB");%>
<%String myType= ""+session.getAttribute("ssTYPE");%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>homeA</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

<c:set var="contextPath" value="${pageContext.servletContext.contextPath}" scope="application"/>

<link rel="stylesheet" href="${contextPath}/resources/css/common.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script type="text/javascript" src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.js"></script>
  <link rel="stylesheet" href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.css">
  <!-- Favicons -->
   <link href="${contextPath}/resources/img/favicon.png" rel="icon"> 
  <link href="${contextPath}/resources/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Montserrat:300,400,500,600,700" rel="stylesheet">
 <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="${contextPath}/resources/vendor/aos/aos.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="${contextPath}/resources/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="${contextPath}/resources/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Rapid - v4.6.0
  * Template URL: https://bootstrapmade.com/rapid-multipurpose-bootstrap-business-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top d-flex align-items-center header-transparent">
    <div class="container d-flex align-items-center">

      <h1 class="logo me-auto"><a href="${contextPath}">   <img style="max-height: 70px;" src="${contextPath}/resources/img/sample/logo.png"  alt="" /> </a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
 <c:if test="${sessionScope.ssID != null }">

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">?????????</a></li>
            <li class="dropdown"><a href="#"><span>?????????</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#" onclick="loginchk('/manageM/index.do');">??????</a></li>
              <li><a href="#" onclick="loginchk('/manageM/gas.do');" >??????</a></li>
              <li><a href="#" onclick="loginchk('/manageM/electric.do');">??????</a></li>
              <li><a href="#" onclick="loginchk('/manageM/water.do');">??????</a></li>
              <li><a href="#" onclick="loginchk('/manageM/it.do');">?????????</a></li>
              <li><a href="#" onclick="loginchk('/manageM/manage.do');">?????????</a></li>
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="#" onclick="loginchk('/food/index.do?mode=0');">?????????</a></li>
         <%-- <li><a class="nav-link scrollto " href="#" onclick="loginchk('/alarm/index.do');">??????</a></li>  --%>
          <li><a class="nav-link scrollto" href="#" onclick="loginchk('/checkList/index.do');">???????????????</a></li>
          
          
          <!-- ???????????? ?????? -->
          <!-- 
          <li class="dropdown"><a href="#"><span>Drop Down</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#">Drop Down 1</a></li>
              <li class="dropdown"><a href="#"><span>Deep Drop Down</span> <i class="bi bi-chevron-right"></i></a>
                <ul>
                  <li><a href="#">Deep Drop Down 1</a></li>
                  <li><a href="#">Deep Drop Down 2</a></li>
                  <li><a href="#">Deep Drop Down 3</a></li>
                  <li><a href="#">Deep Drop Down 4</a></li>
                  <li><a href="#">Deep Drop Down 5</a></li>
                </ul>
              </li>
              <li><a href="#">Drop Down 2</a></li>
              <li><a href="#">Drop Down 3</a></li>
              <li><a href="#">Drop Down 4</a></li>
            </ul>
          </li>
           -->
         
          <li class="dropdown"><a href="#"><span>???????????????</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#" onclick="loginchk('/my/mypage.do');">??? ??????</a>
        	  <li><a  href="#" onclick="loginchk('/homeInfo/index.do');">??? ??????</a></li>
        	  <li><a  href="#" onclick="loginchk('/visit/index.do');">?????????</a></li>
            </ul>
          </li>
         
          
            <li><a class="nav-link scrollto" href="#" onclick="loginchk('/notice/index.do');">????????????</a></li>
           
           <%--
			 <li class="dropdown"><a href="#"><span>????????????</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="#" onclick="loginchk('/help/qna.do');">?????? ?????? ??????</a>
        	  <li><a  href="#" onclick="loginchk('/help/index.do');">1:1 ??????</a></li>
            </ul>
          </li>
           --%>
         <c:if test="${sessionScope.ssID == null}">
          <li><a class="nav-link scrollto" href="${contextPath}/snsLogin">?????????</a></li>
          </c:if>
            <c:if test="${sessionScope.ssID != null}">
          <li><a class="nav-link scrollto" href="#" onclick="logout('<%=myType%>');">????????????</a></li>
          </c:if>
          <c:if test="${sessionScope.ssGB eq '9'.charAt(0)}">
          <li><a class="nav-link scrollto" href="#" onclick="loginchk('/admin/dash/index.do');">????????? ?????????</a></li>
          </c:if>
          
        </ul>
        
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->
  </c:if>    
      

<%-- 
      <div class="social-links">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
      </div>
--%>
    </div>
  </header><!-- End Header -->
    <!-- Vendor JS Files -->

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
  
  <script type="text/javascript">
  function logout(type){
	  if(confirm("???????????? ???????????????????")){
		  
		  if(type == "kakao"){
				kakaoLogout();
			}else if(type == "naver"){
				naverLogout() ;
			}else{
				//?????????
			}
		  
		  $.ajax({
			type : "post",
			dataType : "text", 
			 async : false,
			url : "${contextPath}/my/logoutGo.do",
			data : {
			},
			success : function(result){
				if(result =="false"){
				alert("???????????? ??????");
				}else{
					alert("???????????? ??????");
				}
				//alert("??????" + '${sessionScope.ssID}' );
				 
			},
			error : function(result){
				alert("??????")	;		
			}
		});
	
	  location.href='${contextPath}';
	  }
  }
  
  function loginchk(url){
	
	  if('${sessionScope.ssID}' == null || '${sessionScope.ssID}' == ""){
			alert('????????? ??? ?????? ???????????????.');
			 location.href='${contextPath}' + "/snsLogin";
			return false;
		}else{
			  location.href='${contextPath}'+ url;
		}
		
  }
  
  
//?????????????????????  
  function kakaoLogout() {
      if (Kakao.Auth.getAccessToken()) {
        Kakao.API.request({
          url: '/v1/user/unlink',
          success: function (response) {
          	console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
        Kakao.Auth.setAccessToken(undefined)
      }
    }  
    
    
    
    // ?????????????????????
    var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

    
    
  function naverLogout() {
		openPopUp();
		setTimeout(function() {
			closePopUp();
			}, 1000);
		
		
	}  

  
 
  
  
  </script>
  </body>
  </html>