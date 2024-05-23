<%@include file="/WEB-INF/views/include/cheader.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>


<style>
.main {
   text-align: center;
   padding: 0;
   margin: 0 auto;
}

.mb-5, .container-fluid {
   margin-bottom: 3rem;
}

.custom-btn, .btn-outline-secondary {
   width: 160px;
   height: 40px;
   font-size: 15px;
   margin: 10px;
   background-color: dodgerblue;
   color: white;
   border-color: white;
}

body {
   background-color: #f8f9fa;
}

.container-fluid {
   background-color: white;
   padding: 20px;
   border-radius: 8px;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.content {
   padding: 0 18px;
   max-height: 0;
   overflow: hidden;
   transition: max-height 0.2s ease-out;
   background-color: white;
   text-align: center;
}

.collapsible {
   background-color: #f1f1f1;
   color: black;
   cursor: pointer;
   padding: 10px;
   width: 50%;
   border: solid 1px #E7E7E7;
   outline: none;
   font-size: 15px;
   margin: 0 auto;
   display: block;
}

.active, .collapsible:hover {
   background-color: #D1E2FF;
}

.collapsible:after {
   content: '\002B';
   color: white;
   font-weight: bold;
   float: right;
   margin-left: 5px;
}
</style>



</head>
<body>
   <main class="container-fluid">
      <h2 style="height: 70px; text-align: center;">자주 묻는 질문</h2>

      <div class="d-flex justify-content-center mb-5">
         <a href="/Faq/Home3" class="btn btn-outline-secondary me-5"
            style="background-color: dodgerblue; color: white; border: white; text-decoration: none; display: inline-block; padding: 10px;">개인회원
            FAQ</a>
         <button type="button" class="btn btn-outline-secondary"
            style="background-color: dodgerblue; color: white; border: white;">기업회원
            FAQ</button>
      </div>

      <h2 style="text-align: center;">기업회원FAQ</h2>

      <button type="button" class="collapsible" onclick="collapse(this);">회사로고
         등록이 안돼요</button>
      <div class="content">
         <p>니가 못하는거에요</p>
      </div>

      <button type="button" class="collapsible" onclick="collapse(this);">어떻게
         좋은 인재를 구하죠?</button>
      <div class="content">
         <p>월급을 많이 주세요</p>
      </div>

      <button type="button" class="collapsible" onclick="collapse(this);">어떡하면
         세금을 안내죠?</button>
      <div class="content">
         <p>대통령이 되세요</p>
      </div>

      <button type="button" class="collapsible" onclick="collapse(this);">라젠카세이브어스</button>
      <div class="content">
         <p>나무아미타불</p>
      </div>

      <button type="button" class="collapsible" onclick="collapse(this);">꽁꽁
         얼어붙은 한강위로</button>
      <div class="content">
         <p>고양이가 걸어다닙니다</p>
      </div>

      <button type="button" class="collapsible" onclick="collapse(this);">못말리는
         아가씨</button>
      <div class="content">
         <p>야레야레</p>
      </div>
   </main>
   <script>
        function collapse(element) {
            var before = document.getElementsByClassName("active")[0]               // 기존에 활성화된 버튼
            if (before && document.getElementsByClassName("active")[0] != element) {  // 자신 이외에 이미 활성화된 버튼이 있으면
                before.nextElementSibling.style.maxHeight = null;   // 기존에 펼쳐진 내용 접고
                before.classList.remove("active");                  // 버튼 비활성화
                console.log("active")
            }
            element.classList.toggle("active");         // 활성화 여부 toggle

            var content = element.nextElementSibling;
            if (content.style.maxHeight != 0) {         // 버튼 다음 요소가 펼쳐져 있으면
                content.style.maxHeight = null;         // 접기
            } else {
                content.style.maxHeight = content.scrollHeight + "px";  // 접혀있는 경우 펼치기
            }
          
        }
    </script>
</body>
</html>