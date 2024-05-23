<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
  <div id="root"></div>
</body>
<script
		src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
		integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx"
		crossorigin="anonymous"
	></script>
	<script>
		Kakao.init("c7638f5d68eee14e243fc85c169422ca"); // 사용하려는 앱의 JavaScript 키 입력
	</script>
	<script>
		function chatChannel() {
			Kakao.Channel.chat({
				channelPublicId: "2팀 프로젝트 테스트", // 채널 아이디 입력
			});
		}
	</script>
</html>