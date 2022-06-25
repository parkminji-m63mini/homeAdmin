<%@ page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<body>

 <br>
  <div class="container">

        <div class="row  justify-content-center">
          <div class="col-lg-6">
          http://bootstrapk.com/css/#buttons
<button type="submit" id="login-submit" class="btn btn-default btn-block"></button>
 <input type = "text" class = "form-control" id = "alarmName">
  <br>
 <select class="form-select" >
 	<option>가나다</option>
 	<option>123</option>
 	<option>abc</option>
 </select>
  <br>
 <div class = "form-check">
 	<input type = "checkbox" class = "form-check-input">
 	<label class ="form-check-label" for="same-address">어쩌구쩌쩌구</label>
 </div>
 <br><br>
 <h4>버튼</h4>
 <a class="btn btn-default" href="#" role="button">Link</a>
<button class="btn btn-default" type="submit">Button</button>
<input class="btn btn-default" type="button" value="Input">
<input class="btn btn-default" type="submit" value="Submit">
 
 <div class="btn-group" role="group" aria-label="...">
  <button type="button" class="btn btn-default">Left</button>
  <button type="button" class="btn btn-default">Middle</button>
  <button type="button" class="btn btn-default">Right</button>
</div>
<!-- Standard button -->
<button type="button" class="btn btn-default">Default</button>

<!-- Provides extra visual weight and identifies the primary action in a set of buttons -->
<button type="button" class="btn btn-primary">Primary</button>

<!-- Indicates a successful or positive action -->
<button type="button" class="btn btn-success">Success</button>

<!-- Contextual button for informational alert messages -->
<button type="button" class="btn btn-info">Info</button>

<!-- Indicates caution should be taken with this action -->
<button type="button" class="btn btn-warning">Warning</button>

<!-- Indicates a dangerous or potentially negative action -->
<button type="button" class="btn btn-danger">Danger</button>

<!-- Deemphasize a button by making it look like a link while maintaining button behavior -->
<button type="button" class="btn btn-link">Link</button>
 <br><br>
<h4>버튼 비활성화</h4>
<button type="button" class="btn btn-lg btn-primary" disabled="disabled">Primary button</button>
<button type="button" class="btn btn-default btn-lg" disabled="disabled">Button</button>
 <br><br>
<h4>아이콘</h4>
 <!--벨--> <i class="bi bi-bell-fill"></i>
<!--  벨 끔 --> <i class="bi bi-bell-slash-fill"></i>
<!--  계산기 --><i class="bi bi-calculator"></i>
<i class="bi bi-card-image"></i>
<!-- 말풍선 --><i class="bi bi-chat-dots"></i>
<!-- 체크박스 --><i class="bi bi-check-circle-fill"></i>
<!-- 신용카드 --><i class="bi bi-credit-card"></i>
<a href="#">Inbox <span class="badge">42</span></a>
 <br><br>
<h4>배지</h4>
<button class="btn btn-primary" type="button">
  Messages <span class="badge">4</span>
</button>

<ul class="nav nav-pills" role="tablist">
  <li role="presentation" class="active"><a href="#">Home <span class="badge">42</span></a></li>
  <li role="presentation"><a href="#">Profile</a></li>
  <li role="presentation"><a href="#">Messages <span class="badge">3</span></a></li>
</ul>
 <br><br>
<h4>알림</h4>
<div class="alert alert-success" role="alert">
  <a href="#" class="alert-link">...</a>
</div>
<div class="alert alert-info" role="alert">
  <a href="#" class="alert-link">...</a>
</div>
<div class="alert alert-warning" role="alert">
  <a href="#" class="alert-link">...</a>
</div>
<div class="alert alert-danger" role="alert">
  <a href="#" class="alert-link">...</a>
</div>
 <br><br>
<h5>테이블</h5>
<div class="panel panel-default">
  <!-- Default panel contents -->
  <div class="panel-heading">Panel heading</div>

  <!-- Table -->
  <table class="table">
    ...
  </table>
</div>
 </div>
 </div>
 </div>
 
</body>

</html>