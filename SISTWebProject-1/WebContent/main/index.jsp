<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<!-- Mobile Specific Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
<title>Ruft Blog</title>

<link href="https://fonts.googleapis.com/css?family=Playfair+Display:700|Roboto:400,500" rel="stylesheet">
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
<link rel="stylesheet" href="../css/detail.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/main.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css"
	integrity="sha384-v8BU367qNbs/aIZIxuivaU55N5GPF89WBerHoGA4QTcbUjYiLQtKdrfXnqAcXyTv"
	crossorigin="anonymous">

<script type="text/javascript">
	document.addEventListener('scroll',()=>{
		if(window.scrollY < 200){
			$('#header .search-widget').css({"display":"none"});
		} else {
			$('#header .search-widget').css({"display":"block"});
		}
	});
	
	function login_show() {
		document.getElementById('login').style.display = "block";
	}
	
	function login_hide() {
		document.getElementById('login').style.display = "none";
	}
</script>
</head>

<body>

<!-- Start header Area -->
	<header id="header">
		<div class="container-fluid box_1170 main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="../home/home.do"><img src="../img/logo.png" width="100" height="60"></a>
				</div>
				
				<div class="single-widget search-widget" style="display: none;">
					<form class="example" action="#" style="margin:auto;max-width:300px">
						<input type="text" placeholder="검색" name="search2">
						<button type="submit"><i class="fa fa-search"></i></button>
					</form>
				</div>
				
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li class="menu-active"><a href="../home/home.do">Home</a></li>
						<li><a href="../category/tourplace.do">명소</a></li>
						<li><a href="../category/food.do">음식점</a></li>
						<li><a href="../category/festival.do">축제</a></li>
            			<li><a href="../detail/detail_review.do?type=1&no=198&page=1">DetailTest</a>
            			<li><a href="../reservation/reservation.do">ReservationTest</a>
						<li class="menu-has-children"><a href="">마이페이지</a>
							<ul>
								<li><a href="../mypage/profile.do">프로필</a></li>
								<li><a href="../mypage/wishlist.do">위시리스트</a></li>
								<li><a href="../mypage/reservation.do">예약내역</a></li>
							</ul>
						</li>
						<c:choose>
							<c:when test="${ not empty ss_member }">
								<li><a href="../logout_ok.do">Logout</a></li>
								<li><a href="#"><img src="${ ss_member.photo }">${ ss_member.name }님 환영합니다.</a></li>
							</c:when>
							
							<c:otherwise>
								<li><a href="javascript:login_show()" id="loginShow">Login</a></li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	
	<!-- Start login Area -->	
	<div id="login" class="text-center">
		<div class="login_content">
			<form method="post" action="../login_ok.do" target="_blank">
			  <div class="input-group">
			    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
			    <input id="email" type="text" class="form-control" name="email" placeholder="ID">
			  </div>
			  <div class="input-group">
			    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
			    <input id="password" type="password" class="form-control" name="password" placeholder="Password">
			  </div>
			  <p id="login_alert" class="text-right">&nbsp;</p>
			  <div class="input-group">
			    <input type="login" class="btn btn-sm btn-primary" value="login">
				<input type="reset" class="btn btn-sm btn-danger" value="cancel" onclick="login_hide()">
			  </div>
			</form>
		</div>
		
		<div class="login_back" onclick="login_hide()"></div>
	</div>
	<!-- End login Area -->
	
	<!-- Start banner Area -->
	<c:if test="${ banner_on == true }">
		<jsp:include page="main_banner.jsp"/>
	</c:if>
	<!-- Start banner Area -->
	
<!-- End header Area -->

<!-- Start content Area ============================================================================= -->
 	<jsp:include page="${main_jsp}"/>
<!-- End content Area =============================================================================== -->

<!-- start footer Area -->
	<footer class="footer-area section-gap">
		<div class="container box_1170">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6 class="footer_title">About Us</h6>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore dolore
							magna aliqua.</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6 class="footer_title">Newsletter</h6>
						<p>Stay updated with our latest trends</p>
						<div id="mc_embed_signup">
							<form target="_blank" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
							 method="get" class="subscribe_form relative">
								<div class="input-group d-flex flex-row">
									<input name="EMAIL" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address '"
									 required="" type="email">
									<button class="btn sub-btn"><span class="lnr lnr-arrow-right"></span></button>
								</div>
								<div class="mt-10 info"></div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-6 col-sm-6">
					<div class="single-footer-widget instafeed">
						<h6 class="footer_title">Instagram Feed</h6>
						<ul class="list instafeed d-flex flex-wrap">
							<li><img src="img/i1.jpg" alt=""></li>
							<li><img src="img/i2.jpg" alt=""></li>
							<li><img src="img/i3.jpg" alt=""></li>
							<li><img src="img/i4.jpg" alt=""></li>
							<li><img src="img/i5.jpg" alt=""></li>
							<li><img src="img/i6.jpg" alt=""></li>
							<li><img src="img/i7.jpg" alt=""></li>
							<li><img src="img/i8.jpg" alt=""></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget f_social_wd">
						<h6 class="footer_title">Follow Us</h6>
						<p>Let us be social</p>
						<div class="f_social">
							<a href="#"><i class="fa fa-facebook"></i></a>
							<a href="#"><i class="fa fa-twitter"></i></a>
							<a href="#"><i class="fa fa-dribbble"></i></a>
							<a href="#"><i class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row footer-bottom d-flex justify-content-between align-items-center">
				<p class="col-lg-12 footer-text text-center"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
			</div>
		</div>
		
		<input id="memberInfo" type="hidden" value="asdf"/>
		
	</footer>
<!-- End footer Area -->

<script src="../js/vendor/jquery-2.2.4.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
 crossorigin="anonymous"></script>
 <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=32be74c036d5c62bdc64696f8f5ab2ea"></script>
 
<script src="../js/vendor/bootstrap.min.js"></script>
<script src="../js/easing.min.js"></script>
<script src="../js/hoverIntent.js"></script>
<script src="../js/superfish.min.js"></script>
<script src="../js/jquery.ajaxchimp.min.js"></script>
<script src="../js/jquery.magnific-popup.min.js"></script>
<script src="../js/owl.carousel.min.js"></script>
<script src="../js/jquery.nice-select.min.js"></script>
<script src="../js/waypoints.min.js"></script>
<script src="../js/mail-script.js"></script>
<script src="../js/main.js"></script>
<script src="../js/detail/imageGallery.js"></script>
<script src="../js/detail/scrolling.js"></script>
<script src="../js/detail/selectBoard.js"></script>
<script src="../js/category.js"></script>
</body>
</html>