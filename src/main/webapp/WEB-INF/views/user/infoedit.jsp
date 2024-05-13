<%@ page isELIgnored="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 CDN 링크 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
<style>

   /* 사이드바 */
    .sidenav {
      background-color: #f1f1f1;
      position: fixed;
      width: 200px;
      height: 100%;
      margin-left: -20px;
      margin-top:50px
    }
    /* 본문 */
    .page {
     margin-top:50px;
     margin-left: 250px;
    }
   /* 마이페이지*/
   .form-floating {
      
      margin : 0 auto;
      padding-top : 20px;
      width : 50%;
      font-size: 15px;
      
   }
   .btn {
   padding : 15px;
   cursor: pointer;
   margin: 20px;
   
   
   }
   .flex-container{
   display: flex;
   justify-content:center;
   padding : 20px;
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
			href="#"
			class="list-group-item hs_list_effect shadow">이력서 관리</a> <a
			href="#"
			class="list-group-item shadow">입사지원 관리</a> <a
			href=""
			class="list-group-item shadow">스크랩</a>
	</div>
</div>

   <!-- 페이지 내용 -->
   <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
   	<form action="/Users/InfoUpdate">
      <div class="col-sm-9 page">
         <div class="jh_resume_flexbox mt-3">
            <img src="/img/wife.jpg" id="imagePreview"
               style="width: 200px; height: 250px; display: flex; justify-content: center; align-items: center;
                     margin-left: auto; margin-right: auto;"
               class="mb-2 border border-tertiary">
			<div class="form-floating mb-3">
               <label for="floatingInput">이름</label> <input type="text"
                  class="form-control" id="floatingInput" name = "user_name" value="${ vo.user_name }" >
            </div>
            <div class="form-floating mb-3">
               <label for="floatingInput">이메일</label> <input type="email"
                  class="form-control" id="floatingInput" name="user_id" value="${ sessionScope.plogin.user_id }"readonly>
            </div>
           <div class="form-floating mb-3">
               <label for="floatingInput">비밀번호</label> <input type="password"
                  class="form-control" id="floatingInput"  name = "user_pw"value="${ sessionScope.plogin.user_pw }"
                  >
            </div>
            <div class="form-floating mb-3">
               <label for="floatingInput">전화번호</label> <input type="text"
                  class="form-control" id="floatingInput" name = "user_tell" value="${vo.user_tell }" >
            </div>
            <div class="form-floating mb-3">
               <label for="floatingInput">주소</label> <input type="text"
                  class="form-control" id="floatingInput" name = "user_adr" value="${vo.user_adr }" >
            </div>
            <div class="form-floating mb-3">
               <label for="floatingInput">생년월일</label> <input type="text"
                  class="form-control" id="floatingInput" name = "user_birth"  value="${vo.user_birth }" >
            </div>
            
			<input type = "hidden" name = "user_date"  >
			
            <div class="flex-container">
               <button type="submit" class="btn"
                  style="background-color: #5215a6; color: white; border: white;">수정완료</button> <!-- 수정 페이지 만들고 연결 -->
               <button type="button" class="btn"
                  style="background-color: #5215a6; color: white; border: white;"
                  onClick="location.href='/Users/Info?user_id=${ sessionScope.plogin.user_id}class'">취소</button> <!-- 회원탈퇴 페이지 만들고 연결 -->
            </div>
         </div>
         </div>
      </form>
     
         <!-- 내용 추가 -->
   </main>

</body>
</html>