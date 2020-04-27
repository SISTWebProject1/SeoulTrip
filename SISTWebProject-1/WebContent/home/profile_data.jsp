<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile</title>
<link href='https://fonts.googleapis.com/css?family=Lato:400,500,900'
	rel='stylesheet' type='text/css'>
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="../css/profile_Instar.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
	$(function() {
		$("#dialog").dialog({
			autoOpen : false,
			show : {
				effect : "blind",
				duration : 1000
			},
			hide : {
				effect : "explode",
				duration : 1000
			}
		});
		$("#profile_update").click(function() {
			$("#dialog").dialog("open");
		});
	});
</script>
<style type="text/css">
#keyBtn {
	background-color: maroon;
	color: white;
	border: 1px solid transparent;
}

.body {
	background-color: black;
}

.row {
	margin: 50px;
}

.profile {
	background-color: white;
}

.info {
	background-color: white;
	margin: 40px;
}

.nav-menu>li {
	margin: 15px;
}

.nav-menu>li>a {
	font-size: 15px;
}

#my_info>li {
	margin: 15px;
}

#pro_content {
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
}
</style>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<body>
	<!-- Start banner Area -->
	<jsp:include page="../home/my_image.jsp"></jsp:include>
	<!-- End banner Area -->

	<!-- Start Align Area -->
	<div class="whole-wrap">
		<div class="container">

			<h3 style="margin: 4px; border-bottom: 2px groove;">프로필</h3>
			<div class="profile">
				<div class="profile-image">
					<img src="${my_vo.photo }">
				</div>
				<div class="profile-user-settings" style="text-align: left">
					<h2 class="profile-user-name">${my_vo.name }</h2>
					<sub style="color: gray">ID:@${my_vo.memberId }</sub>
				</div>

				<div class="profile-bio" style="margin: 5px;">
					<c:if test="${my_vo.selfInfo !=null }">
						<div class="caption">${my_vo.selfInfo }</div>
					</c:if>
					<ul id="my_info" style="text-align: left;">
						<li><img src="../mypage/birth.png"
							style="width: 20px; float: left;">생일 : ${birth }</li>
						<li><img src="../mypage/book.png"
							style="width: 20px; float: left;">가입일 : ${regdate}</li>
						<li><img src="../mypage/book.png"
							style="width: 20px; float: left;">E-mail : ${my_vo.email }</li>
					</ul>
				</div>
			</div>
			<!-- 이미지 지도를 표시할 div 입니다 -->
			<div class="section-top-border">
				<jsp:include page="../home/pro_reviews.jsp"></jsp:include>
				<!--  <div class="row text-center">
					<a href="../mypage/profile.do?page=${curpage>1?curpage-1:curpage }"
						class="btn btn-sm btn-primary">이전</a> ${curpage } page /
					${allPage } pages <a
						href="../mypage/profile.do?page=${curpage<allPage?curpage+1:curpage }"
						class="btn btn-sm btn-primary">다음</a>
				</div>
				-->
				<div class="section-top-border">
					<jsp:include page="../home/wishlist.jsp"></jsp:include>
				</div>
			</div>
		</div>

	</div>
</body>