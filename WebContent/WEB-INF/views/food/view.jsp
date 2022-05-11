<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>냉장고 상세보기</title>
</head>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <script src="${contextPath}/resources/js/common.js"></script>
  <script>
  $(document).ready(function(){
		
	  console.log('${arrList[0].area}' + "ddd");
	  
	  	// 냉동실 위치 코드 가져오기 위해 food 테이블의 tp와 food_l 테이블 area 데이터 사용
	  	
	  	var tp;
	  	var area;
	  	
	  	if('${arrList[0].tp}' != ''){
	  		tp = '${arrList[0].tp}';
	  	}else{
	  		tp = '${vo.tp}';
	  	}
	  	
	  	if('${arrList[0].area}' != ''){
	  		area = '${arrList[0].area}';
	  	}else{
	  		area = '${vo.area}';
	  	}
	  	
		selectCode3(tp, area);
	});

  	// 세번째 코드 테이블 코드 가져오기
	function selectCode3(scd,cd){
		
		
		$.ajaxSettings.traditional = true;
			$.ajax({
				type : "post"
				,dataType : "html"
				,data :{
					scd : scd,
				  cd : cd				  
				}
				,url :"${contextPath}/my/code3.do"
				,success : listGo  
				,error : function(result) { alert(result + "실패"); }
			});
		}
		function listGo(msg) { 
			$("#ListFrm").html(msg);	
			
		}
		
		function update(){
			
			var frm = document.frmReg;
			
			if($( "input[name='chkval']").is(":checked") == true){
				frm.chk.value = '1';
			}else{
				frm.chk.value = '0';
			}
			
			frm.area.value = $("select[name=cdTP01]").val();
			frm.mode.value = '${vo.mode}';
			frm.submit();
		}	
		
		function del(){
			if(confirm("정말 삭제하시겠습니까?")){
			$.ajax({
				type : "post",
				dataType : "text", 
				 async : false,
				url : "delete.do",
				data : {
					jidx : '${arrList[0].jidx}',
					idx: '${arrList[0].idx}'
				},
				success : function(result){
					alert("삭제완료");
					location.href='index.do?mode='+ ${vo.mode};
				},
				error : function(result){
					errMsg(result);
				}
			});
			}
		}
		
	function insert(){
			
		if($( "input[name='chkval']").is(":checked") == true){
			$("input[name='chk']").val("1");
		}else{
			$("input[name='chk']").val("0");
		}
		
			$.ajax({
				type : "post",
				dataType : "text", 
				 async : false,
				url : "insertOne.do",
				data : {
					jidx : $("input[name='jidx']").val(),
					chk: $("input[name='chk']").val(), 
					fnm: $("input[name='fnm']").val(), 
					price: $("input[name='price']").val(), 
					bdt: $("input[name='bdt']").val(), 
					fdt: $("input[name='fdt']").val(), 
					vm: $("input[name='vm']").val(), 
					area: $("select[name=cdTP01]").val(),
					mode : "${vo.mode}"
				},
				success : function(result){
					alert("등록완료");
					location.href='index.do?mode='+ ${vo.mode};
				},
				error : function(result){
					errMsg(result);
				}
			});
		}
		
  </script>
<body>
<main>
<!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">식재료</a></li>
          <li>전체</li>
          <li>상세보기</li>
        </ol>
        <h2>상세보기</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="">
		   <form id='frmReg' name="frmReg" method="post" action="updateAll.do">
		   <input type="hidden" name='jidx' value="<c:if test='${arrList[0].jidx == null}'>${vo.jidx}</c:if><c:if test='${arrList[0].jidx != null}'>${arrList[0].jidx}</c:if>"/>
		   <input type="hidden" name='idx' value="${arrList[0].idx}"/>
		   <input type="hidden" id='chk' name='chk' value="${arrList[0].chk}" />
		   <input type="hidden" id='mode' name='mode' value="${vo.mode}" />
		   <input type="hidden" id='area' name='area'/> 
          <table class="" style="border: 1px solid; width: 100%;" >
             <tr>
             <th>품명</th>
             <th><input type="text" name='fnm' value="${arrList[0].fnm}"></th>
             </tr>
             <tr>
             <th>가격</th>
             <th><input type="text" name='price' value="${arrList[0].price}"></th>
             </tr>
             <tr>
             <th>구매일</th>
             <th><input type="date" name='bdt' value="${arrList[0].bdt}"></th>
             </tr>
             <tr>
             <th>유통기한</th>
             <th><input type="date" name='fdt' value="${arrList[0].fdt}"></th>
             </tr>
             <tr>
             <th>개수/용량</th>
             <th><input type="text" name='vm' value="${arrList[0].vm}"></th>
             </tr>
             <tr>
             <th>위치</th>
             <th> <span id='ListFrm'></span></th>
             </tr> 
             <tr>
             <th>사용여부</th>
             <th><input type="checkbox" name='chkval' <c:if test='${arrList[0].chk eq "1".charAt(0)}'>checked="checked"</c:if>/>
             * 사용 완료 시 체크
             </th>
             </tr>         
          </table>
         </form>
          <a href="#" <c:if test='${vo.idx != "0"}'>onclick="update();"</c:if> <c:if test='${vo.idx == "0"}'>onclick="insert();"</c:if> >저장</a>
          <c:if test='${vo.idx != "0"}'>
          <a href="#" onclick="del();">삭제</a>
          </c:if>
          <div>
          </div>
          </div>
          </div>
          </div>
          </section>
          

  </main><!-- End #main -->
</body>
</html>