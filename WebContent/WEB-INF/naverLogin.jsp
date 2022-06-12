<!doctype html>
<html lang="ko">
<head>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
  var naver_id_login = new naver_id_login("Kzf9UQfKGWWgFdWcX5Gq", "http://localhost:8080/homeAdmin2/naverLogin");
  // 접근 토큰 값 출력
 // alert(naver_id_login.oauthParams.access_token);
  // 네이버 사용자 프로필 조회
  naver_id_login.get_naver_userprofile("naverSignInCallback()");
  // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
  function naverSignInCallback() {
    alert(naver_id_login.getProfileData('email') + "/" + naver_id_login.getProfileData('nickname'));
    alert(naver_id_login.getProfileData('age') + "/" + naver_id_login.getProfileData('name'));
    
	$.ajax({
		type : "post",
		dataType : "text", 
		url : "login.do",
		data : {
			id: naver_id_login.getProfileData('id'),
			nNm : naver_id_login.getProfileData('nickname'),
			snsInfo : "naver",
			email : naver_id_login.getProfileData('email'),
			nm : naver_id_login.getProfileData('name'),
			sex : naver_id_login.getProfileData('sex')		
		},
		success : function(result){
			location.href = '${contextPath}';
		},
		error : function(result){
			errMsg(result);
		}
	});
    
  }
</script>
</body>
</html>