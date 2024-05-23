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

/* 본문 */
.page {
	margin: 0;
	/* margin-top: 50px; */
	/* margin-left: 250px; */
}
/* 마이페이지*/
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
	width: 125%;
	border-collapse: collapse;
}

th, td {
	padding: 15px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

table th:nth-child(2) {
	width: 100px;
}
table th:nth-child(4) {
	width: 100px;
}

th {
	background-color: #f4f4f4;
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
								<h4>저희 회사에 지원한 이력서 목록입니다</h4>

								<table>
									<thead>
										<tr>
											<th>No</th>
											<th>공고번호</th>
											<th id="longLoc">공고제목</th>
											<th>지원자명</th>
											<th id="longLoc">이력서제목</th>

											<th>지원일자</th>

											<th>결과</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item" items="${applyedList}">
											<tr>
												<td>${ item.ap_id }</td>
												<td>${ item.po_num }</td>
												<td><a
													href="/Company/PostView?po_num=${ item.po_num }&com_id=${ sessionScope.clogin.com_id }">${item.po_title }</a></td>
												<td>${item.user_name }</td>
												<td><a
													href="/Users/ResumeView?re_num=${item.re_num}&user_id=${item.user_id}&com_id=${ sessionScope.clogin.com_id }">${item.re_title }</a></td>
												<td>${item.ap_date }</td>

												<td>
													<div id="resultBtn_${ item.ap_id }" class="resultBtn"
														data-index="${ item.ap_id }"
														data-user-id="${ item.user_id }"
														data-re-num="${ item.re_num }"
														data-result="${ item.result }"
														data-com-id="${ sessionScope.clogin.com_id }"
														data-po-num="${ item.po_num }"></div> <input type="hidden"
													id="ap_id_${ item.ap_id }" name="ap_id"
													value="${ item.ap_id }" /> <input type="hidden"
													id="user_id_${ item.ap_id }" name="user_id"
													value="${item.user_id}" /> <input type="hidden"
													id="re_num_${ item.ap_id }" name="re_num"
													value="${item.re_num}" /> <input type="hidden"
													id="result_${ item.ap_id }" name="result"
													value="${item.result}" /> <input type="hidden"
													id="com_id_${ item.ap_id }" name="com_id"
													value="${ sessionScope.clogin.com_id }" /> <input
													type="hidden" id="po_num_${ item.ap_id }" name="po_num"
													value="${item.po_num}" />
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
		
		$(document).ready(function() {
			
			// 버튼 상태 확인
		    function checkstatus($element, ap_id, user_id, re_num, result, com_id, po_num) {
		        $.ajax({
		            type: 'GET',
		            url: '/Company/checkstatus',
		            data: { ap_id, user_id, re_num, result, com_id, po_num },
		            success: function(data) {
						
		                if (result == 0) {
		                	$element.html('<button type="button" data-id="0" class="btn btn-secondary selection-btn">대기</button>');
		                } else if (result == 1) {
		                	$element.html('<button type="button" data-id="1" class="btn btn-danger selection-btn">불합격</button>');
		                } else {
		                	$element.html('<button type="button" data-id="2" class="btn btn-info selection-btn">합격</button>');
		                }
		            },
		            error: function(xhr, status, error) {
		                console.error(error);
		            }
		        });
		    }
		    
		    // 초기 바인딩
		    $('.resultBtn').each(function() {
		        const $this = $(this);
		        const ap_id = $this.data('index');
		        const user_id = $this.data('user-id');
		        const re_num = $this.data('re-num');
		        const result = $this.data('result');
		        const com_id = $this.data('com-id');
		        const po_num = $this.data('po-num');

		        checkstatus($this, ap_id, user_id, re_num, result, com_id, po_num);
		    });

		    // 대기, 불합격, 합격 버튼 생성을 위한 함수
		    function createSelectionButtons() {
		        return `
		            <button type="button" data-id="0" class="btn btn-secondary selection-btn after">대기</button>
		            <button type="button" data-id="1" class="btn btn-danger selection-btn after">불합격</button>
		            <button type="button" data-id="2" class="btn btn-info selection-btn after">합격</button>
		        `;
		    }

		    $(document).on('click', '.selection-btn', function() {
		    	
		    	console.log('================================================')
		        // 현재 버튼의 위치를 기반으로 새로운 버튼들 추가
		        const $this = $(this);
		        console.log($this)
		        
		        const idPrefix = $this.attr('data-id');
		        console.log('idPrefix: ' + idPrefix)
		        
		        /* const resultBtnEl = document.querySelector('.resultBtn');
		        console.dir(resultBtnEl);
		        resultBtnEl.innerHTML = createSelectionButtons(); */
		        // 위에 방법 안됨
		        // 이 부분은 $this(jQuery 객체)의 조상 요소 중에서 가장 가까운 클래스가 'resultBtn'인 요소를 선택
		        // closest() 메서드는 조상 요소를 검색하는데 사용됨
		        const divEl = $this.closest('.resultBtn');
		        console.log(divEl)
		        
		        divEl.html( createSelectionButtons() );
		        console.log('===============================================')

		        // 선택 버튼 클릭 이벤트 처리
		        divEl.on('click', '.after', function() {
		        	const $this = $(this);
			        const divEl = $this.closest('.resultBtn');
			        console.log('=====================================')
			        console.dir($this)
			        console.dir(divEl)
			        console.log('=====================================')
		            const user_id = divEl.data('user-id');
		            const re_num = divEl.data('re-num');
		            const com_id = divEl.data('com-id');
		            const po_num = divEl.data('po-num');
			        const ap_id = divEl.data('index');
			        const result = $this.data('id');
			        console.log(user_id)
			        console.log(re_num)
			        console.log(com_id)
			        console.log(po_num)
			        console.log(ap_id)
			        console.log(result)

		            if (result == 0) {
		                divEl.html('<button type="button" data-id="0" class="btn btn-secondary selection-btn">대기</button>');
		            } else if (result == 1) {
		                divEl.html('<button type="button" data-id="1" class="btn btn-danger selection-btn">불합격</button>');
		            } else {
		                divEl.html('<button type="button" data-id="2" class="btn btn-info selection-btn">합격</button>');
		            }

		            // 선택한 결과를 서버로 전송하여 저장하는 로직
		            $.ajax({
		                type: 'POST',
		                url: '/Company/decision',
		                data: {
		                	ap_id: ap_id,
		                    user_id: user_id,
		                    re_num: re_num,
		                    result: result,
		                    com_id: com_id,
		                    po_num: po_num
		                },
		                success: function(data) {
		                    console.log(data);
		                    alert('결과 처리 되었습니다');
		                    location.reload();
		                },
		                error: function(xhr, status, error) {
		                    console.error(error);
		                }
		            });
		            
		        });
				})
				
				
				
		    });
		


		
		</script>
</body>
</html>