<%@ page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체크리스트</title>
</head>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<body>
  <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">체크리스트</a></li>
          <li>전체</li>
        </ol>
        <h2>전체</h2>

      </div>
    </section><!-- End Breadcrumbs -->
    
     <section id="services" class="services section-bg">
      <div class="container" >

    <a href="insertView" style="float: right;" >새로만들기</a>

        <div class="row">

     <c:choose>
     	<c:when test = "${empty checkList}">
     		<p>등록된 체크리스트가 없습니다.</p>
     	</c:when>
     	<c:otherwise>
     		<c:forEach var="item" items = "${checkList }">
     		<div class="col-md-6 col-lg-4 "  >
            <div class="box">
              <a href="updateView/${item.idx}" style="float: right;" >수정</a>
              <h4 class="title"><a href="">${item.listName}</a></h4>
              
              <c:forEach var="detail" items = "${checkListDetail }">
              	<c:if test = "${item.idx == detail.idx }">
              		 <div class="about-content detailContent${item.idx}"  >
            		  <ul>
            			  <div id="box">
              				  <li style="list-style:none;"> <input type="checkbox" name = "color" value ="blue" unchecked></i>${detail.content }</li>
                 		 </div>
             		 </ul>
                     </div>
              	</c:if>
              </c:forEach>
               
            </div>
          </div>
     		</c:forEach>
     	</c:otherwise>
          
 </c:choose> 
          
    </section><!-- End Services Section -->
    
    
    
</body>
<script language = javascript>
	

	

</script>
</html>