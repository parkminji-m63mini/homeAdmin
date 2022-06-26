<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리스트</title>
<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
</head>
<body>


     		
	
		<section id="services222"  style="padding-top: 10px;padding-bottom: 10px;">
	 		<div  style="width: 100%;">
	 			<%-- 상단 --%>
	 			<div  class="box">
	 			<table style="width: 100%;">
	 				<colgroup>
						<col style="width: 5%">
						<col style="width: 40%">
						<col style="width: 23%">
						<col style="width: 19%">
					</colgroup>
	 			<tbody>
	 				<tr>
	 					<th>no</th>
	 					<th>제목</th>
	 					<th>날짜</th>
	 					<th>상태</th>
 					</tr>
	 				<c:choose>
				     	<c:when test = "${empty list}">
					     		<tr>
					     			<th colspan="4">데이터가 없습니다.</th>
					     		</tr>
					     	</c:when>
					     	<c:otherwise>
					     	 <c:forEach var="arr" items = "${list}">
					     		<tr>
					     			<th>${arr.rn}</th>
					     			<th><a href='view.do?idx=${arr.idx}'>${arr.title}</a></th>
					     			<th>${arr.wdt}</th>
					     			<th>
					     			${arr.sta}
					     			</th>
					     		</tr>
					     		</c:forEach>
					    	</c:otherwise>
					   </c:choose> 		
	 			</tbody>
	 			</table>
	 			</div>
	 			<%-- 상단 end --%>
	 		
	 		
	 		</div>
	 		<jsp:include page="/WEB-INF/views/common/boardList.jsp"/>
	
	 		</section>
	 		
			
		
</body>
</html>