<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>

<!DOCTYPE html>
<html lang="kn">

<head>
<meta charset="UTF-8">
<title>회원관리</title>
<style type="text/css">
table {
  border-spacing: 10px;
  border-collapse: separate !important;
}
table th {
  width: 30px;
}
</style> 
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
                              	회원이 남긴 문의글에 답변을 남겨주세요.
                            </div>
                        </div>
                       <div class='card-body'>
                         <form id='frmReg' name="frmReg" method="post" action="javascript:proc('indexProc.do');">
                         
                         	<input type="hidden" name='counId' id="counId" value="${sessionScope.ssID}">
                       	   <table style="width: 100%;">
									<colgroup>
										<col style="width: 15%">
										<col style="width: 35%">
										<col style="width: 15%">
										<col style="width: 35%">
									</colgroup>                       	   				
                                       
                                    <tbody>
                                         <tr>
                                          <th>문의 종류</th>
						 					<th><input class="wi35" type="text" value="${list.cnm}" disabled="disabled"></th>
						 					<th>회원 닉네임</th>
						 					<th><input class="wi35"  type="text" value="${list.nNm}" disabled="disabled"></th>
                                        </tr>
                                     <tr >
                                          <th>제목</th>
						 					<th colspan="3"><input class="wi100"  type="text" value="${list.title}" disabled="disabled"></th>
                                        </tr>
                                        <tr>
                                        </tr>
                                        <tr>
                                          <th colspan="4">문의 내용</th>
                                        </tr>
                                        <tr>
						 					<th colspan="4"><textarea class="wi100"  rows="10" cols="" disabled="disabled"> ${list.cont }</textarea></th>
                                        </tr>
                                        
                                        
                                        <tr>
                                        <th colspan="4"><hr></th>
                                        </tr>
                                        
                                        <tr>
                                        	<th colspan="4">답변</th>
                                        </tr>
                                        
                                        <tr>
                                        	<th colspan="4"><textarea class="wi100"  rows="10" cols="" > ${list.answer}</textarea></th>
                                        </tr>
                                        
                                        <tr>
                                        	<th colspan="4">대외비</th>
                                        </tr>
                                        
                                        <tr>
                                        	<th colspan="4"><textarea class="wi100"  rows="5" cols="" placeholder="이부분은 회원에게 보이지 않습니다."><c:if test="${my:NVL(list.etc,0) ne 0}"> ${list.etc}</c:if></textarea></th>
                                        </tr>
                                        
                                        <tr>
                                        	<th>작성자</th>
                                        	<th ><input class="wi35"  type="text" value="${sessionScope.ssNM}" disabled="disabled"></th>
                                        	<th>답변 상태</th>
                                        	<th>
                                        		<select>
                                        			<option value="" >선택</option>
                                        			<option value="0" selected="selected">답변대기</option>
                                        		</select>
                                       		</th>
                                        </tr>
                                    </tbody>
                                </table>
                               </form>
                       </div>
                    </div>
                </main>
                   <!-- ------------------------- footer ---------------------------- -->
		<jsp:include page="/WEB-INF/views/admin/common/adminFooter.jsp"/>
         <jsp:include page="/WEB-INF/views/admin/common/adminHeader2.jsp"/>
        </div>

       	
    </body>
</html>