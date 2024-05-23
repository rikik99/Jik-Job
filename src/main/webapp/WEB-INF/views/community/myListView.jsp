<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 내용 조회</title>

<style>
body {
	padding: 20px;
	margin: 0 auto;
	width: 80%;
	height: 300vh;
}

.container {
	max-width: 1200px;
	margin: auto;
}

h2 {
	margin: 0 auto;
}

table {
	width: 100%;
	margin-top: 20px;
	font-size: 13px;
	border-collapse: collapse;
}

table th, table td {
	text-align: center;
	padding: 10px;
	border: 1px solid #ddd;
}

table th {
	background-color: #f8f9fa;
}

table tr:nth-child(even) {
	background-color: #f2f2f2;
}

.table-actions {
	text-align: center;
	padding: 10px;
	border: none;
}

.header-container {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.title {
	padding: 150px;
}

input:not(input[type=submit]) {
	width: 100%;
}

input[type=submit] {
	width: 100px;
}

#goList {
	width: 80px;
}

main {
	min-height: 100vh;
}

td {
	padding: 10px;
	text-align: center;
}

td:nth-of-type(1) {
	width: 200px;
	background: blue;
	color: white;
	font-weight: bold;
}

input[readonly] {
	background: #EEE;
}

#table {
	margin: 0 auto;
	width: 80%;
	margin-bottom: 20px;
}

#table td {
	text-align: center;
	padding: 10px;
}

#table td:nth-of-type(1) {
	width: 100px;
	background-color: #B4E5FF;
	color: black;
}

#table td:nth-of-type(2) {
	width: 200px;
}

#table td:nth-of-type(3) {
	width: 150px;
	background-color: #B4E5FF;
	color: black;
}

#table td:nth-of-type(4) {
	width: 250px;
}

#table tr:nth-of-type(3) td:nth-of-type(2) {
	text-align: left;
}

#table tr:nth-of-type(4) td[colspan] {
	height: 250px;
	text-align: left;
	vertical-align: baseline;
}

#table tr:last-child td {
	background-color: white;
	color: black;
}

textarea {
	height: 150px;
	width: 100%;
}

#comments .card {
	margin-bottom: 10px;
}

.thumb-icon {
	font-size: 10px;
}

.content {
	margin: 20px;
}

#comments-list {
	margin: 0 auto;
	width: 80%;
}
/* ------------- */

</style>
</head>
<body>
	<main>
		<%@include file="/WEB-INF/views/include/cheader.jsp"%>
		<div class="container">
			<div class="header-container">

				<h2>게시글 내용 조회</h2>
			</div>
			<div>
				<table id="table">

					<tr>
						<td>글번호</td>
						<td>${ vo.ccomu_bno }</td>
						<td>조회수</td>
						<td>${ vo.ccomu_hit }</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td>${ vo.com_id }</td>
						<td>작성일</td>
						<td>${ vo.ccomu_date }</td>
					</tr>
					<tr>
						<td>제목</td>
						<td colspan="3">${ vo.ccomu_title }</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="3">${ vo.ccomu_content }</td>
					</tr>
					<tr>
						<td colspan="4"><a class="btn btn-primary btn-sm"
							href="/Community/WriteForm?com_id=${ sessionScope.clogin.com_id }">새
								글 추가</a>&nbsp;&nbsp; <a class="btn btn-warning btn-sm"
							href="/Community/UpdateForm?ccomu_bno=${ vo.ccomu_bno }&com_id=${ sessionScope.clogin.com_id }">수정</a>&nbsp;&nbsp;
							<a class="btn btn-danger btn-sm" onclick="confirmDelete(this)"
							data-ccomu-bno="${ vo.ccomu_bno }"
							data-com-id="${ sessionScope.clogin.com_id }">삭제</a>&nbsp;&nbsp;
							<a class="btn btn-info btn-sm" href="javascript:history.back()">이전으로</a>&nbsp;&nbsp;
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- 댓글 뷰 화면 추가 -->
		<div id="comments">
			<!-- 댓글 목록 보기 -->
			<div id="comments-list">
				<c:forEach items="${commentList}" var="commentList">
					<div class="card m-2" id="comments-${commentList.ccomu_bno}">
						<div class="card-header">
							${commentList.com_id} &nbsp;&nbsp;&nbsp;
							<button type="button"
								class="btn btn-sm btn-outline-danger comment-delete-btn">삭제</button>
						</div>
						<div class="card-body" style="display: flex;">
							<div style="font-size: 20px;">${commentList.ccomm_body}</div>
							<div class="comment">
								<img src="thumb-icon.png" class="thumb-icon"
									data-comment-id="${commentList.ccomm_id}" alt="Thumb Icon">
								<span style="font-size: 20px;">${commentList.ccomu_good}</span>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<!-- 새 댓글 작성하기 -->
			<div class="container" style="width: 82%;">
				<div class="card m-2" id="comments-new">
<!-- 					<div class="card-body"> -->
					<form action="/Comment/{ccomu_bno}/comments" method="POST">
						<input type="hidden" name="ccomu_bno" value="${vo.ccomu_bno}"
							id="new-comment-id" />
						<div class="mb-3" style="margin: 10px;">
							<label class="form-label">아이디</label> <label> <input
								type="text" class="form-control" id="new-comment-nickname"
								value="${ sessionScope.clogin.com_id }" readonly />
							</label>
						</div>
						<div class="mb-3" style="margin: 10px;">
							<label class="form-label">댓글 내용</label> <label> <textarea
									type="text" class="form-control" rows="3" id="new-comment-body"></textarea>
							</label>
							<button type="button" class="btn btn-primary" style="margin: 10px;"
								id="comment-create-btn">댓글 작성</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
	<%@include file="/WEB-INF/views/include/footer.jsp"%>

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
  	
   	document.addEventListener('DOMContentLoaded', () => {
  	    document.querySelectorAll('.thumb-icon').forEach(thumbIcon => {
  	        thumbIcon.addEventListener('click', function() {
  	            // data-comment-id 속성에서 값을 가져와 정수로 변환
  	            let ccomm_id = parseInt(this.getAttribute('data-comment-id'));
  	         	  let ccomu_bno = ${vo.ccomu_bno};
  	         	  const com_id = $('#new-comment-nickname').val();
  	            console.log(ccomm_id)
  	            console.log(ccomu_bno)
  	            console.log(com_id)
  	            
  	            // URL을 생성                     
  	            let url = 'http://localhost:9090/Api/Comment/${vo.ccomu_bno}/' + ccomm_id +'/commentLike';
  	           
  	            const params = {
  	                method: 'POST',
  	                headers: { "Content-Type": "application/json" },
  	                body: JSON.stringify({
  	                	ccomm_id: ccomm_id,
  	                	ccomu_bno: ccomu_bno,
  	                	com_id: com_id
  	                }) // 요청 본문이 필요 없으므로 빈 객체
  	            };
  	            
		  	          fetch(url, params)
		              .then(response => {
		                  if (!response.ok) {
		                      throw new Error('Failed to toggle like');
		                  }
		                  return response.text();
		              })
		              .then(message => {
		                  alert(message);
		                  window.location.reload(); // 페이지 새로고침
		              })
		              .catch(error => console.error('좋아요 토글 에러: ', error));
				      });
				  });
		  	    
			});
   	
	    function confirmDelete(element) {
					const deleteBoardEl = element.getAttribute('data-ccomu-bno');
	        if (confirm("삭제 하겠습니까?")) {
	            fetch('http://localhost:9090/Community/Delete',{
										method : 'POST',
										headers : {
												'Content-Type' : 'application/json'
										},
										body : JSON.stringify({ ccomu_bno : deleteBoardEl })
	            })
	            .then(response => {

									if(response.ok) {
											return response.text();
									} else {
											throw new Error ('삭제 중 오류가 발생했습니다.');
									}
									
	            })    
	            .then(message => {
	            	 alert(message); // 서버의 응답 메시지를 표시합니다	
	            	 window.location.href = '/Community/MyList?com_id=${ sessionScope.clogin.com_id}'; 
	            })
	            .catch(error => {
								 alert(error.message);							 
	            });	     
	        } else {	            
	            alert("취소되었습니다.");
	        }
	    }
  </script>

</body>
</html>
