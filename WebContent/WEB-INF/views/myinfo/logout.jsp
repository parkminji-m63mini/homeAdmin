<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <script type="text/javascript">
 $(document).ready(function() {
	 alert("실행");
		  <%
	  session.removeAttribute("ssID");
	  session.removeAttribute("ssNM");
	  session.removeAttribute("ssnNM");
	  session.removeAttribute("ssGB");
	  session.removeAttribute("ssIP");
	  %>
	
  });
  </script>
</body>
</html>