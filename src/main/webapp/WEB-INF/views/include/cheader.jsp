<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Jick Job</title>
<meta charset="utf-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/32aa2b8683.js"
	crossorigin="anonymous"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="stylesheet" href="/css/style.css">

</head>

<body>
	<header>
		<input type="hidden" id="current" val="siteMain" />
		<nav
			class="sj_full_container navbar navbar-light sticky-top border-bottom align-self-center py-4 navcolor">
			<div class="container d-flex justify-content-between">
				<div>
					<a class="navbar-brand fs-2" href="/Company/Chome"> <img src="/img/JIK_JOB.png" 
						width="70px;" height="70px;" class="d-inline-block align-text-top">
					</a>
				</div>
				<div>
					<ul class="nav link-dark"
						style="position: relative; bottom: -25px; left: -60px;">
						<c:choose>
							<c:when test="${ sessionScope.clogin == null || clogin == '' }">
								<li class="nav-item" id="main" ><a
									class="nav-link link-dark" aria-current="page"
									href="/BoardPaging/CList?com_id=${sessionScope.clogin.com_id  }&nowpage=1">채용정보</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item" id="main"><a
									class="nav-link link-dark" aria-current="page"
									href="/BoardPaging/CList?com_id=${sessionScope.clogin.com_id  }&nowpage=1">채용정보</a></li>
							</c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${ sessionScope.clogin == null || clogin == '' }">
								<li class="nav-item" id="main" ><a
									class="nav-link link-dark" aria-current="page"
									href="/Users/LoginForm">인재정보</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item" id="main"><a
									class="nav-link link-dark" aria-current="page"
									href="/Resume/List?com_id=${ sessionScope.clogin.com_id }">인재정보</a></li>
							</c:otherwise>
						</c:choose>
											
						<li class="nav-item" id="Jicjob"><a
							class=" nav-link link-dark"
							href="/Community/ComuHome?com_id=${ sessionScope.clogin.com_id}">커뮤니티</a></li>
						<li class="nav-item" id="Jicjob"><a
							class=" nav-link link-dark" href="/Faq/Chome3?com_id=${ sessionScope.clogin.com_id}">고객센터</a></li>


						<c:choose>
							<c:when test="${ sessionScope.clogin == null || clogin == '' }">
								<li class="nav-item"><a class="nav-link link-dark"
									href="/LoginForm">로그인</a></li>
							</c:when>
							<c:otherwise>
								<li class="nav-item" id="main"><a
									class="nav-link link-dark" aria-current="page"
									href="/Logout">로그아웃</a></li>
							</c:otherwise>
						</c:choose>
					</ul>

				</div>
				<div>
					<c:choose>
						<c:when test="${ sessionScope.clogin == null || clogin == '' }">
						</c:when>
						<c:otherwise>
							<a class="nav-link"
								href="/Company/CInfo?com_id=${ sessionScope.clogin.com_id }">
								<img src="/img/mypage_logo.png" style="width: 80px;">
							</a>
						</c:otherwise>
					</c:choose>
				</div>

			</div>

		</nav>
	</header>
	<div class="mb-5" style="height: 40px;"></div>
	