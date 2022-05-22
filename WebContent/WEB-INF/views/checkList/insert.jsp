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
     	    <form id = "insertList" name = "updateList" method = "post"  action = "../insert">  
            <div class="box">
            <a href="#" onclick = "return update();">저장</a>
            <input  type="text" name = "listName" id = "listName">
            <br>
              		 <div class="about-content detailContent" id ="detailList"  >
              		 
            		  <ul  >
              				  <li style="list-style:none;" id="detail"> <input  type="text" name = "content" >
              				      <button  type = "button" id = "deleteBtn" onclick = "deleteOne();">삭제</button></li>
                 		 
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
	function deleteOne(){
		var obj = document.getElementById("detail"+dIdx);
		alert(dIdx);
		obj.remove();
	};
	
	function addOne(){
	
		$("#detailList").append("<li style='list-style:none;'> <input  type='text' name = 'content'  >" +
	     "<button  type = 'text' id = 'deleteBtn' >삭제</button></li>");
	};
	
	function update(){
		
		var list = new Array();
		var name = document.getElementById('listName').value;
		$("input[name = content]").each(function(index, item){
			list.push($(item).val());
			
		});
		alert(name);
		
		console.log(list);
		$.ajax({
			type : "post",
			dataType : "json",
			async : false,
			traditional : true,
			url : "insert",
			data :{
				contentL : list,
				listName : name
			},
			success : function(result){
				alert("저장");
				location.href = 'index.do';
			},
			error : function(result){
				alert(result);
			}
		})
		
		
		//document.getElementById('updateList').submit();
	}

	

</script>
</html>