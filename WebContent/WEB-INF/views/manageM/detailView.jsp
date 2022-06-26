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
					
            <div class="portfolio-info">
              <div class="swiper-wrapper align-items-center">


					<%--이번달 요금 --%>
                <div class="swiper-slide">
                	<c:forEach var='arr' items='${gasV}' varStatus="st">
						<c:set var='addGas' value='${arr.defM + arr.cGm + arr.uGm - arr.sGm + arr.kGm +arr.mGm+ arr.aGm + arr.avgGm - arr.jsGm + arr.enGu}'/>
                	  <span style="float: right;" ><a href="javascript:history.back();" > >> 뒤로가기</a></span>
                	 <h3>${arr.yyyy}년도 ${arr.mm}월  상세요금 </h3>
                	  <h4>가스     	  	  </h4>
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
                	 <span style="float : right; font-size: 15px;" ><a href="gas.do?yyyy=${arr.yyyy}&mm=${arr.mm}" > >> 이동</a></span>
           	<c:choose>
           		<c:when test="${arr.suma eq null || arr.suma eq '0'}">
           			<table class='tb'>
           			<tbody>
           			<tr>
           				<th>상세 데이터가 없습니다</th>
           			</tr>
           			<tr>
					
					<c:choose>
						<c:when test="${arr.suma eq null || arr.suma eq '0'}">
						<c:set var='gSuma' value='${arr.gasM}'/>
						</c:when>		
						<c:otherwise>
						<c:set var='gSuma' value='${arr.suma}'/>
						</c:otherwise>
					</c:choose>
					<th > 총 사용 금액 : <fmt:formatNumber value="${gSuma}" type="number"/>원 </th>
					</tr>
                	</tbody>
                	</table>
           		</c:when>
           		<c:otherwise>
                		
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
					
					<c:choose>
						<c:when test="${arr.suma eq null || arr.suma eq '0'}">
						<c:set var='gSuma' value='${arr.gasM}'/>
						</c:when>		
						<c:otherwise>
						<c:set var='gSuma' value='${arr.suma}'/>
						</c:otherwise>
					</c:choose>
					<th colspan="6"> 총 사용 금액 : <fmt:formatNumber value="${gSuma}" type="number"/>원 </th>
					</tr>
                	</tbody>
                	</table>
					</form>
       		</c:otherwise>
       	</c:choose>
                	
                	
</c:forEach>
						<hr>
						<h4>전기</h4>
						
					<c:forEach var='arr' items='${elV}' varStatus="st">	 
					<c:set var='add' value='${arr.defM + arr.lEm + arr.woEm -arr.miEm+ arr.aEm + arr.gyEm - arr.jsEm }'/>	
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
                	 
                	 <div class="upForm" style="display: none;"> 
                	   <p>이번 달 사용요금 지출을 완료하였나요?
                <span><input type="radio" name='gChk'  <c:if test="${arr.gChk eq 'Y'}">checked="checked"</c:if> value="Y" >네</span>
                <span>
                <input type="radio" name='gChk'  <c:if test="${arr.gChk eq 'N'}">checked="checked"</c:if> value="N" >아니요
                	</span> 
                </p>	
                </div>
                	 
                	 
               <div class="upForm" style="display: none;">
                <p>자동이체로 납부하시나요?
                 <span>
                 <input type="radio" name='autoM' <c:if test="${arr.autoM eq 'Y'}">checked="checked"</c:if> value="Y" >네</span>
                <span>
                <input type="radio" name='autoM'  <c:if test="${arr.autoM eq 'N'}">checked="checked"</c:if> value="N" >아니요</span>
				       </p>       
				       
				  <!-- 디자인 좀 넣기 -->     
				 <div id='showAuto' style="display: none;">
					<p>어떤 방법으로 납부하시나요? 
					<input  style="width: 48%;" class='manageI' type="text" name='autoHow' value="${arr.autoHow}" placeholder="ex)기업은행,삼성카드.."/>
					</p>
					 
					<p>이체 날은 언제인가요? 
					<input  style="width: 20%;" class='manageI' type="text" name='autoWhen' value="${arr.autoWhen}" placeholder="숫자만 작성"/>
					</p> 
				 </div>  
				       
               </div>
               
             
                
                
                	 
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
                 <span style="float : right; font-size: 15px;" ><a href="electric.do?yyyy=${arr.yyyy}&mm=${arr.mm}" > >> 이동</a></span>
                <c:choose>
           		<c:when test="${arr.suma eq null || arr.suma eq '0'}">
           			<table class='tb'>
           			<tbody>
           			<tr>
           				<th>상세 데이터가 없습니다</th>
           			</tr>
           			<tr>
					
					<c:choose>
						<c:when test="${arr.suma eq null || arr.suma eq '0'}">
						<c:set var='gSuma' value='${arr.elM}'/>
						</c:when>		
						<c:otherwise>
						<c:set var='gSuma' value='${arr.suma}'/>
						</c:otherwise>
					</c:choose>
					<th > 총 사용 금액 : <fmt:formatNumber value="${gSuma}" type="number"/>원 </th>
					</tr>
                	</tbody>
                	</table>
           		</c:when>
           		<c:otherwise>
                	
                	<table class='tb'>
                	<tbody>
					<tr>
						<th  class='boder-black'>기본료 </th>
						<th  class='boder-black'>전력량요금</th>
						<th  class='boder-black'>기후환경요금</th>
						<th  class='boder-black'>필수사용공제</th>
					</tr>
										
					<tr>
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.defM ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.defM}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name='defM' value="${arr.defM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name='defM' value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.lEm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.lEm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="lEm" value="${arr.lEm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="lEm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.woEm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.woEm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="woEm" value="${arr.woEm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="woEm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.miEm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.miEm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="miEm"  value="${arr.miEm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="miEm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
					</tr>
					
					<tr>
						<th  class='boder-black'>부가가치세</th>
						<th  class='boder-black'>전력 기금</th>
						<th  class='boder-black'>원단위 절사</th>
						<th  class='boder-black'>사용량</th>
					</tr>
					
					<tr>
					
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.aEm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.aEm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="aEm"  value="${arr.aEm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="aEm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.gyEm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.gyEm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="gyEm"  value="${arr.gyEm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="gyEm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.jsEm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.jsEm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="jsEm"  value="${arr.jsEm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="jsEm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.useE ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.useE}" type="number"/>kWh</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="useE"  value="${arr.useE}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="useE" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
					</tr>
					<tr>
					<th colspan="4"> 총 사용 금액 : <fmt:formatNumber value="${arr.suma}" type="number"/>원 </th>
					</tr>
                	</tbody>
                	</table>
                	</c:otherwise>
                	</c:choose>
					</form>
                		</c:forEach>
                		
                		
                	
                	<hr>
						<h4>수도</h4>
						
					<c:forEach var='arr' items='${waV}' varStatus="st">
						<c:set var='addWa' value='${arr.saM}'/>
                	 
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
                	 
                	 <div class="upForm" style="display: none;"> 
                	   <p>이번 달 사용요금 지출을 완료하였나요?
                <span><input type="radio" name='gChk'  <c:if test="${arr.gChk eq 'Y'}">checked="checked"</c:if> value="Y" >네</span>
                <span>
                <input type="radio" name='gChk'  <c:if test="${arr.gChk eq 'N'}">checked="checked"</c:if> value="N" >아니요
                	</span> 
                </p>	
                </div>
                	 
                	 
               <div class="upForm" style="display: none;">
                <p>자동이체로 납부하시나요?
                 <span>
                 <input type="radio" name='autoM' <c:if test="${arr.autoM eq 'Y'}">checked="checked"</c:if> value="Y" >네</span>
                <span>
                <input type="radio" name='autoM'  <c:if test="${arr.autoM eq 'N'}">checked="checked"</c:if> value="N" >아니요</span>
				       </p>       
				       
				  <!-- 디자인 좀 넣기 -->     
				 <div id='showAuto' style="display: none;">
					<p>어떤 방법으로 납부하시나요? 
					<input  style="width: 48%;" class='manageI' type="text" name='autoHow' value="${arr.autoHow}" placeholder="ex)기업은행,삼성카드.."/>
					</p>
					 
					<p>이체 날은 언제인가요? 
					<input  style="width: 20%;" class='manageI' type="text" name='autoWhen' value="${arr.autoWhen}" placeholder="숫자만 작성"/>
					</p> 
				 </div>  
				       
               </div>
               
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
                <span style="float : right; font-size: 15px;" ><a href="water.do?yyyy=${arr.yyyy}&mm=${arr.mm}" > >> 이동</a></span>
                   <c:choose>
           		<c:when test="${arr.suma eq null || arr.suma eq '0'}">
           			<table class='tb'>
           			<tbody>
           			<tr>
           				<th>상세 데이터가 없습니다</th>
           			</tr>
           			<tr>
					
					<c:choose>
						<c:when test="${arr.suma eq null || arr.suma eq '0'}">
						<c:set var='gSuma' value='${arr.wtM}'/>
						</c:when>		
						<c:otherwise>
						<c:set var='gSuma' value='${arr.suma}'/>
						</c:otherwise>
					</c:choose>
					<th > 총 사용 금액 : <fmt:formatNumber value="${gSuma}" type="number"/>원 </th>
					</tr>
                	</tbody>
                	</table>
           		</c:when>
           		<c:otherwise>
                	
                	<table class='tb'>
                	<tbody>
					<tr>
						<th  class='boder-black'>사용량 </th>
						<th  class='boder-black'>사용요금</th>
					</tr>
										
					<tr>
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.sa ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.sa}" type="number"/></span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name='sa' value="${arr.sa}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name='sa' value="0"/></span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when  test="${arr.saM ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.saM}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="saM" value="${arr.saM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="saM" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
					</tr>
					<tr>
					<th colspan="2"> 총 사용 금액 : <fmt:formatNumber value="${my:NVL(arr.suma,0)}" type="number"/>원 </th>
					</tr>
                	</tbody>
                	</table>
                	
                </c:otherwise>
                </c:choose>	
					</form>	
				</c:forEach>		
				
				
				
					<hr>
						<h4>인터넷</h4>
						
				<c:forEach var='arr' items='${itV}' varStatus="st">
						<c:set var='addIt' value='${arr.defM - arr.sIm - arr.gIm - arr.sGm + arr.aGm +arr.mGm}'/>
                	 
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
                	 
                	 <div class="upForm" style="display: none;"> 
                	   <p>이번 달 사용요금 지출을 완료하였나요?
                <span><input type="radio" name='gChk'  <c:if test="${arr.gChk eq 'Y'}">checked="checked"</c:if> value="Y" >네</span>
                <span>
                <input type="radio" name='gChk'  <c:if test="${arr.gChk eq 'N'}">checked="checked"</c:if> value="N" >아니요
                	</span> 
                </p>	
                </div>
                	 
                	 
               <div class="upForm" style="display: none;">
                <p>자동이체로 납부하시나요?
                 <span>
                 <input type="radio" name='autoM' <c:if test="${arr.autoM eq 'Y'}">checked="checked"</c:if> value="Y" >네</span>
                <span>
                <input type="radio" name='autoM'  <c:if test="${arr.autoM eq 'N'}">checked="checked"</c:if> value="N" >아니요</span>
				       </p>       
				       
				  <!-- 디자인 좀 넣기 -->     
				 <div id='showAuto' style="display: none;">
					<p>어떤 방법으로 납부하시나요? 
					<input  style="width: 48%;" class='manageI' type="text" name='autoHow' value="${arr.autoHow}" placeholder="ex)기업은행,삼성카드.."/>
					</p>
					 
					<p>이체 날은 언제인가요? 
					<input  style="width: 20%;" class='manageI' type="text" name='autoWhen' value="${arr.autoWhen}" placeholder="숫자만 작성"/>
					</p> 
				 </div>  
				       
               </div>
                	 
                	 
             
                	
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
                	<span style="float : right; font-size: 15px;" ><a href="it.do?yyyy=${arr.yyyy}&mm=${arr.mm}" > >> 이동</a></span>
                	 <c:choose>
           		<c:when test="${arr.suma eq null || arr.suma eq '0'}">
           			<table class='tb'>
           			<tbody>
           			<tr>
           				<th>상세 데이터가 없습니다</th>
           			</tr>
           			<tr>
					
					<c:choose>
						<c:when test="${arr.suma eq null || arr.suma eq '0'}">
						<c:set var='gSuma' value='${arr.itM}'/>
						</c:when>		
						<c:otherwise>
						<c:set var='gSuma' value='${arr.suma}'/>
						</c:otherwise>
					</c:choose>
					<th > 총 사용 금액 : <fmt:formatNumber value="${gSuma}" type="number"/>원 </th>
					</tr>
                	</tbody>
                	</table>
           		</c:when>
           		<c:otherwise>
                	
                	
                	<table class='tb'>
                	<tbody>
					<tr>
						<th  class='boder-black'>기본료 </th>
						<%--
						<th  class='boder-black'>약정할인</th>
						<th  class='boder-black'>결합할인</th>
						 --%>
						<th  class='boder-black'>할인금액</th>
						<th  class='boder-black'>부가세</th>
						<th  class='boder-black'>미납금</th>
					</tr>
										
					<tr>
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.defM ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.defM}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name='defM' value="${arr.defM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name='defM' value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.sGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.sGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="sGm"  value="${arr.sGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="sGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.aGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.aGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="aGm"  value="${arr.aGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="aGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.mGm ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.mGm}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="mGm"  value="${arr.mGm}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='nomalForm'>0원</span>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="mGm" value="0"/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
					</tr>
					
					
					<tr>
					<th colspan="6"> 총 사용 금액 : <fmt:formatNumber value="${arr.suma}" type="number"/>원 </th>
					</tr>
                	</tbody>
                	</table>
                	
                </c:otherwise>
                </c:choose>	
				</form>
                		</c:forEach>			
                		
               
               
               <hr>
			<h4>관리비</h4>
			
			
				<c:forEach var='arr' items='${maV}' varStatus="st">
					</c:forEach>
                	 
                	 <p class="nomalForm">
                	 <c:if test="${maV[0].gChk eq 'Y'}">
                	 이번 달 사용요금을 
                	 </c:if>
                	 
                	 <c:if test="${maV[0].gChk eq 'N'}">
                	 이번 달은 아직 사용요금을 납부하지 않았습니다
                	 </c:if>
                	 
                	 
                	 </p>
                	 
                	 <div class="upForm" style="display: none;"> 
                	   <p>이번 달 사용요금 지출을 완료하였나요?
                <span><input type="radio" name='gChk'  <c:if test="${maV[0].gChk eq 'Y'}">checked="checked"</c:if> value="Y" >네</span>
                <span>
                <input type="radio" name='gChk'  <c:if test="${maV[0].gChk eq 'N'}">checked="checked"</c:if> value="N" >아니요
                	</span> 
                </p>	
                </div>
                	 
                	 
                	
				
				
				<c:set var='mode' value='u'/>
				<%--<c:if test="${arr.gasM == null && arr.elM == null && arr.wtM == null && arr.itM == null}"> --%>
				<c:if test="${maV[0].idx == null}"> 
				<c:set var='mode' value='i'/>
				</c:if>
				
                <input type="hidden" value="${maV[0].idx}" name='idx' id='idx'/>
                <input type="hidden" value="${maV[0].jidx}" name='jidx' id='jidx'/>
                <input type="hidden" value="${mode}" name='mode' id='mode'/>
                <input type="hidden" value="${maV[0].yyyy}" name='yyyy' id='yyyy'/>
                <input type="hidden" value="${maV[0].mm}" name='mm' id='mm'/>
                <input type="hidden" value="${maV[0].uId}" name='uId' id='uId'/>
                <input type="hidden" value="${maV[0].gChk}" name='gChk' id='gChk'/>
                	<span style="float : right; font-size: 15px;" ><a href="manage.do?yyyy=${arr.yyyy}&mm=${arr.mm}" > >> 이동</a></span>
                 <c:choose>
           		<c:when test="${suma eq null || suma eq '0'}">
           			<table class='tb'>
           			<tbody>
           			<tr>
           				<th>상세 데이터가 없습니다</th>
           			</tr>
           			<tr>
					
					<c:choose>
						<c:when test="${suma eq null || suma eq '0'}">
						<c:set var='gSuma' value='${arr.maM}'/>
						</c:when>		
						<c:otherwise>
						<c:set var='gSuma' value='${arr.suma}'/>
						</c:otherwise>
					</c:choose>
					<th > 총 사용 금액 : <fmt:formatNumber value="${my:NVL(gSuma,0)}" type="number"/>원 </th>
					</tr>
                	</tbody>
                	</table>
           		</c:when>
           		<c:otherwise>	
                	
                	<table class='tb' id='table'>
                	<tbody>
					<tr>
						<th  class='boder-black upForm'  style="display: none;">선택</th>
						<th  class='boder-black'>항목명 </th>
						<th  class='boder-black'>사용금액</th>
					</tr>
					
					
						<c:forEach var='arr' items='${maV}' varStatus="st">						
					<tr>
						<th  class='boder-black upForm' style="display: none;">
						<span ><input type="checkbox" id="idx${st}" name="idxL2" value="${my:NVL(arr.idx,'0')}"/>
						<input type="hidden" name="idxL" value="${my:NVL(arr.idx,'0')}"/>
						</span>
						</th>
						
						<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.jiT ne null}">
						<span class='nomalForm'>${arr.jiT}</span>
						<span class='upForm' style="display: none;"><input  class='maageI' type="text" id="${st}" name='jiT' value="${arr.jiT}"/></span>
						</c:when>
						<c:otherwise>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name='jiT' value=""/></span>
						</c:otherwise>
						</c:choose>
						</th>
						
							<th  class='boder-black'>
						<c:choose>
						<c:when test="${arr.jiM ne null}">
						<span class='nomalForm'><fmt:formatNumber value="${arr.jiM}" type="number"/>원</span>
						<span class='upForm' style="display: none;"><input  class='manageI' type="text" name="jiM"  value="${arr.jiM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upForm'  style="display: none;"><input  class='manageI' type="text" name="jiM" value="">원</span>
						
						</c:otherwise>
						</c:choose>
						</th>
					</tr>	
					
					</c:forEach>
						
						<c:if test="${maV[0].jiM eq null && maV[0].jiT eq null}">
					<tr>
						<th class='boder-black nomalForm' id='noData' colspan="2" >데이터 없음</th>
						
						
					</tr>
						</c:if>
					
					<tr>
					<th  colspan="2">
					<span class='nomalForm'> 총 사용 금액 : <fmt:formatNumber value="${my:NVL(suma,0)}" type="number"/>원 </span>
					</th>
					</tr>
                	</tbody>
                	</table>
                	</c:otherwise>
                	</c:choose>
                
			 		

</div>
			
</div>
</div>
</div>
</div>
</div>
</section>

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