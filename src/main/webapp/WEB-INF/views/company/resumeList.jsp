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
	background-color: #f4f4f4;
	margin: 0;
}

.post-listings {
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

.post-listings tr td:nth-child(4) {
	width: 400px;
}

/* 모달 스타일 */
.modal {
	position: absolute;
	z-index: 9999;
	left: 0;
	top: 0;
	width: 80%;
	height: 80%;
	background-color: rgba(0, 0, 0, 0.5);
	display: none;
	align-items: center;
	justify-content: center;
	overflow: auto;
}

.modal-content {
	background-color: #fefefe;
	border-radius: 10px;
	margin: 5% auto;
	padding: 20px;
	max-width: 600px;
	width: 90%;
	box-shadow: 0 2px 3px 0 rgba(34, 36, 38, 0.15); /* 테두리 그림자 */
	transform: translateY(-50%); /* 모듈창열었을때 위치설정 가운데로 */
	position: absolute;
	top: 40%; /* 모달을 화면가운데 놓기위함. */
}

.close {
	color: #aaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover, .close:focus {
	color: black;
	text-decoration: none;
}

.modal-header {
	display: flex;
	align-items: center;
	margin-bottom: 15px;
}

.user-img {
	width: 100px;
	height: auto;
	margin-right: 10px;
}

.modal-body p {
	margin-bottom: 10px;
}

.modal-body p strong {
	font-weight: bold;
	margin-right: 5px;
}

/* 모달 내용 간 구분선 */
.modal-body p {
	margin-bottom: 10px;
	border-bottom: 1px solid #ddd; /* 각 내용 사이에 선 추가 */
}

/* 마지막 내용의 선 제거 */
.modal-body p:last-child {
	border-bottom: none; /* 마지막 요소에는 선을 표시하지 않음 */
}

/* 평점 스타일 */
.rating {
	display: inline-block;
}

.rating input {
	display: none;
}

.rating label {
	cursor: pointer;
	width: 30px;
	font-size: 24px;
	color: #ffd700; /* 별 색상 */
}

.rating label:hover, .rating label:hover ~ label {
	color: #ffcc00; /* 호버 시 색상 변경 */
}

.ratingSubmitBtn {
	background-color: #007bff; /* 제출 버튼 배경색 */
	color: white; /* 제출 버튼 텍스트 색상 */
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.ratingSubmitBtn:hover {
	background-color: #0056b3; /* 호버 시 배경색 변경 */
}

/* CSS 파일에 추가 */
/* 별점을 표시하기 위한 스타일 */
.star {
	font-size: 30px;
	color: #ccc;
	cursor: pointer;
}

.star.filled {
	color: gold;
}
</style>

</head>

<body>

	<%@include file="/WEB-INF/views/include/cheader.jsp"%>

	<main>

		<section>
			<article>
				<div class="select_box jm_select_box mt-5">
					<select id="skill" name="skill" class="jm_select selectpicker"
						data-style="btn-info">
						<option value="none" selected>분야</option>
						<option value="JavaScript">JavaScript</option>
						<option value="TypeScript">TypeScript</option>
						<option value="Java">Java</option>
						<option value="Python">Python</option>
						<option value="C#">C#</option>
						<option value="Kotlin">Vue.js</option>
						<option value="MySQL">MySQL</option>
						<option value="MongoDB">MongoDB</option>
						<option value="GitHub">GitHub</option>
						<option value="Swift">Swift</option>
						<option value="Django">Django</option>
					</select> <select id="career" class="jm_select">
						<option value="none" selected>고용형태</option>
						<option value="신입">신입</option>
						<option value="경력">경력</option>
					</select> <select id="region" class="jm_select">
						<option value="none" selected>근무지</option>
						<option value="서울">서울</option>
						<option value="부산">부산</option>
						<option value="대구">대구</option>
						<option value="인천">인천</option>
						<option value="광주">광주</option>
						<option value="대전">대전</option>
						<option value="울산">울산</option>
						<option value="강원도">강원도</option>
						<option value="세종">세종</option>
						<option value="제주">제주</option>
					</select>

				</div>

				<h2 style="text-align: center; padding-top: 2%;">인재보기</h2>
				<hr />


				<div class=" mx-2 pb-4 w-100">
					<div class=" border border-tertiary p-5 rounded shadow">
						<div class="d-flex justify-content-center">

							<div>
								<table class="post-listings">
									<thead>
										<tr>
											<th>No.</th>
											<th>유저명</th>
											<th>평점</th>
											<th>이력서제목</th>
											<th>경력</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${ resumeList }" var="resumeList">
											<tr>
												<td>${resumeList.re_num}</td>
												<td><a href="#" id="userName"
													onclick="openPopup('${ resumeList.user_name }','${ resumeList.user_tell }',
											     '${ resumeList.user_birth }','${ resumeList.user_adr }','${ resumeList.user_edu }',
											     '${ resumeList.user_id }', '${ resumeList.rating }'
											     )">
														${resumeList.user_name} </a></td>
												<td>${resumeList.rating}</td>
												<td><a
													href="/Resume/View?re_num=${ resumeList.re_num }&com_id=${ sessionScope.clogin.com_id }">${ resumeList.re_title }</a>
												</td>
												<td>${ resumeList.user_car }</td>
											</tr>

											<!-- 모달 팝업 -->
											<!-- <div id="popupModal" class="modal"> -->
											<div class="modal">
												<div class="modal-content">
													<span class="close" onclick="closePopup()">&times;</span>
													<div class="modal-header">
														<img src="/img/face.jpg" alt="유저 프로필" class="user-img">
														<h3 id="popupTitle"></h3>
													</div>
													<div class="modal-body">
														<p id="popupContent"></p>
														<p id="popupReNum"></p>
														<p id="popupUserName"></p>
														<p id="popupUserAdr"></p>
														<p id="popupUserTell"></p>
														<p id="popupUserEdu"></p>
														<!-- 평점 입력 폼 -->
														<form id="ratingForm" onsubmit="submitRating(event)">
															<label for="rating">평점:</label>
															<!-- <input type="number" id="rating" name="rating" min="1" max="5" required> -->
															<input type="hidden" id="com_id" name="com_id"
																value="${ sessionScope.clogin.com_id }" />

															<div class="ratingStar">
																<span class="star" data-value="1">&#9733;</span> <span
																	class="star" data-value="2">&#9733;</span> <span
																	class="star" data-value="3">&#9733;</span> <span
																	class="star" data-value="4">&#9733;</span> <span
																	class="star" data-value="5">&#9733;</span> <span>&nbsp;&nbsp;&nbsp;</span>
																<button type="button" class="ratingSubmitBtn">
																	<i class="fas fa-check"></i> 제출
																</button>
															</div>


															<!-- 평점 표시 영역 -->
															<div class="ratingDisplay"></div>

														</form>
													</div>
												</div>
											</div>

										</c:forEach>
									</tbody>
								</table>

					<input type="hidden" id="com_id" value="${ sessionScope.clogin.com_id }" />
							</div>
						</div>
					</div>
				</div>
			</article>
		</section>
	</main>

	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
   
   //-----------------------------------------------------------------------------
   // 모달 열기
   
   function openPopup(user_name, user_tell, user_birth, user_adr, user_edu, user_id, rating) {
	  const modal = document.querySelector(".modal");
	  const title = document.getElementById("popupTitle");
	  const content = document.getElementById("popupContent");
	  const userAdr  = document.querySelector('#popupUserAdr');
	  const userTell = document.querySelector('#popupUserTell');
	  const userEdu = document.querySelector('#popupUserEdu');
	  
	  // 모달 제목과 기본 내용 설정
      title.innerHTML   = user_name + ' 정보';
      content.innerHTML = '이곳에 ' + user_name + '의 간단한 정보를 표시합니다.';
      userTell.innerHTML = '전화번호: ' + user_tell;
      userAdr.innerHTML = '주소: ' + user_adr;
      userEdu.innerHTML = '학력: ' + user_edu;

      modal.style.display = "block";
  
   //-----------------------------------------------------------------------------
   // 평점 표시
   
      $(document).ready(function() {
	    const com_id = $('#com_id').val();
	    
	    // Ajax를 사용하여 서버로부터 평점을 가져옴
	    fetch('/Resume/getRating?user_id=' + user_id + '&com_id=' + com_id + '&rating=' + rating, {
	        method : 'GET'
	    })
	    .then(response => response.text())
	    .then(data => {
	        // 서버로부터 받은 평점을 설정
	        const rating = parseInt(data);
	        const starEls = document.querySelectorAll('.star');
	        starEls.forEach(star => {
	            const starValue = parseInt(star.getAttribute('data-value'));
	            if (starValue <= rating) {
	                star.classList.add('filled');
	            } else {
	                star.classList.remove('filled');
	            }
	        });
	    })
	    .catch(error => console.error(error));
	    
	    // 별점을 클릭했을 때 이벤트 처리
	    const starEls = document.querySelectorAll('.star');
	    let selectedRating = 0; // 선택된 평점을 저장할 변수
	    
	    starEls.forEach( star => {    
	        star.addEventListener('click', function() {
	            // 클릭한 별의 값을 가져옴
	            const value = parseInt(this.getAttribute('data-value'));
	            console.log('클릭한 별의 값: ' + value);
	            selectedRating = value; // 사용자가 선택한 평점을 저장
	            
	            // 클릭한 별보다 작거나 같은 별에 'filled' 클래스 추가
	            document.querySelectorAll('.star').forEach(star => {    
	                const starValue = parseInt(star.getAttribute('data-value'));
	                
	                if (starValue <= value) {
	                    star.classList.add('filled');
	                } else {
	                    star.classList.remove('filled');
	                }    
	            });    
	        })    
	    })
	
	    // 평점 제출 처리 함수
	    const ratingSubmitBtnEl = document.querySelector('.ratingSubmitBtn');
	    // 평점 제출 버튼에 대한 이벤트 리스너를 한 번만 추가
	    ratingSubmitBtnEl.addEventListener('click', function(e) {
	        e.preventDefault();
	        const rating = selectedRating;  // 사용자가 선택한 최종 평점 사용
	        const com_id = $('#com_id').val();
	        console.log('rating: ' + rating)
	
	        // 서버로 평점 데이터 전송
	        fetch('/Resume/ratings/add?com_id=' + com_id + '&user_id=' + user_id + '&rating=' + rating, {
	            method: 'POST'
	        })
	        .then(response => response.text())
	        .then(data => {
	            console.log(data);
	            alert('평점 제출 완료!')
	            // 이전 평점을 업데이트하기 위한 FETCH 요청
	            fetch('/Resume/getRating?user_id=' + user_id + '&com_id=' + com_id + '&rating=' + rating, {
	                method : 'GET'
	            })
	            .then(response => response.text())
	            .then(data => {
	                console.log(data)
	            })
	            .catch(error => console.error(error));
	        })
	    })
	});
   }

   // 모달 닫기
   function closePopup() {
	  const modal = document.querySelector(".modal");
      modal.style.display = "none";
      location.reload();
   }
   
   // 모달 바깥을 클릭하면 모달이 닫히도록 설정
   window.onclick = function(event) {
	  const modal = document.querySelector(".modal");
      if (event.target == modal) {
         modal.style.display = "none";
      location.reload();
      }
   }
   
</script>
	<script>
document.addEventListener('DOMContentLoaded', function() {
    // 모든 필터 조건에 대한 이벤트 리스너 추가
    document.getElementById('skill').addEventListener('change', filterPosts);
    document.getElementById('career').addEventListener('change', filterPosts);
    document.getElementById('region').addEventListener('change', filterPosts);
    const comIdElement = document.getElementById('com_id');
    if (comIdElement) {
        const comId = comIdElement.value;
    } else {
        console.error("요소 'com_id'를 찾을 수 없습니다.");
    }
});
function filterPosts() {
    // 각 필터링 조건의 값을 가져옴
    const selectedSkill = document.querySelector('#skill>option:checked').value;
    const selectedCareer = document.querySelector('#career>option:checked').value;
    const selectedRegion = document.querySelector('#region>option:checked').value;
    // 'user_id'를 가진 요소가 있는지 확인 후 값을 가져옴
    const comIdElement = document.getElementById('com_id');
    const comId = comIdElement ? comIdElement.value : null;

    // 서버에 보낼 데이터 객체 생성
    const requestData = {
        skill: selectedSkill,
        career: selectedCareer,
        region: selectedRegion
    };
        const url = '/Filter/GetResume';
        fetch(url, {
            method: 'POST',
            headers: {"Content-Type": "application/json"},
            body: JSON.stringify(requestData)
        })
    .then(response => response.json())
    .then(json => {
    	const container = document.querySelector('.post-listings tbody');
	        let html = '';
	        container.innerHTML = html;
	        json.forEach(resumeList => {
		        let html = '';
		        console.log(resumeList.re_num);
		        html += '<tr>';
		        html += '<td>' + resumeList.re_num + '</td>';
		        html += '<td>';
		        html += '<a href="#" id="userName" onclick="openPopup(\'' + 
		        resumeList.user_name.replace(/'/g, "\\'") + '\',\'' + 
		        resumeList.user_tell + '\',\'' + 
		        resumeList.user_birth.replace(/'/g, "\\'") + '\',\'' + 
		        resumeList.user_adr.replace(/'/g, "\\'") + '\',\'' + 
		        resumeList.user_edu + '\',\'' + 
		        resumeList.user_id + '\',\'' + 
		        resumeList.rating + 
		        '\')">' + resumeList.user_name + '</a>';
		        html += '</td>';
		        html += '<td>' + resumeList.rating + '</td>';
		        html += '<td><a href="/Post/View?po_num=' + resumeList.re_num + '&com_id=' + resumeList.comId + '">' + resumeList.re_title + '</a></td>';
		        html += '<td>' + resumeList.user_car + '</td>';
		        html += '</tr>';
                const postElement = document.createElement('tr');
                postElement.classList.add('col-xs-4', 'post'); 
                postElement.innerHTML = html;
                container.appendChild(postElement);
            });
        })
        .catch(error => {
            console.error('에러:', error);
            alert('요청을 처리하는 중 문제가 발생했습니다.');
        });
    }
</script>
</body>
</html>