<%@ page isELIgnored="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<!-- 부트스트랩 CDN 링크 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>

.page {
	margin: 0;
}
.btn {
	padding: 15px;
	cursor: pointer;
	margin: 20px;
	width: 80px;
}

.flex-container {
	display: flex;
	padding: 20px;
}

.hidden {
	display: none;
}

table {
	width: 110%;
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
table th:nth-child(4) {
	width: 200px;
}

#longLoc {
	width: 250px;
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

		<!-- 페이지 내용 -->
		<div class=" mx-2 pb-4 w-100">
			<div class=" border border-tertiary p-5 rounded shadow">
				<div class="col-sm-9 page">
					<div class="d-flex justify-content-center">

						<form>
							<div class="tab-content">
								<h4>면접 제안한 이력서 목록</h4>

								<table>
									<thead>
										<tr>
											<th>No</th>
											<th>인재명</th>
											<th id="longLoc">이력서제목</th>
											<th>면접 제안 일자</th>
											<th>결과</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${offerList}" varStatus="status">
											<tr>
												<td>${ status.index + 1 }</td>
												<td>${item.user_name }</td>
												<td><a
													href="/Resume/View?re_num=${ item.re_num }&com_id=${ sessionScope.clogin.com_id }">${item.re_title }</a></td>
												<td>${item.of_date }</td>
												<td>
												  <c:choose>
													<c:when test="${item.result == 0}">
														<button type="button" class="btn btn-secondary">대기</button>
													</c:when>
													<c:when test="${item.result == 1}">
														<button type="button" class="btn btn-danger">거절</button>
													</c:when>
													<c:when test="${item.result == 2}">
														<button type="button" class="btn btn-info">수락</button>
													</c:when>
												</c:choose>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>

							</div>
						</form>

					</div>
				</div>
			</div>
		</div>

		<script>
		
		</script>
</body>
</html>