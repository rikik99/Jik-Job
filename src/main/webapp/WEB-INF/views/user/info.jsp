<%@include file="/WEB-INF/views/include/pheader.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<style>
	#notification-icon {
		color: red;
	}
</style>
</head>
<body>
	<!-- 사이드 바 -->
	<div class="container d-flex">
		<div class="list-group mx-2">
			<a href="/Users/Info?user_id=${ sessionScope.plogin.user_id }"
				class="list-group-item   shadow" style="width: 150px;">개인정보</a> <a
				href="/Users/ResumeForm?user_id=${ sessionScope.plogin.user_id }"
				class="list-group-item hs_list_effect shadow">이력서 관리</a> <a
				href="/Users/ApplyList?user_id=${ sessionScope.plogin.user_id }"
				class="list-group-item shadow">입사지원 관리</a> <a 
				href="/Users/BookmarkList?user_id=${ sessionScope.plogin.user_id }"
				class="list-group-item shadow">스크랩</a>
				
			<a href="/Users/Offered?user_id=${ sessionScope.plogin.user_id }" id="read" 
			   class="list-group-item shadow">면접 제의&nbsp;&nbsp;<span id="notification-icon"></span>
			</a>       
			</div> 	
		<!-- 페이지 내용 -->
		<div class=" mx-2 pb-4 w-100">
			<div class=" border border-tertiary p-5 rounded shadow">
				<div class="col-sm-9 page">
					<div class="d-flex justify-content-center">
						<img src="/img/face1.png"" id="imagePreview"
							class="mb-2 border border-tertiary"
							style="width: 150px; height: 150px;">
						<form>
							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">이름</span>
								<input type="text" class="form-control" value="${vo.user_name }"
									readonly>
							</div>

							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">아이디</span>
								<input type="text" class="form-control"
									value="${ sessionScope.plogin.user_id }"  id= "userId" readonly>
							</div>
							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">전화번호</span>
								<input type="email" class="form-control"
									value="${vo.user_tell }" readonly>
							</div>
							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">주소</span>
								<input type="email" class="form-control" value="${vo.user_adr }"
									readonly>
							</div>
							<div class="input-group mb-3">
								<span
									class="input-group-text justify-content-center hs_span_size init_color hs_span">생년월일</span>
								<input type="email" class="form-control"
									value="${vo.user_birth }" readonly>
							</div>
                        <!-- 수정하기와 회원탈퇴 버튼을 담을 div -->
                        <div class="d-flex justify-content-between">
                            <!-- 수정하기 버튼 -->
                            <button type="button" class="btn btn-dark" style="width: 100px; height: 40px; margin-right: 10px;"
                                    onclick="location.href='/Users/Infoedit?user_id=${ sessionScope.plogin.user_id }'">수정하기
                            </button>
                            </form>
                            <!-- 회원탈퇴 버튼 -->
                            <form action="/Users/InfoDelete?user_id=${ sessionScope.plogin.user_id }" id="deleteUserBtn" method="POST">
                                <button type="submit" class="btn btn-dark" style="width: 100px; height: 40px;">회원탈퇴</button>
					</form>
						<!-- 회원탈퇴 페이지 만들고 연결 -->
					</div>
				</div>
			</div>
		</div>
	</div>

</body>

  <script>
   document.getElementById('deleteUserBtn').addEventListener('click', function() {
	    var result = confirm('정말로 탈퇴하시겠습니까?');
	    if (result) {
	        // 사용자가 "확인"을 눌렀을 때 실행될 코드
	        // 여기서 AJAX 요청을 포함하여 탈퇴 처리를 할 수 있습니다.
	        // 예시에서는 단순히 홈으로 리다이렉션하는 것으로 보여드리겠습니다.
	        window.location.href = '/';
	    }
	});
  </script>

  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script>
	
		const user_id = $('#userId').val();
		console.log(user_id);
	
        $(document).ready(function() {
            function checkNotifications() {
                $.ajax({
                    url: '/notifications/hasUnread',
                    type: 'GET',
                    data: { 
                    	user_id: user_id
                    },
                    success: function(response) {
                    	
                    	console.log(response)
                    	
                        if (response != 0) {
                            $('#notification-icon').text('new');
                        } else {
                            $('#notification-icon').text('');
                        }
                    	
                    }
                });
            }

            // 페이지 로드 시 알림 확인
            checkNotifications();

            // 주기적으로 알림 확인 (예: 1분마다)
            setInterval(checkNotifications, 60000);
        });
  </script>
</html>