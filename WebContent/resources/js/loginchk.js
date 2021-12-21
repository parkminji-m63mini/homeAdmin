$(document).ready(function() {
	if('${sessionScope.ssID}' == null || '${sessionScope.ssID}' == ""){
		alert('로그인 후 이용 가능합니다.');
		location.href ='${contextPath}/my/login.do';
	}

});