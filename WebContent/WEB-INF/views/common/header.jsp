<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

      <h1 class="logo me-auto"><a href="index.html">homeA</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo me-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar order-last order-lg-0">
        <ul>
          <li><a class="nav-link scrollto active" href="#hero">Home</a></li>
            <li class="dropdown"><a href="#"><span>공과금</span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="${contextPath}/manageM/index.do">전체</a></li>
              <li><a href="${contextPath}/manageM/electric.do">전기</a></li>
              <li><a href="${contextPath}/manageM/water.do">수도</a></li>
              <li><a href="${contextPath}/manageM/gas.do">가스</a></li>
              <!-- -<li><a href="#">관리비</a></li> -->
            </ul>
          </li>
          <li><a class="nav-link scrollto" href="${contextPath}/food">식재료</a></li>
          <li><a class="nav-link scrollto " href="${contextPath}/clean">청소 체크</a></li>
          <li><a class="nav-link scrollto" href="${contextPath}/fix">집 수리</a></li>
          <li><a class="nav-link scrollto" href="${contextPath}/houseInfo">집 정보</a></li>
          
          
          <!-- 드롭다운 메뉴 -->
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
          <li><a class="nav-link scrollto" href="#footer">Contact</a></li>
        </ul>
        
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

      <div class="social-links">
        <a href="#" class="twitter"><i class="bi bi-twitter"></i></a>
        <a href="#" class="facebook"><i class="bi bi-facebook"></i></a>
        <a href="#" class="linkedin"><i class="bi bi-linkedin"></i></a>
        <a href="#" class="instagram"><i class="bi bi-instagram"></i></a>
      </div>

    </div>
  </header><!-- End Header -->
    <!-- Vendor JS Files -->

  <script src="${contextPath}/resources/vendor/aos/aos.js"></script>
  <script src="${contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${contextPath}/resources/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="${contextPath}/resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="${contextPath}/resources/vendor/php-email-form/validate.js"></script>
  <script src="${contextPath}/resources/vendor/purecounter/purecounter.js"></script>
  <script src="${contextPath}/resources/vendor/swiper/swiper-bundle.min.js"></script>

  <!-- Template Main JS File -->
  <script src="${contextPath}/resources/js/main.js"></script>
  
  </body>
  </html>