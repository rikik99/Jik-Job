<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body, html {
   height: 100%;
   margin: 0;
}

.container {
   position: relative;
   min-height: 100%;
}

.footer {
   position: absolute;
   left: 0;
   bottom: 0;
   width: 100%; 
   background-color: Lightgray;
   color: white;
   text-align: center;
   padding: 10px;

}
</style>
</head>
<body>

   <div class="container">
      <!-- 페이지 내용 -->
      <div class="footer">
         <p>© 2024 회사명. 모든 권리 보유.</p>
         <p>이메일: info@yourcompany.com | 전화번호: 123-456-7890</p>
         <a href="terms.jsp">이용 약관</a> | <a href="privacy.jsp">개인정보 보호정책</a>
      </div>
   </div>

</body>
</html>