<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<select id='cd${cd}' name='cd${cd}'>
<c:forEach var='arr' items="${list}" varStatus="st">

<option value="${arr.cd}" <c:if test="${arr.cd eq cd}"> selected="selected"</c:if> >${arr.cnm}</option>
</c:forEach>
</select>
</body>
</html>