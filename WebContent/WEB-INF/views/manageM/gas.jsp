<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="my" uri="myFunc"%> 


<!DOCTYPE html>
<html lang="kn">
<head>

<meta charset="UTF-8">
<title>공과금 - 가스</title>
</head>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
<script type="text/javascript">

// 수정 버튼을 눌렀을 때, 입력폼으로 전환
function up(index){
	
	if($("#upbtn").val() == "등록"){
		if(confirm("등록하시겠습니까?")){
			
			/* 그냥 form 액션
			if(index == 0)var frm = document.forms[0];
			if(index == 1)var frm = document.forms[1];
			
					frm.action = 'updateMAll.do';
					frm.target = "frmSys";
					frm.meth  class='boder-black'od = 'post';
					frm.submit();
					
					
					$(".nomalFrom").css("display", "inline");
					$(".upFrom").css("display", "none");
					$("#upbtn").val("수정");
					
					reload();
			 form 액션 종료 */
			 
			$.ajax({
				type : "post",
				dataType : "text", 
				 async : false,
				url : "updateMAll.do",
				data : {
					yyyy: $("input:hidden[name='yyyy']").val(), 
					mm: $("input:hidden[name='mm']").val(), 
					mode: $("input:hidden[name='mode']").val(), 
					uId: $("input:hidden[name='uId']").val(), 
					idx: $("input:hidden[name='idx']").val(), 
					gasM: $("input[name='gasM']").val(), 
					elM: $("input[name='elM']").val(), 
					wtM: $("input[name='wtM']").val(), 
					itM: $("input[name='itM']").val(), 
				},
				success : function(result){
					alert("등록완료");
					reload();
				},
				error : function(result){
					errMsg(result);
				}
			});
			 
		}
		return;
	}
	$(".nomalFrom").css("display", "none");
	$(".upFrom").css("display", "inline");
	
	$("#upbtn").val("등록");
	
}

function reload() { (location || window.location || document.location).reload(); }

</script>
<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <ol>
          <li><a href="index.html">공과금</a></li>
          <li>가스</li>
        </ol>
        <h2>가스</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="">

          <div class="">
            <div class="portfolio-info">
              <div class="swiper-wrapper align-items-center">

					<%--이번달 요금 --%>
                <div class="swiper-slide">
                	<c:forEach var='arr' items='${arrViewNow}' varStatus="st">
                	 <h3>${arr.yyyy}년도 ${arr.mm}월 가스 상세요금</h3>
				<form name="frmReg${st.index}" meth  class='boder-black'od="post">
				
				
				<c:set var='mode' value='u'/>
				<%--<c:if test="${arr.gasM == null && arr.elM == null && arr.wtM == null && arr.itM == null}"> --%>
				<c:if test="${arr.idx == null}"> 
				<c:set var='mode' value='i'/>
				</c:if>
				
                <input type="hidden" value="${arr.idx}" name='idx' id='idx'/>
                <input type="hidden" value="${mode}" name='mode' id='mode'/>
                <input type="hidden" value="${arr.yyyy}" name='yyyy' id='yyyy'/>
                <input type="hidden" value="${arr.mm}" name='mm' id='mm'/>
                <input type="hidden" value="${arr.uId}" name='uId' id='uId'/>
                	
                	
                	
                	<table class='tb'>
                	<tbody>
					<tr>
						<th  class='boder-black'>기본료</th>
						<th  class='boder-black'>교체비</th>
						<th  class='boder-black'>사용요금</th>
						<th  class='boder-black'>부가세</th>
						<th  class='boder-black'>할인금액</th>
						<th  class='boder-black'>미납금</th>
						<th  class='boder-black'>정산금액</th>
						<th  class='boder-black'>절시금액</th>
						<th  class='boder-black'>에너지바우처</th>
					</tr>
					<tr>
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.gasM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.gasM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name='gasM' value="${arr.gasM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom' ><input  class='manageI' type="text" name='gasM' value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.elM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.elM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="elM" value="${arr.elM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom'><input  class='manageI' type="text" name="elM" value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.wtM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.wtM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="wtM" value="${arr.wtM}""/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom' ><input  class='manageI' type="text" name="wtM" value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.itM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.itM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="itM"  value="${arr.itM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom'><input  class='manageI' type="text" name="itM" value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
                	</tbody>
                	</table>
                	
                	<!--  사용량 -->
                	<table class='tb'>
                	<tbody>
					<tr>
						<th  class='boder-black'>당월지침</th>
						<th  class='boder-black'>사용량</th>
						<th  class='boder-black'>사용열량</th>
					</tr>
					<tr>
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.gasM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.gasM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name='gasM' value="${arr.gasM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom' ><input  class='manageI' type="text" name='gasM' value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.elM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.elM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="elM" value="${arr.elM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom'><input  class='manageI' type="text" name="elM" value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.wtM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.wtM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="wtM" value="${arr.wtM}""/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom' ><input  class='manageI' type="text" name="wtM" value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.itM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.itM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="itM"  value="${arr.itM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom'><input  class='manageI' type="text" name="itM" value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
                	</tbody>
                	</table>
                		<input id='upbtn' class='btn_brown' type="button" onclick="up(${st.index});" value="수정"/> 
</form>
<iframe id="frmSys" name="frmSys" allowTransparency="true" width="0" height="0" scrolling="no" frameborder="0"></iframe>
                		</c:forEach>
                		
                </div>
              </div>
              
              <br><br>
              <div class="swiper-slide">
               <h3>이번달엔 얼마나 줄였을까? </h3>
      		<table class="tb">
      		<tbody>
      			<tr>
      			<th  class='boder-black'>년/월</th>
      			<th  class='boder-black'>가스</th>
      			<th  class='boder-black'>전기</th>
      			<th  class='boder-black'>수도</th>
      			<th  class='boder-black'>인터넷</th>
      			</tr>
		      <c:forEach var='arrC' items='${arrViewPast}' varStatus="st">
      			<tr>
      			<th  class='boder-black'>${arrC.yyyy}년 ${arrC.mm}월</th>
      			
      			<th  class='boder-black'>
      			<span class='nomalFrom'><fmt:formatNumber value="${arrC.gasM}" type="number"/>원
      			</span>
      			</th>
      			
      			<th  class='boder-black'>
      			<span class='nomalFrom'><fmt:formatNumber value="${arrC.elM}" type="number"/>원
      			</span>
      			</th>
      			
      			<th  class='boder-black'>
      			<span class='nomalFrom'><fmt:formatNumber value="${arrC.wtM}" type="number"/>원
      			</span>
      			</th>
      			
      			<th  class='boder-black'>
      			<span class='nomalFrom'><fmt:formatNumber value="${arrC.itM}" type="number"/>원
      			</span>
      			</th>      			
      			</tr>	
      			</c:forEach>
      			
      			<c:set var='gas' value='${arrViewPast[1].gasM - arrViewPast[0].gasM}'/>
      			<c:set var='el' value='${arrViewPast[1].elM - arrViewPast[0].elM}' />
      			<c:set var='wt' value='${arrViewPast[1].wtM - arrViewPast[0].wtM}'/>
      			<c:set var='it' value='${arrViewPast[1].itM - arrViewPast[0].itM}' />
      		
      			
      			<tr>
      				<th>개별 총</th>
      				<th class='boder-black'><fmt:formatNumber value="${gas}" type="number"/>원</th>
      				<th class='boder-black'><fmt:formatNumber value="${el}" type="number"/>원</th>
      				<th class='boder-black'><fmt:formatNumber value="${wt}" type="number"/>원</th>
      				<th class='boder-black'><fmt:formatNumber value="${it}" type="number"/>원</th>
      			</tr>	    
      		</tbody>
     		</table>
     		
     		<br><br>
     		
      		<c:set var='avg' value="${gas+el+wt+it}" ></c:set>
			<c:choose>
			<c:when test="${avg >= 0}">
			<div style="text-align: center;">
			<h4>
			<img alt="" src="${contextPath}/resources/img/feeling/good1.png" style="width: 34%">
			<fmt:formatNumber value="${avg}" type="number"/>원 절약했어!</h4>
			</div>
			
			</c:when>
			<c:when test="${avg < 0}">
			<div style="text-align: center;">
			<h4>
			<img alt="" src="${contextPath}/resources/img/feeling/bad.png" style="width: 34%">
			<fmt:formatNumber value="${avg}" type="number"/>원 이라니..홀리...마마</h4>
			</div>
			</c:when>
			</c:choose>
      		
      		<br>
      		<hr>
      		<br>
      		
      		<h3>한눈에 보는 내 공과금</h3>
      		<br>
      		<!-- 전원 당월 막대그래프 비교 -->
      		<figure class="highcharts-figure">
		    <div id="container2"></div>
		    <p class="highcharts-description">
		      
		    </p>
			</figure>
			
			<br><br>
      		
      		
      		<!-- 3개월간 총 지출 금액 차트 -->
      		<figure class="highcharts-figure">
		    <div id="container"></div>
		    <p class="highcharts-description">
		        
		    </p>
			</figure>

			
              </div>
            </div>
          </div>

  </main><!-- End #main -->
</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
</html>