<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<link rel="icon" type="image/x-icon" href="/img/favicon.ico">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<style>
table {
   width: 100%;
   margin-top: 20px;
   font-size: 13px;
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

.buttons-container {
   text-align: right;
   margin-bottom: 20px;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/views/include/pheader.jsp"%>
<div class="container">
    <div class="buttons-container">
        <a href="/CommunityUsers/WriteForm?user_id=${ sessionScope.plogin.user_id}" class="btn btn-primary btn-lg">새 글 추가</a>
        <a href="/CommunityUsers/ComuHome?user_id=${ sessionScope.plogin.user_id}" class="btn btn-primary btn-lg">전체 게시판</a>
    </div>
    <h2 class="fw-bold">게시물 목록</h2>
    <div class="header-container">
        <table class="table table-striped table-bordered">
            <thead>
                <tr style="background-color:#B4E5FF;">
                    <th>번호</th>
                    <th class="title">제목</th>
                    <th class="name">작성자</th>
                    <th class="date">작성일</th>
                    <th class="hits">조회수</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="boardList" items="${ communityList }">
                    <tr style="background-color:white;">
                        <td>${ boardList.ucomu_bno }</td>
                        <td class="title">
                            <a href="/CommunityUsers/MyListView?ucomu_bno=${boardList.ucomu_bno}&user_id=${ sessionScope.plogin.user_id}" >
                                ${ boardList.ucomu_title }
                            </a>
                        </td>
                        <td class="name">${ boardList.user_id }</td>
                        <td class="date">${ boardList.ucomu_date }</td>
                        <td class="hits">${ boardList.ucomu_hit }</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
<%--     <%@include file="/WEB-INF/views/include/paging.jsp"%> --%>
</div>
<%@include file="/WEB-INF/views/include/footer.jsp"%>
</body>
</html>
