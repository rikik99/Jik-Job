<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				class="list-group-item shadow">스크랩</a>
		</div>
		<!-- 페이지 내용 -->
		<div class=" mx-2 pb-4 w-100">
			<div class="border border-tertiary  p-5 rounded shadow">
				<h1 class="mb-4">등록한 공고</h1>
				<hr>
				<div class="jh_resume mt-5">
					<button class="jh_resume_button mb-5 rounded  jm_card"
						onclick="location.href=`/Company/PostMake?com_id=${ sessionScope.clogin.com_id}`">
						➕ 새로운 공고 등록</button>

					<c:forEach items="${postList}" var="Po">
						<div class="jh_resume_content mb-3"
							style="display: flex; justify-content: space-between">

							<div class="postList_st" style="">
								<a
									href="/Post/View?po_num=${Po.po_num}&com_id=${ sessionScope.clogin.com_id }">
									${Po.po_title} </a>
							</div>
							<form
								action="/Resume/Recommend?re_num=${ re_num }&com_id=${ sessionScope.clogin.com_id }"
								method="POST">
								<div style="display: flex;">
									<button type="submit" class="btn btn-dark">공고 선택</button>
									<input type="hidden" name="re_title" value="${ vo.re_title }">
									<input type="hidden" name="po_title" value="${ Po.po_title }">
									<input type="hidden" name="po_num" value="${ Po.po_num }">
								</div>
							</form>

						</div>
					</c:forEach>

					<input type="hidden" value="${size}" id="postSize" />
				</div>
			</div>
		</div>
	</div>


</body>
</html>