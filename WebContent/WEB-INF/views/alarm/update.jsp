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
              <a href="#" style="float: right;" onclick = "return update();" >저장</a>
              <br>
              <h4 class="title"></h4> <input type = "text" id = "alarmName" value = "${alarm.alarmName }"> 
              <h4 class="title">주기</h4>
                 <div class="d-flex flex-row justify-content-between" id = "cycle" name = "cycle" >
           
              		 <c:set var="cycleArr" value="${fn:split(alarm.alarmCycle,',')}"></c:set>

						<c:forEach var="i" begin="1" end="7">
						
						<c:if test="${i == 1}"><c:set var="dayV" value="월"></c:set></c:if>
						<c:if test="${i == 2}"><c:set var="dayV" value="화"></c:set></c:if>
						<c:if test="${i == 3}"><c:set var="dayV" value="수"></c:set></c:if>
						<c:if test="${i == 4}"><c:set var="dayV" value="목"></c:set></c:if>
						<c:if test="${i == 5}"><c:set var="dayV" value="금"></c:set></c:if>
						<c:if test="${i == 6}"><c:set var="dayV" value="토"></c:set></c:if>
						<c:if test="${i == 7}"><c:set var="dayV" value="일"></c:set></c:if>
						
						<div class = "item <c:forEach var="day" items="${cycleArr}"><c:if test="${day eq dayV}"> check</c:if></c:forEach>">
						${dayV} 
						</div>
						
						</c:forEach>
                 </div>
             <h4 class="title"></h4>
             <input type = "time" id = "time" value = "${alarm.alarmTime }">
             
             <h4 class="title">메모</h4>
             <input type = "text" id = "memo" value = " ${alarm.memo }"> 
            </div>
          </div>
         </div>
     	</div>
          
    </section><!-- End Services Section -->
    
    
   
</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
<script language = javascript>
	


$(".item").click(function(){
	if($(this).hasClass('check')){
		
		$(this).removeClass("check");
		$(this).css({
			"color" : "black",
			
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

function update(){
	
	var list = new Array();
	$("#cycle .check").each(function(){
		//alert($(this).text());
		list.push($(this).text().trim());
		//console.log($(this).text().trim())
	})
	alert(list)
	var alarmName = document.getElementById('alarmName').value;
	var time = document.getElementById('time').value;
	var memo = document.getElementById('memo').value;
	var idx = ${idx};
	$.ajax({
		type : "post",
		dataType : "json",
		async : false,
		traditional : true,
		url : "../update.do",
		data :{
			alarmName : alarmName,
			alarmTime : time,
			memo : memo,
			alarmCycle : list.toString(),
			idx : idx
		},
		success : function(result){
			alert("저장");
			location.href = "../index.do";
		},
		error : function(result){
			alert(result);
		}
		
		
	});
	
}
	

</script>
</html>