<%@ page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.ellTxt {
	   display: -webkit-box;
      display: -ms-flexbox;
      margin-top:1px;
      max-height:80px;
      overflow:hidden;
      vertical-align:top;
      text-overflow: ellipsis;
      word-break:break-all;
      -webkit-box-orient:vertical;
      -webkit-line-clamp:1
</style>

<title>체크리스트</title>
</head>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
		<link rel="stylesheet" href="${contextPath}/resources/css/common.css">

<body>
  
 <main id="main">

    

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

		<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">체크리스트</a></li>
          <li>전체</li>
        </ol>

      </div>
    </section><!-- End Breadcrumbs -->

    
     <section id="services" class="services section-bg service2">
      <div class="container" >


   

        <div class="row">

     <c:choose>
     	<c:when test = "${empty checkList}">
     		<p>등록된 체크리스트가 없습니다.</p>
     	</c:when>
     	<c:otherwise>
     		<c:forEach var="item" items = "${checkList }">
     		<div class="col-md-6 col-lg-4 "  >
            <div class="box">
            	
              <h4 class="title"><a class=" title-c" href="updateView/${item.idx}">${item.listName}</a></h4>
              		 <div class="about-content detailContent" >
              		 	<table style="width: 100%;">
              		 		<colgroup>
              		 			<col style="width: 100%;">
              		 		</colgroup>
              <c:forEach var="detail" items = "${checkListDetail }">
              	<c:if test = "${item.idx == detail.mIdx }">
              		 
              		 		<c:if test="${my:NVL(detail.content,'0') ne '0'}">
              		 		
              		 		<tr>
              		 			<th><input  id = "${detail.dIdx}" type="checkbox" name = "color" value ="blue" <c:if test = '${detail.checkYN eq "Y" }'>checked = "checked"</c:if>/>
              		 			 <span>${detail.content }</span></th>
              		 		</tr>
              		 		</c:if>
            		
            		
            		
              	</c:if>
              </c:forEach>
              		 	</table>
                     </div>
              		 	<br>
              		 	<a  href="delete/${item.idx}"  >삭제</a>
              
            </div>
          </div>
     		</c:forEach>
     	</c:otherwise>
          
 </c:choose> 
 
  <p><a href="insertView" style="float: right; width : 100%;" class="upbtn btn btn-primary-1" >새로만들기</a></p>
          </div>
          </div>
          </section>
          </div>
    </section><!-- End Services Section -->
    
</main>    
    
</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script language = javascript>
	
var check = $("input[type='checkbox']");
var dIdx 
var YN
check.click(function(e){
	//alert(e.target.checked)
	dIdx = e.target.id
	
	if (e.target.checked){
		YN = "Y"
	}else{
		YN = "N"
	}
	$.ajax({
	
		type: "post",
		dataType : "text",
		url : "updateYN.do",
		data :{
			dIdx : dIdx,
			YN : YN
			
		},
		success : function(result){
			
		},
		error:function(result){
			
		}
		
		
	});	
});
</script>
</html>