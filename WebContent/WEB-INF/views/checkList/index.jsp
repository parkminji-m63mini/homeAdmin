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
              <a href="delete/${item.idx}" style="float: right;" >삭제</a>
              <h4 class="title"><a href="">${item.listName}</a></h4>
              
              <c:forEach var="detail" items = "${checkListDetail }">
              	<c:if test = "${item.idx == detail.mIdx }">
              		 <div class="about-content detailContent" >
            		  <ul>
            			  <div id="box" >
              				  <li style="list-style:none;"> 
              				  <input  id = "${detail.dIdx}" type="checkbox" name = "color" value ="blue" <c:if test = '${detail.checkYN eq "Y" }'>checked = "checked"</c:if>/>
              				  ${detail.content }
              				  </li>
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