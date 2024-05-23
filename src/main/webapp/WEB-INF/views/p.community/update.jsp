<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
body {
    padding: 20px;
    margin: 0 auto;
    width: 80%;
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

</style>
</head>
<body>
  <main>
    
    <%@include file="/WEB-INF/views/include/pheader.jsp" %>
  <div class="container">
  <div class="header-container">
	<h2>게시글 등록</h2>
	  </div>
	   
	<form action="/CommunityUsers/Update" method="POST">
	<input type="hidden" name="user_id" value="${ user_id }" />
	<input type="hidden" name="ucomu_bno" value="${ ucomu_bno }" />
	
	<table id="table">
	 <tr>
      <td>글번호</td>
      <td>${ vo.ucomu_bno }</td>
      <td>조회수</td>
      <td>${ vo.ucomu_hit }</td>      
    </tr>
	 <tr>
      <td>작성자</td>
      <td>${ vo.user_id }</td>
      <td>작성일</td>
      <td>${ vo.ucomu_date }</td>
    </tr>
	 <tr>
      <td>제목</td>
      <td colspan="3">
        <input type="text" name="ucomu_title" value="${ vo.ucomu_title }"/></td>
       
    </tr>
    <tr>
		  <td>내용</td>
		  <td colspan="3">
		    <textarea name="ucomu_content" rows="10" cols="50">${ vo.ucomu_content }</textarea>
		  </td>
		</tr>
    <tr>
      <td colspan="4"> 
       <input type="submit" 
       class="btn btn-primary btn-lg" value="글 수정" /> 
       <a class="btn btn-primary btn-lg" 
          href  = "javascript:history.back()">이전으로</a>&nbsp;&nbsp;
      </td>  
    </tr>	
	 
	
	</table>	
	    
	    
	</form>  
	 </div>
	
  </main>
  <%@include file="/WEB-INF/views/include/footer.jsp"%>
  <script>
  	const  goListEl  = document.getElementById('goList');
  	goListEl.addEventListener('click', function(e) {
  		location.href = '/CommunityUser/ComuHome';
  	})
  
  </script>
  
</body>
</html>