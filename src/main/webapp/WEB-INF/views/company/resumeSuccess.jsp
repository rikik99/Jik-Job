<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<style>
.success-image {
	max-width: 450px;
    height: auto;
    margin-top: 20px;
    margin-right: 100px;
    border-radius: 10px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
}
.contextDiv {
	margin-left: 100px;
}
</style>
</head>

<body>

	<%@include file="/WEB-INF/views/include/cheader.jsp"%>

	<!-- 사이드 바 -->
	<div class="container d-flex">
		<div class="list-group mx-2">
			<a href="/Company/CInfo?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item   shadow" style="width: 150px;">회사정보</a> <a
				href="/Company/PostForm?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item hs_list_effect shadow">공고관리</a> <a
				href="/Company/SupportedList?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item shadow">받은 이력서 관리</a> <a
				href="/Company/ComBookmarkList?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item shadow">스크랩</a> <a
				href="/Company/COffer?com_id=${ sessionScope.clogin.com_id }"
				class="list-group-item shadow">면접 제안 목록</a>
		</div>
		<div class="container">
			<div
				class="border border-tertiary p-5 rounded shadow d-flex justify-content-between align-items-center">
				<div class="contextDiv">
					<h1>Success</h1>
					<p>면접제의에 성공하였습니다.</p>
					<div>
						<a href="/Resume/List?com_id=${ sessionScope.clogin.com_id }">목록으로</a>
					</div>
				</div>
				<div>
					<img src="/img/resumeSuccess_img.jpg" alt="Success Image"
						class="success-image">
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>