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
            <a href="#" onclick = "return insert();">저장</a>
            <input  type="text" name = "listName" id = "listName">
            <br>
              		 <div class="about-content detailContent"   >
              		 
            		  <ul id ="detailList">
              				  <li style="list-style:none;" id="id_0"> <input  type="text" name = "content" >
              				      <button  type = "button" id = "deleteBtn" onclick = "deleteOne(0);">삭제</button></li>
                 		 
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
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script language = javascript>
	function deleteOne(id){
	   alert(id)
		$("#id_"+id).remove()
		//var obj = document.getElementById("detail"+dIdx);
		//alert(dIdx);
		//obj.remove();
	};
	
	function addOne(){
		
	    var length = $("#detailList").children().length
		alert(length)
	    $("#detailList").append("<li style='list-style:none;' id='id_"+length+"'> <input  type='text' name = 'content'  >" +
	     "<button  type = 'text' id = 'deleteBtn' onclick = 'deleteOne("+length+");' >삭제</button></li>");
	};
	
	function insert(){
		
		var list = new Array();
		var name = document.getElementById('listName').value;
		$("input[name = content]").each(function(index, item){
			list.push($(item).val());
			
		});
		alert(name);
		
		alert(list);
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