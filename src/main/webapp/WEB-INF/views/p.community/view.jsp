<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
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
                            <div class="comment thumb-icon" id="thumb-icon-${ commentList.ucomm_id}"
                                 data-comment-id="${commentList.ucomm_id}"></div>
                            <span style="font-size: 20px; margin-left: 8px;">${commentList.ucomu_good}</span>
                          </div>
                        </td>
                        
                     </tr>
                     <div>
                     </div> 
                     
                     
                  </c:forEach>
                  
                  
               </tbody>
            </table>
         </div>
      </div>


      <!-- 새 댓글 작성하기 -->
      <h4 style="margin-left: 318px;">댓글 작성</h4>
      <div class="d-flex justify-content-center"
         style="margin-right: 850px;">
         <div class="card m-2" id="comments-new">
            <div class="card-body">
               <!-- 댓글 작성 폼 -->
               <form action="/ApiUsers/Comment/{ucomu_bno}/comments" method="POST">
                  <!-- hidden 정보 -->
                  <input type="hidden" name="ccomu_bno" value="${vo.ucomu_bno}"
                     id="new-comment-id" />

                  <!-- 닉네임 -->
                  <div class="mb-3">
                     <label class="form-label">아이디</label> <input type="text"
                        class="form-control" id="new-comment-nickname"
                        style="background-color: #f2f2f2"
                        data-com-id="${ sessionScope.plogin.user_id}"
                        value="${ sessionScope.plogin.user_id}" readonly />
                  </div>

                  <!-- 댓글 본문  -->
                  <div class="mb-3">
                     <label class="form-label">댓글 내용</label>
                     <textarea class="form-control" id="new-comment-body"
                        style="background-color: #f2f2f2" rows="3"></textarea>
                  </div>

                  <!-- 전송 버튼-->
                  <div class="text-end">
                     <button type="submit" class="btn btn-primary"
                        id="comment-create-btn">댓글 작성</button>
                     <button type="button" class="btn btn-secondary"
                        onclick="history.back()">이전으로</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </main>

	<%@include file="/WEB-INF/views/include/footer.jsp"%>
	<!--   <script> -->
	<!-- //   	const  goListEl  = document.getElementById('goList'); -->
	<!-- //   	goListEl.addEventListener('click', function(e) { -->
	<!-- //   		location.href = '/Community/ComuHome'; -->
	<!-- //   	}) -->
	<!--   </script> -->
	<script>
  	const commentCreateBtnEl = document.getElementById('comment-create-btn');
  	commentCreateBtnEl.addEventListener('click', ()=> {
  		let ucomu_bno = parseInt(document.querySelector('#new-comment-id').value); // ccomu_bno 값을 정수로 변환
  		let url = 'http://localhost:9090/ApiUsers/Comment/\${vo.ucomu_bno}/commentCreate';
	 // js 객체
      const comment = {
          // 새 댓글의 nick name
          user_id   : document.querySelector('#new-comment-nickname').value,
          // 새글의 본문
          ucomm_body       : document.querySelector('#new-comment-body').value,
          // 부모 게시글의 id
          ucomu_bno  : ucomu_bno // 정수로 변환된 ccomu_bno 값 사용
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
  	
  	//-------------------------------------------------------------------------------
  	
  	document.addEventListener('DOMContentLoaded', () => {

  function loadThumbInfo(ucomm_id, ucomu_bno, user_id) {
    $.ajax({
      type: 'GET',
      url: `http://localhost:9090/ApiUsers/Comment/\${ucomu_bno}/\${ucomm_id}/commentLike`,
      data: {
    	  ucomm_id: ucomm_id,
    	  ucomu_bno: ucomu_bno,
        	user_id: user_id
      },
      success: function(data) {
        const thumbEl = document.querySelector(`#thumb-icon-\${ucomm_id}`);
        if (data == 1) {
          thumbEl.innerHTML = '<img src="/img/full-like.png" alt="Thumb Icon">';
        } else {
          thumbEl.innerHTML = '<img src="/img/empty-like.png" alt="Thumb Icon">';
        }
      },
      error: function(xhr, status, error) {
        console.error(error);
      }
    });
  }
    
  document.querySelectorAll('.thumb-icon').forEach(thumbIcon => {
    const ucomm_id = thumbIcon.getAttribute('data-comment-id');
    const ucomu_bno = ${vo.ucomu_bno};
    const user_id = $('#new-comment-nickname').val();

    loadThumbInfo(ucomm_id, ucomu_bno, user_id);

    thumbIcon.addEventListener('click', function() {
      const imgSrc = thumbIcon.innerHTML;
      const srcMatch = imgSrc.match(/src="([^"]+)"/);
      let isLiked = 0;

      if (srcMatch && srcMatch[1].includes('full-like')) {
        isLiked = 1;
      }

      $.ajax({
        type: 'POST',
        url: `http://localhost:9090/ApiUsers/Comment/\${ucomu_bno}/\${ucomm_id}/commentLike`,
        data: {
          ucomm_id: ucomm_id,
          ucomu_bno: ucomu_bno,
          user_id: user_id
        },
        success: function(data) {
          if(isLiked == 1) {
            thumbIcon.innerHTML = '<img src="/img/empty-like.png" alt="Thumb Icon">';
          } else {
            thumbIcon.innerHTML = '<img src="/img/full-like.png" alt="Thumb Icon">';
          }
          loadThumbInfo(ucomm_id, ucomu_bno, user_id);
        },
        error: function(xhr, status, error) {
          console.error(error);
        }
      });
      location.reload();
    });
  });
});
  </script>

</body>
</html>