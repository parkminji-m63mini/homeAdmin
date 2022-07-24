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
	
	<link rel="stylesheet" href="${contextPath}/resources/css/common.css">
  <script src="${contextPath}/resources/js/common.js"></script>
  <script>
  $(document).ready(function(){
		
	//input에  onlyNumber 추가하면 자동으로 숫자만 들어가게 함
		$('input[onlyNumber]').on('keyup', function () {
				console.log("들어옴");
			    $(this).val($(this).val().replace(/[^0-9]/g, ""));
			});
	  
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

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="">
        <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">식재료</a></li>
          <li>상세보기</li>
        </ol>
      </div>
    </section><!-- End Breadcrumbs -->
        
        <br>
		   <form id='frmReg' name="frmReg" method="post" action="updateAll.do">
		   <input type="hidden" name='jidx' value="<c:if test='${arrList[0].jidx == null}'>${vo.jidx}</c:if><c:if test='${arrList[0].jidx != null}'>${arrList[0].jidx}</c:if>"/>
		   <input type="hidden" name='idx' value="${arrList[0].idx}"/>
		   <input type="hidden" id='chk' name='chk' value="${arrList[0].chk}" />
		   <input type="hidden" id='mode' name='mode' value="${vo.mode}" />
		   <input type="hidden" id='area' name='area'/> 
          <table class=""   style="width: 100%;">
          <colgroup>
							<col style="width: 100%">
						</colgroup>
             <tr>
             <th class='ContD'>품명</th>
             </tr>
             <tr>
             <th class='subContCenter'>
             <input class='form-control' type="text" name='fnm' value="${arrList[0].fnm}"></th>
             </tr>
             <tr>
             <th class='ContD'>가격</th>
             </tr>
             <tr>
             <th class='subContCenter'><input onlyNumber  class='form-control moneyInputWon' type="text" name='price' value="${arrList[0].price}">원</th>
             </tr>
             <tr>
             <th class='ContD'>구매일</th>
             </tr>
             <tr>
             <th class='subContCenter'><input class='form-control' type="date" name='bdt' value="${arrList[0].bdt}"></th>
             </tr>
             <tr>
             <th class='ContD'>유통기한</th>
             </tr>
             <tr>
             <th class='subContCenter'><input class='form-control' type="date" name='fdt' value="${arrList[0].fdt}"></th>
             </tr>
             <tr>
             <th class='ContD'>비고</th>
             </tr>
             <tr>
             <th class='subContCenter'><input class='form-control' type="text" name='vm' value="${arrList[0].vm}"></th>
             </tr>
             <tr>
             <th class='ContD'>위치</th>
             </tr>
             <tr>
             <th class='subContCenter'> <span id='ListFrm'></span></th>
             </tr> 
             <tr>
             <th class='ContD'>사용여부</th>
             </tr>
             <tr>
             <th class='subContCenter'><input  type="checkbox" name='chkval' <c:if test='${arrList[0].chk eq "1".charAt(0)}'>checked="checked"</c:if>/>
             <span style=" font-size: 15px;">* 사용 완료 시 체크</span>
             </th>
             </tr>         
          </table>
         </form>
         <hr>
         <div style="width: 100%;text-align: center;">
          <a href="#" style="float: none;"  class="upbtn btn btn-primary-1" <c:if test='${vo.idx != "0"}'>onclick="update();"</c:if> <c:if test='${vo.idx == "0"}'>onclick="insert();"</c:if> >저장</a>
          <c:if test='${vo.idx != "0"}'>
          <a class="upbtn btn btn-danger" href="#" onclick="del();">삭제</a>
          </c:if>
          </div>
          <div>
          </div>
          </div>
          </div>
          </section>
          

  </main><!-- End #main -->
</body>
</html>