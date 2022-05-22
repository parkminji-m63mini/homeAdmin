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
        <div class="row">
     	
     	
     	
     		<div class="col-md-6 col-lg-4 "  >
     	    <form id = "updateList" name = "updateList" method = "post"  action = "../update/${checkListDetail[0].idx }">  
            <div class="box">
            <a href="#" onclick = "return update();">저장</a>
              <h4 class="title"><a href=""></a>${checkListDetail[0].listName }</h4>
              
              
              	
              		 <div class="about-content detailContent${detail.idx}"   >
              		 
            		  <ul id ="detailList" >
            			  
            			  <c:forEach var="detail" items = "${checkListDetail}">
              				  <li style="list-style:none;" id="detail${detail.dIdx}"> <input  type="text" name = "color" value ="${detail.content }" >
              				      <button  type = "button" id = "deleteBtn" onclick = "deleteOne(${detail.dIdx});">삭제</button></li>
                 		 </c:forEach>
                 		 
             		 </ul>
             		  
                     </div>
                     
              
             
              <button  type="button" id = "addBtn"  onclick = "addOne();">추가</button>
            </div>
             </form> 
             
          </div>
      </div>
    </div>
     		
     
          

          
    </section><!-- End Services Section -->
    
    
    
</body>
<script language = javascript>
	function deleteOne(dIdx){
		var obj = document.getElementById("detail"+dIdx);
		alert(dIdx);
		obj.remove();
	};
	
	function addOne(){
	
		$("#detailList").append("<li style='list-style:none;'> <input  type='text' name = 'color'  >" +
	     "<button  type = 'text' id = 'deleteBtn' >삭제</button></li>");
	};
	
	function update(){
		document.getElementById('updateList').submit();
	}

	

</script>
</html>