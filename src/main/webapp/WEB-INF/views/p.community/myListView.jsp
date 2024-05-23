<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 내용 조회</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
table {
	width: 100%;
	margin-top: 20px;
	font-size: 15px;
	background-color: #f8f9fa;
}

table th, table td {
	padding: 10px;
	border: 1px solid #ddd;
}

table tr:nth-child(even) {
	background-color: #f2f2f2;
}

.title {
	padding: 150px;
}

#comment-section {
	width: 80%;
	margin-left: 1px;
}

#comments-new {
	width: 40%;
	margin-left: 1px;
}

.comment-table {
	width: 100%;
	border-collapse: collapse;
}

.comment-table th, .comment-table td {
	border: 1px solid #ddd;
	padding: 8px;
}

.comment-table tr:nth-child(even) {
	background-color: #f2f2f2;
}

.comment-table th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #B4E5FF;
}
</style>

</head>
<body>
	<main>
		<%@include file="/WEB-INF/views/include/pheader.jsp"%>


		<div class="container mt-4">
			<div class="header-container mb-3">
				<h2 class="fw-bold">게시글 내용 조회</h2>
			</div>
			<table class="table table-bordered">
				<tr>
					<td class="fw-bold" style="background-color: #B4E5FF;">글번호</td>
					<td>${ vo.ucomu_bno }</td>
					<td class="fw-bold" style="background-color: #B4E5FF;">조회수</td>
					<td>${ vo.ucomu_hit }</td>
				</tr>
				<tr>
					<td class="fw-bold" style="background-color: #B4E5FF;">작성자</td>
					<td>${ vo.user_id }</td>
					<td class="fw-bold" style="background-color: #B4E5FF;">작성일</td>
					<td>${ vo.ucomu_date }</td>
				</tr>
				<tr>
					<td class="fw-bold" style="background-color: #B4E5FF;">제목</td>
					<td colspan="3">${ vo.ucomu_title }</td>
				</tr>
				<tr>
					<td class="fw-bold"
						style="background-color: #B4E5FF; height: 200px;">내용</td>
					<td colspan="3">${ vo.ucomu_content }</td>
				</tr>
				<tr>

				</tr>
				<tr>
					<td colspan="4">
						<div style="display: flex; align-items: center;">
							<a class="btn btn-primary btn-sm"
								href="/CommunityUsers/WriteForm?user_id=${ sessionScope.plogin.user_id }">새
								글 추가</a>&nbsp;&nbsp; <a class="btn btn-warning btn-sm"
								href="/CommunityUsers/UpdateForm?ucomu_bno=${ vo.ucomu_bno }&user_id=${ sessionScope.plogin.user_id }">수정</a>&nbsp;&nbsp;
							<a class="btn btn-danger btn-sm" onclick="confirmDelete(this)"
								data-ccomu-bno="${ vo.ucomu_bno }"
								data-com-id="${ sessionScope.plogin.user_id }">삭제</a>&nbsp;&nbsp;
							<a class="btn btn-info btn-sm" href="javascript:history.back()">이전으로</a>&nbsp;&nbsp;
						</div>
					</td>
				</tr>
			</table>
		</div>




		<!-- 댓글 뷰 화면 추가 -->
		<div class="container mt-4">
			<!-- 댓글 목록 보기 -->
			<div id="comment-section">
				<h3 class="fw-bold">댓글 목록</h3>
				<table class="comment-table">
					<thead>
						<tr>
							<th>아이디</th>
							<th>댓글 내용</th>
							<th>좋아요</th>
						</tr>
					</thead>
					<tbody>


						<c:forEach items="${commentList}" var="commentList">
							<tr>
								<td>${commentList.user_id}</td>
								<td>${commentList.ucomm_body}</td>
								<td>
									<div style="display: flex; align-items: center;">
										<div class="comment thumb-icon"
											id="thumb-icon-${ commentList.ucomm_id}"
											data-comment-id="${commentList.ucomm_id}">
										<img src="/img/full-like.png" alt="thumb icon">	
										</div>
										<span style="font-size: 20px; margin-left: 8px;">${commentList.ucomu_good}</span>
									</div>
								</td>

							</tr>
							<div></div>


						</c:forEach>


					</tbody>
				</table>
			</div>
		</div>

	</main>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>

	 <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
   <script>
   
     const commentCreateBtnEl = document.getElementById('comment-create-btn');
     
     commentCreateBtnEl.addEventListener('click', ()=> {
        
        let ccomu_bno = parseInt(document.querySelector('#new-comment-id').value); // ccomu_bno 값을 정수로 변환
        let url = 'http://localhost:9090/Api/Comment/${vo.ccomu_bno}/commentCreate';
        
    // js 객체
      const comment = {
          // 새 댓글의 nick name
          com_id   : document.querySelector('#new-comment-nickname').value,
          // 새글의 본문
          ccomm_body       : document.querySelector('#new-comment-body').value,
          // 부모 게시글의 id
          ccomu_bno  : ccomu_bno // 정수로 변환된 ccomu_bno 값 사용
      };
    
      const params = {
          method  : 'POST',
          headers : {"Content-Type":"application/json" },
          body    : JSON.stringify( comment )   
      };
    
        fetch(url, params)
              .then(response => response.json()) // 응답 데이터를 JSON 으로 변환
              .then(data => {
                  if(data) {
                        alert("댓글이 등록되었습니다");
                        window.location.reload(); // 성공한 경우 페이지 새로고침
                  } else {
                       alert("댓글 등록 실패!");
                  }
              }) 
            .catch(error => {
                  console.error('댓글 등록 에러:', error);
                  alert("댓글 등록 중 오류가 발생했습니다.");         
            })
     });
     
     //-----------------------------------------------------------------------------------------------------
});
  </script>

</body>
</html>

</body>
</html>
