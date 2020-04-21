<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="img/fav.png">
<!-- Author Meta -->
<meta name="author" content="codepixer">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->

<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:700|Roboto:400,500"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="../css/linearicons.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/magnific-popup.css">
<link rel="stylesheet" href="../css/nice-select.css">
<link rel="stylesheet" href="../css/animate.min.css">
<link rel="stylesheet" href="../css/owl.carousel.css">
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.banner-area {
	height: 200px;
}
</style>
</head>

<body>
	<!-- End header Area -->

	<!-- Start banner Area -->
	<div class="container" style="background-color: black">
		<img src="../mypage/default_wishlist_image.png" class="img-fluid">
	</div>
	<!-- End banner Area -->
	<!-- Start main body Area -->
	<div></div>
	<div class="container">
		<c:if test="${count== 0 }">
			<div class="row" style="margin: 30px;">
				<div style="margin: 10px; height: 100px; text-align: center;"
					id="pro_content">
					<h3>사람들이 회원님을 쉽게 찾고 더 알아갈 수 있도록 하려면 사진과 정보를 프로필에 추가하세요!</h3>
				</div>
			</div>
		</c:if>
		<c:if test="${count !=0 }">
			<div class="row gallery-item">
					<div class="col-md-4">
						<a href="#" class="img-pop-up"> <b>장소이름</b> </a>
						<div class="single-gallery-image"
							style="background: url(../img/reservation.jpg);"></div>
					</div>
					<div class="col-md-4">
						<a href="#" class="img-pop-up"></a>
							<div class="single-gallery-image"
								style="background: url(http://thumb.mt.co.kr/06/2015/09/2015090113044789486_3.jpg?time=061749);"></div>
						
					</div>
					<div class="col-md-4">
						<a href="#" class="img-pop-up"></a>
							<div class="single-gallery-image"
								style="background: url(http://mblogthumb1.phinf.naver.net/MjAxODEyMDJfMjQ5/MDAxNTQzNzUxNTQ3ODY0.AWuIqj0_VBTe5oihCBY2kGGSiM3-qJ4bLvVQIlxsWRwg.udnLbixfCY01EXF6rMiTTNzycT-B2IjWkBXAb1Us7wcg.JPEG.cy9678/IMG_2721.jpg?type=w773);"></div>
						
					</div>
					<div class="col-md-6">
						<a href="#" class="img-pop-up"></a>
							<div class="single-gallery-image"
								style="background: url(https://t1.daumcdn.net/news/201805/04/moneytoday/20180504141224105ruxk.jpg);"></div>
						
					</div>
					<div class="col-md-6">
						<a href="#" class="img-pop-up"></a>
							<div class="single-gallery-image"
								style="background: url(http://t1.daumcdn.net/encyclop/m138/DTzBphhyJljScDLgZ7UYWasOSeuIjsPbrcZxgGlZ);"></div>
					</div>
			</div>
		</c:if>
	</div>





	<!-- Start main body Area -->

	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBhOdIF3Y9382fqJYt5I_sswSrEw5eihAA"></script>
	<script src="js/easing.min.js"></script>
	<script src="js/hoverIntent.js"></script>
	<script src="js/superfish.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/mail-script.js"></script>
	<script src="js/main.js"></script>
</body>