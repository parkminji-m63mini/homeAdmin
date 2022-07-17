<%@ page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>

	.check {
		color : blue;
		font-weight : bold;
	}
</style>
<title>알람</title>
</head>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<body>
  <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">알람등록</a></li>
          <li>전체</li>
        </ol>
        <h2>전체</h2>

      </div>
    </section><!-- End Breadcrumbs -->
    
     <section id="services" class="services section-bg">
      <div class="container" >

 

        <div class="row justify-content-center">
     		<div class="col-md-6 col-lg-4 "  >
            <div class="box">
              <a href="#" style="float: right;" onclick = "return insert();" >저장</a>
              <br>
              <h4 class="title">이름</h4> 
              <div class = "input-group-mb-3">
                <input type = "text" class = "form-control" id = "alarmName">
              </div>
              
              <h4 class="title">주기</h4>
                 <div class="d-flex flex-row justify-content-between" id = "cycle" name = "cycle" >
           
              		<div class = "item">월</div>
              		<div class = "item">화</div>
              	    <div class = "item">수</div>
              		<div class = "item">목</div>
              		<div class = "item">금</div> 
              		<div class = "item">토</div>
              		<div class = "item">일</div>
                 </div>
             <h4 class="title">시간</h4>
             <input type = "time" id = "time">
          
             <h4 class="title">메모</h4>
             <input type = "text" id = "memo">
            </div>
          </div>
         </div>
     	</div>
           


    </section><!-- End Services Section -->
   
   <!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</body>


<script language = javascript>
	


$(".item").click(function(){
	if($(this).hasClass('check')){
		
		$(this).removeClass("check");
		$(this).css({
			"color" : "black",
			"font-weight" : "bold"
		});
	}else{
		//alert($(this).text())
		$(this).addClass("check");
		$(this).css({
			"color" : "blue",
			"font-weight" : "bold"
		});
	}
	
	
});

function insert(){
	
	var list = new Array();
	$("#cycle .check").each(function(){
		
		list.push($(this).text());
	})
	
	var alarmName = document.getElementById('alarmName').value;
	var time = document.getElementById('time').value;
	var memo = document.getElementById('memo').value;
	
	$.ajax({
		type : "post",
		dataType : "json",
		async : false,
		traditional : true,
		url : "insert.do",
		data :{
			alarmName : alarmName,
			alarmTime : time,
			memo : memo,
			alarmCycle : list.toString()
		},
		success : function(result){
			location.href = "index.do";
		},
		error : function(result){
			alert("실패")
			console.log(result)
		}
		
		
	});
	
}
	

</script>
</html>