<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<body>
<script type="text/javascript">
$(document).ready(function(){

});

</script>

<main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">
        <ol>
          <li><a href="index.html">공과금</a></li>
          <li>전체</li>
        </ol>
        <h2>상세보기</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="">

          <div class="">
          
					<div>
					<select id='yyyyC' name='yyyyC'>
					<option>년도</option>
					<option value="2022" <c:if test='${gasV[0].yyyy eq "2022"}'>selected="selected"</c:if>>2022</option>
					<option value="2021" <c:if test='${gasV[0].yyyy eq "2021"}'>selected="selected"</c:if>>2021</option>
					<option value="2020" <c:if test='${gasV[0].yyyy eq "2020"}'>selected="selected"</c:if>>2020</option>
					<option value="2019" <c:if test='${gasV[0].yyyy eq "2019"}'>selected="selected"</c:if>>2019</option>
					</select>
					
					<select id='mmC' name='mmC'>
					<option>월</option>
					<c:forEach var="i" begin="1" end="12" step="1">
					<option value="${i}"<c:if test='${gasV[0].mm eq i}'>selected="selected"</c:if>>${i}</option>
					</c:forEach>
					</select>
					
					<button onclick="schGo();">검색</button>
					
					</div>
					
            <div class="portfolio-info">
              <div class="swiper-wrapper align-items-center">


					<%--이번달 요금 --%>
                <div class="swiper-slide">
                	<c:forEach var='arr' items='${gasV}' varStatus="st">
						<c:set var='addGas' value='${arr.defM + arr.cGm + arr.uGm - arr.sGm + arr.kGm +arr.mGm+ arr.aGm + arr.avgGm - arr.jsGm + arr.enGu}'/>
                	 <h3>${arr.yyyy}년도 ${arr.mm}월  상세요금 <c:if test="${addGas ne null || addGas ne '0'}">  </c:if> </h3>
                	 
                	  <h4>가스</h4>
                	 <p class="nomalForm">
                	 <c:if test="${arr.gChk eq 'Y'}">
                	 이번 달 사용요금을 
                	  <c:if test="${arr.autoWhen ne null}">
                	 	${arr.autoWhen}일에
                	 </c:if>
                	 <c:if test="${arr.autoHow ne null}">${arr.autoHow}로</c:if> 
                	 납부했습니다.
                	
                	 </c:if>
                	 
                	 <c:if test="${arr.gChk eq 'N'}">
                	 이번 달은 아직 사용요급을 납부하지 않았습니다
                	 </c:if>
                	 </p>
                	 
				<form name="frmReg${st.index}" class='boder-black' method="post">
				
				
				<c:set var='mode' value='u'/>
				<%--<c:if test="${arr.gasM == null && arr.elM == null && arr.wtM == null && arr.itM == null}"> --%>
				<c:if test="${arr.idx == null}"> 
				<c:set var='mode' value='i'/>
				</c:if>
				
                <input type="hidden" value="${arr.idx}" name='idx' id='idx'/>
                <input type="hidden" value="${arr.jidx}" name='jidx' id='jidx'/>
                <input type="hidden" value="${mode}" name='mode' id='mode'/>
                <input type="hidden" value="${arr.yyyy}" name='yyyy' id='yyyy'/>
                <input type="hidden" value="${arr.mm}" name='mm' id='mm'/>
                <input type="hidden" value="${arr.uId}" name='uId' id='uId'/>
                <input type="hidden" value="${arr.gChk}" name='gChk' id='gChk'/>
                	
                	<table class='tb'>
                	<tbody>
					<tr>
						<th  class='boder-black'>기본료 </th>
						<th  class='boder-black'>교체비</th>
						<th  class='boder-black'>사용요금</th>
						<th  class='boder-black'>부가세</th>
						<th  class='boder-black'>할인금액</th>
					</tr>
										
					<tr>
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.defM ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.defM}" type="number"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.cGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.cGm}" type="number"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.uGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.uGm}" type="number"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.aGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.aGm}" type="number"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.sGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.sGm}" type="number"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
					</tr>
					
					<tr>
						<th  class='boder-black'>가산금</th>
						<th  class='boder-black'>미납금</th>
						<th  class='boder-black'>정산금액</th>
						<th  class='boder-black'>절사금액</th>
						<th  class='boder-black'>에너지바우처</th>
					</tr>
					
					<tr>
					
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.kGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.kGm}" type="number"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.mGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.mGm}" type="number"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.avgGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.avgGm}" type="number"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.jsGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.jsGm}" type="number"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th colspan="2" class='boder-black'>
						<c:choose>
						<c:when test="${arr.enGu ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.enGu}" type="number"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
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
						<c:when test="${arr.monGu ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.monGu}" type="number"/>m³</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0m³</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.useG ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.useG}" type="number"/>m³</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0m³</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.useB ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.useB}" type="number"/>m³</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0m³</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
					<tr>
					<th colspan="6"> 총 사용 금액 : <fmt:formatNumber value="${arr.suma}" type="number"/>원 </th>
					</tr>
                	</tbody>
                	</table>
</form>
</c:forEach>
</div>
</div>
</div>
</div>
</div>
</div>
</s>

  </main><!-- End #main -->
</body>
<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/footer.jsp"/>
	
	<script>

	// 검색 버튼
	function schGo(){
		
		location.href='gas.do?yyyy='+ $("select[name=yyyyC]").val() + '&mm=' + $("select[name=mmC]").val() + '&uId=' + $("input:hidden[name='uId']").val(); 
	}
	
	
	function reload() { (location || window.location || document.location).reload(); }
	

	</script>
	
</html>