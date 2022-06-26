<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="kn">

<head>
<meta charset="UTF-8">
<title>회원관리</title> 
</head>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/admin/common/adminHeader.jsp"/>
	  <script src="${contextPath}/resources/js/common.js"></script>
	  <script type="text/javascript">  
	    $(document).ready(function(){
	  
	  
	});
  
		
		</script>

 


<body>
        
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="index.html">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>
                        <div class="card mb-4">
                            <div class="card-body">
                                DataTables is a third party plugin that is used to generate the demo table below. For more information about DataTables, please visit the
                                <a target="_blank" href="https://datatables.net/">official DataTables documentation</a>
                                .
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                DataTable Example
                            </div>
                            <div class="card-body">
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                          <th>no</th>
						 					<th>제목</th>
						 					<th>문의회원</th>
						 					<th>날짜</th>
						 					<th>상태</th>
						 					<th>상담원</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                         	 <th>no</th>
						 					<th>제목</th>
						 					<th>문의회원</th>
						 					<th>날짜</th>
						 					<th>상태</th>
						 					<th>상담원</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:choose>
				     	<c:when test = "${empty list}">
				     	<tr>
					     			<th colspan="6" style="text-align: center;">데이터가 없습니다.</th>
					     		</tr>
					     	</c:when>
					     	<c:otherwise>
					     	 <c:forEach var="arr" items = "${list}">
				     	
                                        <tr>
                                           <td>${arr.rn}</td>
							     			<td ><a href='view.do?idx=${arr.idx}' >${arr.title}	</a></td>
							     			<td>${arr.nNm}</td>
							     			<td>${arr.wdt}</td>
							     			<td>${arr.sta}</td>
							     			<td>${arr.counId}</td>
                                        </tr>
                                        </c:forEach>
                                        </c:otherwise>
                                        </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </main>
                   <!-- ------------------------- footer ---------------------------- -->
		<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"/>
         <jsp:include page="/WEB-INF/views/admin/common/adminHeader2.jsp"/>
        </div>

       	
    </body>
</html>