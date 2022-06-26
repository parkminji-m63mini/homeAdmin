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
                                            <th>RN</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>성별</th>
                                            <th>집타입</th>
                                            <th>거주타입</th>
                                            <th>생년월일</th>
                                            <th>이메일</th>
                                            <th>가입경로</th>
                                            <th>직업</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>RN</th>
                                            <th>아이디</th>
                                            <th>이름</th>
                                            <th>닉네임</th>
                                            <th>성별</th>
                                            <th>집타입</th>
                                            <th>거주타입</th>
                                            <th>생년월일</th>
                                            <th>이메일</th>
                                            <th>가입경로</th>
                                            <th>직업</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                    <c:choose>
				     	<c:when test = "${empty list}">
				     	<tr>
					     			<th colspan="11" style="text-align: center;">데이터가 없습니다.</th>
					     		</tr>
					     	</c:when>
					     	<c:otherwise>
					     	 <c:forEach var="arr" items = "${list}">
				     	
                                        <tr>
                                            <td>${arr.rn}</td>
                                            <td>${arr.id}</td>
                                            <td>${arr.nm}</td>
                                            <td>${arr.nNm}</td>
                                            <td>${arr.sex}</td>
                                            <td>${arr.htype}</td>
                                             <td>${arr.ltype}</td>
                                            <td><c:if test="${my:NVL(arr.born,0) ne 0}">${arr.born}/</c:if>${arr.birth}</td>
                                            <td>${arr.email}</td>
                                            <td>${arr.snsInfo}</td>
                                            <td>${arr.sta}</td>
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