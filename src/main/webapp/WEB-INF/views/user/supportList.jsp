<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CDN 링크 -->

<style>
/* 사이드바 */
.sidenav {
	background-color: #f1f1f1;
	position: fixed;
	width: 200px;
	height: 100%;
	margin-left: -20px;
	margin-top: 50px
}

/* 본문 */
body {
	/* background-color: #f4f4f4; */
	margin: 0;
}

.job-listings {
	max-width: 1000px;
	margin: 0 auto;
	background-color: #fff;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #f4f4f4;
}

table th:nth-child(2),
table th:nth-child(5),
table th:nth-child(7) {
	width: 100px;
}
table th:nth-child(3),
table th:nth-child(4) {
	width: 200px;
}

a {
	color: #0073e6;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}
</style>

</head>
<body>

	<%@include file="/WEB-INF/views/include/pheader.jsp"%>

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
				class="list-group-item shadow">스크랩</a> <a
				href="/Users/Offered?user_id=${ sessionScope.plogin.user_id }"
				class="list-group-item shadow">면접 제의</a>
		</div>

		<!-- 페이지 내용 -->
		<div class=" mx-2 pb-4 w-100">
			<div class=" border border-tertiary p-5 rounded shadow">
				<div class="col-sm-9 page">
					<div class="d-flex justify-content-center">

						<div>
							<h4>회원님이 지원하신 기업입니다</h4>
							<table>
								<thead>
									<tr>
										<th>No</th>
										<th>기업명</th>
										<th>공고제목</th>
										<th>이력서</th>
										<th>근무지</th>
										<th>지원일자</th>

										<th>결과</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="item" items="${applyList}" varStatus="status">
										<tr>
											<td>${status.index + 1 }</td>
											<td>${item.com_name }</td>
											<td><a href="/Post/View?po_num=${ item.po_num }&user_id=${ sessionScope.plogin.user_id }">${item.po_title }</a></td>
											<td><a href="/Users/ResumeView?re_num=${item.re_num}&user_id=${ sessionScope.plogin.user_id }">${item.re_title }</a></td>
											<td>${item.region }</td>
											<td>${item.ap_date }</td>

											<td><c:choose>
													<c:when test="${item.result == 0}">
														<button type="button" class="btn btn-secondary">대기</button>
													</c:when>
													<c:when test="${item.result == 1}">
														<button type="button" class="btn btn-danger">불합격</button>
													</c:when>
													<c:when test="${item.result == 2}">
														<button type="button" class="btn btn-info">합격</button>
													</c:when>
												</c:choose></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>
