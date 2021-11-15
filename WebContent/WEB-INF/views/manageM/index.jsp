<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="kn">

<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
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
					frm.method = 'post';
					frm.submit();
					
					
					$(".nomalFrom").css("display", "inline");
					$(".upFrom").css("display", "none");
					$("#upbtn").val("수정");
					
					reload();
					window.location.href;
			 form 액션 종료 */
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
          <li>전체</li>
        </ol>
        <h2>전체</h2>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Portfolio Details Section ======= -->
    <section id="portfolio-details" class="portfolio-details">
      <div class="container">

        <div class="row gy-4">

          <div class="col-lg-8">
            <div class="portfolio-info">
              <div class="swiper-wrapper align-items-center">

                <div class="swiper-slide">
                	<c:forEach var='arr' items='${arrList}' varStatus="st">
                	 <h3>${arr.yyyy}년도 ${arr.mm}월 공과금</h3>
				<form name="frmReg${st.index}" method="post">
				
				
				<c:set var='mode' value='u'/>
				<c:if test="${arr.gasM == null && arr.elM == null && arr.wtM == null && arr.itM == null}">
				<c:set var='mode' value='i'/>
				</c:if>
				
                <input type="hidden" value="${mode}" name='mode'/>
                <input type="hidden" value="${arr.yyyy}" name='yyyy'/>
                <input type="hidden" value="${arr.mm}" name='mm'/>
                <input type="hidden" value="${arr.uId}" name='uId'/>
                	<table class='tb'>
                	<tbody>
					<tr>
						<th>가스비</th>
						<th>전기세</th>
						<th>수도세</th>
						<th>인터넷</th>
					</tr>
					<tr>
						<th>
						<c:choose>
						<c:when test="${arr.gasM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.gasM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name='gasM' value="${arr.gasM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name='gasM' value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th>
						<c:choose>
						<c:when  test="${arr.elM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.elM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="elM" value="${arr.elM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="elM" value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th>
						<c:choose>
						<c:when  test="${arr.wtM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.wtM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="wtM" value="${arr.wtM}""/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="wtM" value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
						
						<th>
						<c:choose>
						<c:when test="${arr.itM ne null}">
						<span class='nomalFrom'><fmt:formatNumber value="${arr.itM}" type="number"/>원</span>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="itM"  value="${arr.itM}"/>원</span>
						</c:when>
						<c:otherwise>
						<span class='upFrom' style="display: none;"><input  class='manageI' type="text" name="itM" value=""/>원</span>
						</c:otherwise>
						</c:choose>
						</th>
					</tr>
                	</tbody>
                	</table>
                		<input id='upbtn' class='btn_brown' type="button" onclick="up(${st.index});" value="수정"/> 
                		<input class='btn_brown' type="button" onclick="reload();" value="수정"/> 
</form>
<iframe id="frmSys" name="frmSys" allowTransparency="true" width="0" height="0" scrolling="no" frameborder="0"></iframe>
                		</c:forEach>
                		
                </div>
              </div>
              <div class="swiper-pagination">
              호ㅗㅗㅗㅗ?
              </div>
            </div>
          </div>

          <div class="col-lg-4">
            <div class="portfolio-info">
              <h3>Project information</h3>
              <ul>
                <li><strong>Category</strong>: Web design</li>
                <li><strong>Client</strong>: ASU Company</li>
                <li><strong>Project date</strong>: 01 March, 2020</li>
                <li><strong>Project URL</strong>: <a href="#">www.example.com</a></li>
              </ul>
            </div>
            <div class="portfolio-description">
              <h2>This is an example of portfolio detail</h2>
              <p>
                Autem ipsum nam porro corporis rerum. Quis eos dolorem eos itaque inventore commodi labore quia quia. Exercitationem repudiandae officiis neque suscipit non officia eaque itaque enim. Voluptatem officia accusantium nesciunt est omnis tempora consectetur dignissimos. Sequi nulla at esse enim cum deserunt eius.
              </p>
            </div>
          </div>

        </div>

      </div>
    </section><!-- End Portfolio Details Section -->

  </main><!-- End #main -->

</body>
</html>