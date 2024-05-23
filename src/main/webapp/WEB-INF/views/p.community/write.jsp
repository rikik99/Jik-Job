<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<style>
  .header-container h2 {
    margin-bottom: 30px;
    color: #0d6efd; /* Bootstrap primary color */
  }
  
  .form-control, .btn-primary {
    border-radius: 0.5rem; /* Rounded borders */
  }

  .form-table td, .form-table th {
    vertical-align: middle;
    border: 1px solid #dee2e6; /* 테두리 선 명확하게 */
    font-size: 13px; /* 글자 크기 고정 */
  }

  .form-table .name, .form-table .title, .form-table .content {
    width: 20%;
    font-weight: bold;
    background-color: #1E96FF; /* 변경된 배경 색깔 */
    color: black; /* 글자 색을 검정색으로 */
    text-align: center;
    font-size: 13px;
  }

  .btn-primary {
    margin-right: 10px;
  }

  .table thead th {
    background-color: #f8f9fa; /* 테이블 헤더 배경색 */
  }

  .table tbody tr:hover {
    background-color: #f1f3f5; /* 행 마우스 오버 시 배경색 */
  }
</style>


</head>
<body>
<main>
  <%@include file="/WEB-INF/views/include/pheader.jsp" %>
  <div class="container my-5">
    <div class="header-container text-center">
      <h2 class="fw-bold">게시글 등록</h2>
    </div>
    <form action="/CommunityUsers/Write" method="POST">
      <input type="hidden" name="user_id" value="${ user_id }" />
      <table class="table table-bordered form-table">
        <thead>
          <tr>
            <th class="name text-black">작성자</th>
            <th colspan="3" class="text-black">${ user_id }</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td class="title text-black">제목</td>
            <td colspan="3"><input type="text" name="ucomu_title" class="form-control" /></td>
          </tr>
          <tr>
            <td class="content text-black">내용</td>
            <td colspan="3">
              <textarea name="ucomu_content" rows="10" class="form-control"></textarea>
            </td>
          </tr>
          <tr>
            <td colspan="4" class="text-center">
              <button type="submit" class="btn btn-primary btn-lg">글 쓰기</button>
              <button type="button" class="btn btn-secondary btn-lg" onclick="history.back()">이전으로</button>
            </td>
          </tr>
        </tbody>
      </table>
    </form>
  </div>
</main>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
<script>
  // 여기에 필요한 자바스크립트 코드를 추가할 수 있습니다.
</script>
</body>
</html>