<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<title>Category</title>

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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.banner-area{
	height: 200px;
	
}
</style>
</head>

<body>
	<!-- End header Area -->

	<!-- Start banner Area -->
	<section class="banner-area relative">
		<div class="overlay overlay-bg"></div>
		<div class="container box_1170">
			<div class="row d-flex align-items-center justify-content-center">
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start main body Area -->
	<div>
		<h1 style="text-align: center"><b>여행</b></h1>
		<div style="margin-left: 430px;">
			<div class="btn btn-sm btn-primary">모든 여행</div>
			<div class="btn btn-sm btn-primary">관심리스트</div>
			<div class="btn btn-sm btn-primary">여행</div>
			<div class="btn btn-sm btn-primary">목록</div>
		</div>
	</div>
	<div class="container">
		<div class="row" style="margin: 30px;">
			<c:forEach var="i" begin="1" end="4">
			<div class="col-md-4">
				<div class="thumbnail" style="width:300px;height:300px;">
				<div style="height:70%;background-image: url('../img/reservation.jpg');">
			<a href="#">
			<span style="text-align: right;margin: 15px;"><img src="../mypage/heart2.gif" style="text-align: right;width:30px; height:30px;">
			</span></a>
				</div>
					<div class="caption">
						<ul>
						 	<li>장소 이름 :: 가나다란마ㅏ달낭란란ㅇ라날</li>
						 	<li>리뷰 : 점수</li> 
						 </ul>
						<div style="width: 37%" class="btn btn-sm btn-primary text-center">이동</div>
					</div>
				</div>
			</div>
			</c:forEach>
		</div>
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

</html>