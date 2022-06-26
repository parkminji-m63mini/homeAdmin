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
     	    <form id = "updateList" name = "updateList" method = "post"  action = "../update">  
            <div class="box">
            <a href="#" onclick = "return update();">저장</a>
            <input  type="text" name = "listName" id = "listName" value = "${checkListDetail[0].listName }">
           
              		 <div class="about-content detailContent${detail.idx}"   >
              		  
            		  <ul id ="detailList" >
            			  <c:forEach var="detail" items = "${checkListDetail}">
              				  <li style="list-style:none;" id="detail"><input  type="text" name = "content" id="content" value ="${detail.content }" >
              				 
              				      <span class = "del">삭제</span>
              				      </li>
              				   
                 		 </c:forEach>
                 		 
             		 </ul>
             		  
                     </div>
             
              <button class="cta-btn align-middle"  type="button" id = "addBtn"  onclick = "addOne();">추가</button>
           
            </div>
             </form> 
             
          </div>
      </div>
    </div>
     		
     
           

          
    </section><!-- End Services Section -->
    
  
    
</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script language = javascript>
	
	
	function addOne(){
		$("#detailList").append("<li style='list-style:none;'> <input  type='text' name = 'content' id = 'content'  >" +
				  "<span class = 'del'>삭제</span>");
	};
	

	
		jQuery(".del").click(function(){
			alert("?")
			jQuery(this).closest("li").remove();
	   });
      function update(){
			//alert("?");
			var idx = ${idx};
			
		var list = new Array();
		var name = document.getElementById('listName').value;
		$("input[name = content]").each(function(index, item){
			list.push($(item).val());
			
		});
		alert(list);
		alert(name);
		alert(idx);
		
		$.ajax({
			type : "post",
			dataType : "json",
			async : false,
			traditional : true,
			url : "../update",
			data :{
				contentL : list,
				listName : name,
				idx : idx
			},
			success : function(result){
				alert("저장");
				location.href = 'index.do';
			},
			error : function(request,status,error){
				 //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				
			}
		})
		
	}


	

</script>
</html>