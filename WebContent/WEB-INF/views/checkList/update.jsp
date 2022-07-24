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
		<link rel="stylesheet" href="${contextPath}/resources/css/common.css">

<body>
    <section id="services" class="services section-bg">
      <div class="container" >
        <div class="row">
     	
     	  <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">체크리스트</a></li>
          <li>전체</li>
        </ol>

      </div>
    </section><!-- End Breadcrumbs -->
     	
     	
     		<div class="col-md-6 col-lg-4 "  >
     	    <form id = "updateList" name = "updateList" method = "post"  action = "../update">  
            <div class="box">
            <input class='form-control'  type="text" name = "listName" id = "listName" value = "${checkListDetail[0].listName }">
           <hr>
              		 <div class="about-content detailContent${detail.idx}"   >
              		  
              		   <table id ="detailList">
                     <colgroup>
                     	<col style="width: 95%">
                     	<col style="width: 5%">
                     </colgroup>
            			  <c:forEach var="detail" items = "${checkListDetail}">
              				
              				    <tr id="detail">
              				    <th>
              				    <input  class='form-control' type="text" name = "content" id="content" value ="${detail.content }" >
									</th>
									<th>              				 
              				      <span class = "wi_3 btn_brown delbtn del">x</span>
              				     </th>
              				  </tr>
                 		 </c:forEach>
                     </table> 
                 		 
             		  
                     </div>
               <br>
             <button class="upbtn btn btn-primary-1" style="float: none;" type="button" id = "addBtn"  onclick = "addOne();">+</button>
           
            </div>
             </form> 
              <a href="#" style="float: right; width : 100%;" class="upbtn btn btn-primary-1" onclick = "return update();">저장</a>
          </div>
      </div>
    </div>
     		
     
           

          
    </section><!-- End Services Section -->
    
  
    
</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script language = javascript>
	
	
	function addOne(){
	 var length = $("#detailList").children().length
		$("#detailList").append("<tr id='id_"+length+"'> <th> <input  class='form-control' type='text' name = 'content' id='content' value ='${detail.content }' ></th>" +
"<th><span class = 'wi_3 btn_brown delbtn del' onclick = 'deleteOne("+length+");'>x</span></th></tr>");
	};
	

	function deleteOne(id){
			$("#id_"+id).remove()
		};
	
		jQuery(".del").click(function(){
		//	alert("?")
			jQuery(this).closest("tr").remove();
	   });
      function update(){
			//alert("?");
			var idx = ${idx};
			
		var list = new Array();
		var name = document.getElementById('listName').value;
		$("input[name = content]").each(function(index, item){
			list.push($(item).val());
			
		});
		//alert(list);
		//alert(name);
		//alert(idx);
		
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
				location.href = '../index.do';
			},
			error : function(request,status,error){
				 //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				
			}
		})
		
	}


	

</script>
</html>