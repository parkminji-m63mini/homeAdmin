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
     	    <form id = "insertList" name = "updateList" method = "post"  action = "../insert">  
            <div class="box">
            <input class='form-control' type="text" name = "listName" id = "listName">
            <hr>
              		 <div class="about-content detailContent"   >
              		 
                     <table id ="detailList">
                     <colgroup>
                     	<col style="width: 95%">
                     	<col style="width: 5%">
                     </colgroup>
                     <tr id="id_0">
                     	<th>
                     		<input class='form-control' type="text" name = "content" >
                     	</th>
                     	<th>
                     		 <button class='wi_3 btn_brown delbtn'  type = "button" id = "deleteBtn" onclick = "deleteOne(0);">x</button>
                     	</th>
                     </tr>
                     </table>
            		
                     </div>
                     
                     
                     
                     <br>
              <button class="upbtn btn btn-primary-1" style="float: none;" type="button" id = "addBtn"  onclick = "addOne();">+</button>
            </div>
             </form> 
               <a href="#" style="float: right; width : 100%;" class="upbtn btn btn-primary-1" onclick = "return insert();">저장</a>
          </div>
      </div>
    </div>
          
    </section><!-- End Services Section -->
    
    
</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script language = javascript>
	function deleteOne(id){
	   //alert(id)
		$("#id_"+id).remove()
		//var obj = document.getElementById("detail"+dIdx);
		//alert(dIdx);
		//obj.remove();
	};
	
	function addOne(){
		
	    var length = $("#detailList").children().length
		//alert(length)
	    $("#detailList").append(" <tr id='id_"+length+"'><th>	<input class='form-control' type='text' name = 'content' ></th>" +
	     "<th><button class='wi_3 btn_brown delbtn' type = 'button' id = 'deleteBtn' onclick = 'deleteOne("+length+");'>x</button>	</th> </tr>");
	};
	
	
	
  	
	
	function insert(){
		
		var list = new Array();
		var name = document.getElementById('listName').value;
		$("input[name = content]").each(function(index, item){
			list.push($(item).val());
			
		});
		//alert(name);
		
		//alert(list);
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
				alert("실패");
				
			}
		})
		
		
		//document.getElementById('updateList').submit();
	}

	

</script>
</html>