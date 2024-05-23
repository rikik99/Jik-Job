<%@include file="/WEB-INF/views/include/cheader.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jik Job</title>
<style>
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

a {
	color: #0073e6;
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.bookmarkBtn {
	border: none;
	cursor: pointer;
}

.bookmarkBtn:hover {
	background-color: #005bb5;
}
</style>
</head>
<body>
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

						<div>
							<table>
								<thead>
									<tr>
										<th>No.</th>
										<th>구직자명</th>
										<th>이력서제목</th>
										<th>경력</th>
										<th>북마크</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${resumeBookList}" var="resumeBookList" varStatus="status">
										<tr>
											<td>${ status.index + 1 }</td>
											<td>${resumeBookList.user_name}</td>
											<td><a
												href="/Resume/View?re_num=${resumeBookList.re_num}&com_id=${sessionScope.clogin.com_id}">
													${resumeBookList.re_title} </a></td>
											<td>${resumeBookList.user_car}</td>
											<td>
												<div class="scrapBtn"
													 data-com-id="${ sessionScope.clogin.com_id }"
													 data-re-num="${ resumeBookList.re_num }">
													<button class="bookmarkBtn">
													<!-- <img src="/img/filled_bookmarks.png" class="mb-2 border border-tertiary"
													     id="bookmarkImg" style="width: 30px; height: 30px;"> -->
													<img src="/img/filled_bookmarks.png" class="mb-2 border border-tertiary bookmarkImg"
													     style="width: 30px; height: 30px;">
													</button>
													<input type="hidden" id="re_num" value="${ resumeBookList.re_num }" />
												</div>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					<input type="hidden" id="com_id" value="${ sessionScope.clogin.com_id }" />
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>

	$(document).ready(function() {
	
	function loadComBookInfo(com_id, re_num) {
		
		$.ajax( {
			type : 'GET',
			url  : '/checkComBook',
			data : {
				com_id : com_id,
				re_num : re_num
			},
			success : function(data) {
				console.log(data);
			},
			error : function(xhr, status, error) {
				console.error(error);
			}
		});
		
	}
	
	$('.scrapBtn').each(function() {
        const $this = $(this);
        const com_id = $this.data('com-id');
        const re_num = parseInt($this.data('re-num'), 10);

        loadComBookInfo(com_id, re_num);
    });

	$('.bookmarkImg').click(function() {

		const $this = $(this);
		const divEl = $this.closest('.scrapBtn');
		const com_id = divEl.data('com-id');
        const re_num = parseInt(divEl.data('re-num'), 10);
        console.log('com_id: ' + com_id);
        console.log('re_num: ' + re_num);
		
        $.ajax({
            type: 'POST',
            url: '/removeComBook',
            contentType: 'application/json',
            data: JSON.stringify({
            	com_id: com_id,
            	re_num: re_num
            }),
            success: function(data) {
                alert('스크랩 해제되었습니다');
                loadComBookInfo(com_id, re_num);
                location.reload(); // 페이지 새로고침
            },
            error: function(xhr, status, error) {
                console.error(error);
            }
        });
    });
  });
	
</script>

</html>