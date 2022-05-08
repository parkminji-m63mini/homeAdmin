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

<body>


  <footer id="footer" class="section-bg">
    <div class="footer-top">
      <div class="container">

        <div class="row">

          <div class="col-lg-6">

            <div class="row">

              <div class="col-sm-6">


              </div>

              <div class="col-sm-6">
              </div>

            </div>

          </div>

          <div class="col-lg-6">

            <div class="form">

              <h4>집정보</h4>
              <p>집정보 입력해주세요</p>

              <form method="post" role="form" class="php-email-form" name="submit">
                <div class="form-group">
                <select name=contract>
                <option value="1">월세</option>
                <option value="2">전세</option>
                <option value="3">자가</option>
                <option value="4">반전세</option>
                <option value="5">기타</option>
                </select>
                </div>
                
               
                <div class="form-group mt-3">
                  <input type="text" class="form-control" name="size" id="size" placeholder="평수"  value = "${selectHome.size}" required >
                </div>
                <div class="form-group mt-3">
                  <input type="text" class="form-control" name="room" id="room" placeholder="방갯수"   value = "${selectHome.room}" required>
                </div>
                <div class="form-group mt-3">
                  <input type="text" class="form-control" name="deposit" id="deposit" placeholder="보증금"  value = "${selectHome.deposit}" required>
                </div>
                <div class="form-group mt-3">
                  <textarea class="form-control" name="message" rows="5" placeholder="Message" required></textarea>
                </div>

                <div class="my-3">
                  <div class="loading">Loading</div>
                  <div class="error-message"></div>
                  <div class="sent-message">Your message has been sent. Thank you!</div>
                </div>
                
                <c:choose>
                	<c:when test="${ empty selectHome}">
                	<div class="text-center"><button type="button" id="insertBtn" title="Send Message" onclick = "getPost('01')">저장</button></div>
                	</c:when>
                	<c:otherwise>
                	<div class="text-center"><button type="button" id="updateBtn" title="Send Message" onclick = "getPost('02')">수정</button></div>
                	</c:otherwise>
                
                </c:choose>
              </form>

            </div>

          </div>

        </div>

      </div>
    </div>

   
  </footer><!-- End  Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<script language=javascript>

function getPost(mode){
	
	var theForm = document.submit;
	if(mode == "01"){
		theForm.action = "${contextPath}/homeInfo/insertHomeInfo.do";
	}else if (mode == "02"){
		
		theForm.action = "${contextPath}/homeInfo/updateHomeInfo.do";
	}
	theForm.submit();
	
};

</script>

</body>
</html>