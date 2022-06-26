<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/taglibs.jsp"%>
<!DOCTYPE html>
<html lang="kn">

<head>
 
<title>sns로그인</title>
</head>

<!-- ------------------------- header ---------------------------- -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"/>
  <script src="${contextPath}/resources/js/common.js"></script>

<body>

<section id="breadcrumbs" class="breadcrumbs">
      <div class="container">


      </div>
    </section><!-- End Breadcrumbs -->
      <div class="container">

        <div class="row  justify-content-center">
          <div class="col-lg-6">

            <div class="form" style="  text-align: center;margin-top: 50%;">
            
      <!-- 아래와같이 아이디를 꼭 써준다. -->
      <img class='snsBtn' src="${contextPath}/resources/img/icon/login/naver_nomal.png" id="naverIdLogin_loginButton" >
      <a href="javascript:void(0)"  onclick="naverLogout(); return false;">
          <span style="display: none;">네이버 로그아웃</span>
      </a>
        
     	
     	<div>
       <img   class='snsBtn'  src="${contextPath}/resources/img/icon/login/kakao_nomal.png" onclick="kakaoLogin();" >
      <a href="javascript:void(0)" onclick="kakaoLogout();">
          <span style="display: none;">카카오 로그아웃</span>
      </a>
     	</div>
     	
     	
     	<a href="${contextPath}/my/login.do">관리자 로그인</a>
     	
 		
            </div>

          </div>

        </div>
 
      </div>



<!-- 네이버 스크립트 -->
<script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script>
<!-- 카카오 스크립트 -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script>


var naverLogin = new naver.LoginWithNaverId(
		{
			clientId: "Kzf9UQfKGWWgFdWcX5Gq", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
			callbackUrl: "http://localhost:8080/homeAdmin2/naverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
			isPopup: false,
			callbackHandle: true
		}
	);	

naverLogin.init();

window.addEventListener('load', function () {
	naverLogin.getLoginStatus(function (status) {
		if (status) {
			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
			console.log(naverLogin.user); 
    		
            if( email == undefined || email == null) {
				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
				naverLogin.reprompt();
				return;
			}
		} else {
			console.log("callback 처리에 실패하였습니다.");
		}
	});
});


var testPopUp;
function openPopUp() {
    testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
}
function closePopUp(){
    testPopUp.close();
}

function naverLogout() {
	openPopUp();
	setTimeout(function() {
		closePopUp();
		}, 1000);
	
	
}


//-------------------카카오 시작

Kakao.init('75b3a7134c6fdf6ad845153c639a8c21'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
        	  console.log(response.id)
        	  console.log(response.kakao_account.email)
        	  console.log(response.kakao_account.profile.nickname)
        	  console.log(response.kakao_account.profile.profile_image_url)
        	  console.log(response.kakao_account.gender)
        	  console.log(response.kakao_account.birthday)
        	  
        	  var id = response.id;
        	  var email = response.kakao_account.email;
        	  var nNm = response.kakao_account.profile.nickname;
        	  var profile = response.kakao_account.profile.profile_image_url;
        	  var sex = response.kakao_account.gender;
        	  var birth = response.kakao_account.birthday;
        	  
        	  if(sex == "female"){
        		  sex = "2";
        	  }else if(sex == "male"){
        		  sex = "1";
        	  }else{
        		 sex = "3";
        	  }
        	  
        	location.href ="kakaoLogin?id=" + id + "&email=" + email + "&nNm=" + nNm + "&profile=" + profile + "&sex=" + sex + "&birth=" + birth;
        	  // 여기부터
        	  
        	  // 아이디 비교하고 있으면 로그인(메인으로)
        	  // 없으면 생성하고 메인으로
        	  
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }  
  
  //------------------ 카카오 종료

</script>


</body>
</html>