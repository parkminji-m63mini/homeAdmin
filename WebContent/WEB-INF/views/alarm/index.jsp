<%@ page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<title>체크리스트</title>
<style type="text/css">

.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
  vertical-align:middle;
}

/* Hide default HTML checkbox */
.switch input {display:none;}

/* The slider */
.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}



	.check {
		color : blue;
		font-weight : bold;
	}


</style>
</head>

	<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<body>
  <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">알람</a></li>
          <li>전체</li>
        </ol>
        <h2>전체</h2>

      </div>
    </section><!-- End Breadcrumbs -->
    
    <!-- ======= Services Section ======= -->
    <section id="services" class="services section-bg">
    
     <div class="container" >

        <div class="row justify-content-end">
          <div class="col-md-6 col-lg-5 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100">
              <a href = "insertView.do">추가</a>
          </div>
         </div>
    </div>
    <c:choose>
    	<c:when test = "${empty alarmList }">
    		<p> 등록된 알람이 없습니다.</p>
    	</c:when>
    	<c:otherwise>
    		<c:forEach var = "item" items = "${alarmList }">
    			 <div class="container" data-aos="fade-up">


     			   <div class="row justify-content-center">

      			    <div class="col-md-6 col-lg-5 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100">
       
         
           				 <div class="box">
           				 <div>
           				 	 <a href="updateView/${item.idx}"  style="float: right;">수정</a> <span></span>
           				 	 <a href="delete/${item.idx}"  style="float: right;">삭제</a>
           				 </div>
           				 <br>
                       
            				  <label class="switch">
  									<input type="checkbox"  id = "check${item.idx}" <c:if test='${item.useYN eq "Y"}'>checked="checked"</c:if>/>
  			   				 	<span class="slider round"></span>
			  				  </label>
			  				
			  <p id = "use_Y"></p><p id="use_N" style="display:none;"></p>  
			  		   
			  			
              			<h4 class="title"><a href="">${item.alarmName }</a></h4>
              			  <h4 class="title">주기</h4>
                          <div class="d-flex flex-row justify-content-between" id = "cycle${item.idx }" name = "cycle" >
                    
                       <c:set var="cycleArr" value="${fn:split(item.alarmCycle,',')}"></c:set>

						<c:forEach var="i" begin="1" end="7">
						
						<c:if test="${i == 1}"><c:set var="dayV" value="월"></c:set></c:if>
						<c:if test="${i == 2}"><c:set var="dayV" value="화"></c:set></c:if>
						<c:if test="${i == 3}"><c:set var="dayV" value="수"></c:set></c:if>
						<c:if test="${i == 4}"><c:set var="dayV" value="목"></c:set></c:if>
						<c:if test="${i == 5}"><c:set var="dayV" value="금"></c:set></c:if>
						<c:if test="${i == 6}"><c:set var="dayV" value="토"></c:set></c:if>
						<c:if test="${i == 7}"><c:set var="dayV" value="일"></c:set></c:if>
						
						<div class = "item 
						<c:forEach var="day" items="${cycleArr}">
						<c:if test="${day eq dayV}"> check</c:if>
						</c:forEach>
						" 
						>
						${dayV} 
						</div>
						
						</c:forEach>
                         </div>
              			
              			<h3>${item.alarmTime }</h3>
              			<h5>${item.memo}</h5>
            </div>
            
          </div>
      </div>

      </div>
    		
    		</c:forEach>
    	</c:otherwise>
    </c:choose>
     
      
        
    </section><!-- End Services Section -->
    
    
    
</body>
<script language = javascript>
var check = $("input[type='checkbox']");
var YN = "true";
var idx ;
check.click(function(e){
	
	
	 idx =e.target.id.substr(5,1); 
	 alert(idx);
	$("p").toggle();
	if (e.target.checked){
		YN = "Y"
	}else{
		YN = "N"
	}

	$.ajax({
		
		type: "post",
		dataType : "text",
		url : "updateYN.do",
		data : {
			idx : idx,
			YN : YN
		},
		success : function(result){
			alert("성공")
		},
		error : function(result){
			alert(result);
		}
		
	});
});





</script>
</html>