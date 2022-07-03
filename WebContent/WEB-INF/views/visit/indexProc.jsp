<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>   
    <% pageContext.setAttribute("newLine", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
<style type="text/css">
.ellTxt {
	 overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3; /* 라인수 */
    -webkit-box-orient: vertical;
    word-wrap:break-word; 
    line-height: 1.2em;
    height: 3.6em;
</style>
<script type="text/javascript">

// cont 데이터 전체로 변경
function showAll(index){
	console.log("xptmx");
	
	if($("#img"+ index).attr("src") == "${contextPath}/resources/img/sample/bottom_arrow.png"){
	$("#img"+ index).attr("src", "${contextPath}/resources/img/sample/top_arrow.png");
	$("#cont"+ index).attr("class", "");	
	}else{
	$("#img"+ index).attr("src", "${contextPath}/resources/img/sample/bottom_arrow.png");
	$("#cont"+ index).attr("class", "ellTxt");	
	}
	
}

function del(idx){
	
	if(confirm("정말 삭제하시겠습니까?")){
		$.ajax({
			type : "post",
			dataType : "text", 
			url : "delete.do",
			data : {
				idx: idx
			},
			success : function(result){
				alert("삭제완료");
				 proc('indexProc.do');
			},
			error : function(result){
				errMsg(result);
			}
		});
		}
}

function click(){
	$(".navbar2").off("click");
}
</script>
</head>
<body>
 <c:choose>
     	<c:when test = "${empty list}">
     			<section id="services" class="services section-bg" style="padding-top: 10px;padding-bottom: 10px;">
     		<div  class="col-md-6 col-lg-4 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100" style="width: 100%;">
	 			<%-- 상단 --%>
	 			<div  class="box">
     		<span>데이터가 없습니다</span>
     		</div>
     		</div>
     		</section>
     	</c:when>
     	<c:otherwise>
     		
     		<c:forEach var='arr' items="${list}" varStatus="st">
	
		<section id="services" class="services section-bg" style="padding-top: 10px;padding-bottom: 10px;">
	 		<div  class="col-md-6 col-lg-4 wow bounceInUp" data-aos="zoom-in" data-aos-delay="100" style="width: 100%;">
	 			<%-- 상단 --%>
	 			<div  class="box">
	 			<table style="width: 100%;">
	 				<colgroup>
						<col style="width: 15%">
						<col style="width: 65%">
						<col style="width: 10%">
					</colgroup>
	 			<tbody>
	 				<tr>
	 					<th style="padding-left: 1%;">
	 					<span><img src='${contextPath}/resources/img/profile/${arr.pNo}.jpg' class='profile'></span>
	 					</th>
	 					<th style="padding-left: 3%;text-align: left;">
	 							<p style="padding-top: 12%;">${arr.vNm }
	 							<br>
	 							<span style="font-size: 13px;">방문일  ${arr.vdt}
	 							<%--<br>작성일  ${arr.wdt}  --%>
	 							</span>
	 							</p>
	 					</th>
	 					<th>
	 					    <nav id="navbar2" class="navbar navbar2">
							<ul style="display: inline;" >	 					
	 					 <li class="dropdown navbar2"><a href="javascript:click();" ><span>...</span><i class="bi bi-chevron-down"></i></a>
				            <ul style="left : -12px;">
				              <li><a href="#" onclick="del(${arr.idx});">삭제</a></li>
				            </ul>
				          </li>
				          </ul>
				          </nav>
	 					</th>
	 				</tr>
	 				<tr >
	 					<th colspan="3" style="padding-top: 2%;padding-bottom: 2%;">
	 					<img src='${contextPath}/upload/${arr.photo}' style="width: 100%;" onerror="this.style.display='none'"> </th>
	 				</tr>
	 				<tr>
	 					<th colspan="3" style="padding-left: 2%;text-align: left;">
	 				<c:set var="cont" value='${arr.cont}'/>
	 					<span id='cont${st.index}' 
	 						<c:if test="${ arr.cSkip ne '0' }">
	 					class='ellTxt'
	 					</c:if>
	 					style="width: 100%;">
	 					${fn:replace(arr.cont,newLine, '<br>')}
	 					<%-- 
	 					<c:if test="${ arr.cSkip eq '0' }">
	 					${fn:replace(arr.cont,newLine, '<br>')}
	 					</c:if>
	 					<c:if test="${ arr.cSkip ne '0' }">
	 					${fn:replace(arr.cSkip,newLine, '<br>')}
	 					</c:if>
	 					
	 					--%>
	 					</span>
	 					
	 					</th>
	 				</tr>
	 				<c:if test="${ arr.cSkip ne '0' }">
	 				<tr>
	 				<th colspan="3"> 
	 				<img src='${contextPath}/resources/img/sample/bottom_arrow.png' id='img${st.index}' style="width: 50px; height: 30px;" onclick="showAll(${st.index});">
	 				 </th>
	 				</tr>
	 				</c:if>
	 			</tbody>
	 			</table>
	 			</div>
	 			<%-- 상단 end --%>
	 		
	 		
	 		</div>
	 		</section>
			
			</c:forEach>	
		
        </c:otherwise>
 	</c:choose>
 	


</body>
</html>