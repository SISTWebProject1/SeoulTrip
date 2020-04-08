<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
<!-- Site Title -->
<title>Archive</title>

<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:700|Roboto:400,500"
	rel="stylesheet">

<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/main.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.12.1/css/all.css"
	integrity="sha384-v8BU367qNbs/aIZIxuivaU55N5GPF89WBerHoGA4QTcbUjYiLQtKdrfXnqAcXyTv"
	crossorigin="anonymous">
</head>
<body>
<!-- Start header Area -->
	<header id="header">
		<div class="container box_1170 main-menu">
			<div class="row align-items-center justify-content-between d-flex">
				<div id="logo">
					<a href="index.html"><img src="img/logo.png" alt="" title="" /></a>
				</div>
				<nav id="nav-menu-container">
					<ul class="nav-menu">
						<li class="menu-active"><a href="index.html">Home</a></li>
						<li><a href="category.html">Category</a></li>
						<li><a href="archive.html">Archive</a></li>
						<li class="menu-has-children"><a href="">Pages</a>
							<ul>
								<li><a href="elements.html">Elements</a></li>
							</ul></li>
						<li class="menu-has-children"><a href="">Blog</a>
							<ul>
								<li><a href="blog-details.html">Blog Details</a></li>
							</ul></li>
						<li><a href="contact.html">Contact</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</header>
	<!-- End header Area -->

	<!-- Start banner Area -->
	<section class="banner-area relative">
		<div class="overlay overlay-bg"></div>
		<div class="container box_1170">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="header_1 col-lg-12">
					<div class="header_2 link-nav">
						<a href="index.html">서울</a> <span class="lnr lnr-arrow-right"></span>
						<a href="archive.html">음식점</a>
					</div>
					<h1 class="header_3">카테고리</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->


	<!-- Start main body Area -->
	<div class="main-body body-gap">
		<div class="container box_1170">
			<div class="row">
				<!-- Start Post Area -->


				<div class="col-lg-3 sidebar">
					<div class="single-widget search-widget">
						<form class="map_map" action="#"
							style="margin: auto; max-width: 250px; max-height: 150px">
							<img src="https://static.tacdn.com/img2/maps/img_map.png" alt=""
								style="max-width: 220px; height: auto; border-radius: 5px 5px 5px 5px; width: 100%; position: relative;">
							<div class="map_top">
								<button class="map_button" type="button" onclick=""
									style="width: 100%; position: relative;">지도 보기</button>
							</div>
						</form>
					</div>

					<!-- 스크립트 부분 / 사용한 CDN (jQuery 3.3.1)-->

					<script
						src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
					<script type="text/javascript">
						$(document).ready(function() {
							// .check 클래스 중 어떤 원소가 체크되었을 때 발생하는 이벤트
							$(".check").click(function() { // 여기서 .click은 체크박스의 체크를 뜻한다.
								var str = ""; // 여러개가 눌렸을 때 전부 출력이 될 수 있게 하나의 객체에 담는다.
								$(".check").each(function() { // .each()는 forEach를 뜻한다.
									if ($(this).is(":checked")) // ":checked"를 이용하여 체크가 되어있는지 아닌지 확인한다.
										str += $(this).val() + ""; // 체크된 객체를 str에 저장한다.
								});
								$("#multiPrint").text(str); // #multiPrint에 체크된 원소를 출력한다.
							});

							// 전부 체크하는 방법
							$("#allCheck").click(function() {
								if ($(this).is(":checked")) // 먼저 #allCheck가 선택되었는지 확인한다.
									// 체크가 되어있으면 .check의 모든 원소에 checked="checked"를 추가한다.
									$(".check").attr("checked", "checked")
								else
									$(".check").removeAttr("checked") // 체크가 안 되어있으면 "checked"를 제거한다.
									// 이 때 체크가 되어있는 원소는 안 바뀐다. 어디까지나 체크가 안 된 것들에 대해서만 효과가 있다.
								var str = ""; // 여러개가 눌렸을 때 전부 출력이 될 수 있게 하나의 객체에 담는다.
								$(".check").each(function() { // .each()는 forEach를 뜻한다.
									if ($(this).is(":checked")) // ":checked"를 이용하여 체크가 되어있는지 아닌지 확인한다.
										str += $(this).val() + " "; // 체크된 객체를 str에 저장한다.
								});
								$("#multiPrint").text(str); // #multiPrint에 체크된 원소를 출력한다.
							});
						});
					</script>




					<div class="single-widget food_left">
						<div class="food_type">
							<span id="multiPrint"></span><br />
							<div class="food_type_name">
								<h5>음식점 타입</h5>
							</div>
							<div class="food_type_detail">
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox" class="check" value="간단한음식">간단한음식
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox" class="check" value="디저트">디저트
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox" class="check" value="커피&차">커피&차
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox" class="check" value="베이커리">베이커리
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox" class="check" value="바&펍">바&펍
									</div>
								</div>
								<br>
							</div>
						</div>
						<div class="food_type">
							<div class="food_type_name">
								<h5>식사 시간</h5>
							</div>
							<div class="food_type_detail">
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">아침
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">브런치
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">점심
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">저녁
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">간식
									</div>
								</div>
								<br>
							</div>
						</div>
						<div class="food_type">
							<div class="food_type_name">
								<h5>가격대</h5>
							</div>
							<div class="food_type_detail">
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">저렴
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">보통
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">고급
									</div>
									<br>
								</div>
							</div>
						</div>
						<div class="food_type">
							<div class="food_type_name">
								<h5>세계 요리</h5>
							</div>
							<div class="food_type_detail">
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">한식
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">중식
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">양식
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">일식
									</div>
									<br>
								</div>
							</div>
						</div>
						<div class="food_type">
							<div class="food_type_name">
								<h5>지역</h5>
							</div>
							<div class="food_type_detail">
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">마포구
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">종로구
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">중구
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">송파구
									</div>
									<br>
								</div>
							</div>
						</div>
						<div class="food_type">
							<div class="food_type_name">
								<h5>추천 대상</h5>
							</div>
							<div class="food_type_detail">
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">커플
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">혼자
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">친구
									</div>
								</div>
								<div class="food_input">
									<div class="food_input_detail">
										<input type="checkbox">가족
									</div>
									<br>
								</div>
							</div>
						</div>
					</div>
				</div>


				<!-- 오른쪽  -->
				<div class="col-lg-9 post-list">
					<div class="container-fluid bg-3 text-center">
						<h3 style="">음식으로 서울여행</h3>
						<br>
						<div class="row">
							<div class="col-sm-3" style="cursor: pointer;" onclick="location.href='blog-details.html'">
								<div class="cate-img"
									style="position: relative; opacity: 0.4; padding-top: 50%; overflow: hidden;">
									<img src="../ruft/img/archive/seafood.jpg"
										class="img-responsive" alt="Image">
								</div>
								<div class="img-text">
									<p>해산물</p>
								</div>
							</div>
							<div class="col-sm-3" style="cursor: pointer;" onclick="location.href='blog-details.html'">
								<div class="cate-img"
									style="position: relative; opacity: 0.4; padding-top: 50%; overflow: hidden;">
									<img src="../ruft/img/archive/coffe.jpg" class="img-responsive"
										alt="Image">
								</div>
								<div class="img-text">
									<p>카페</p>
								</div>
							</div>
							<div class="col-sm-3" style="cursor: pointer;" onclick="location.href='blog-details.html'">
								<div class="cate-img"
									style="position: relative; opacity: 0.4; padding-top: 50%; overflow: hidden;">
									<img src="../ruft/img/archive/pizza11.jpg"
										class="img-responsive" alt="Image">
								</div>
								<div class="img-text">
									<p>피자</p>
								</div>
							</div>
							<div class="col-sm-3" style="cursor: pointer;" onclick="location.href='blog-details.html'">
								<div class="cate-img"
									style="position: relative; opacity: 0.4; padding-top: 50%; overflow: hidden;">
									<img src="../ruft/img/archive/koreafood.jpg"
										class="img-responsive" alt="Image">
								</div>
								<div class="img-text">
									<p>한식</p>
								</div>
							</div>
						</div>
					</div>
					<br>

					<div class="container-fluid bg-3 text-center">
						<div class="row">
							<div class="col-sm-3" style="cursor: pointer;" onclick="location.href='blog-details.html'">
									<div class="cate-img"
										style="position: relative; opacity: 0.4; padding-top: 50%; overflow: hidden;">
										<img src="../ruft/img/archive/indiafood.jpeg"
											class="img-responsive" alt="Image">
									</div>
								<div class="img-text">
									<p>인도요리</p>
								</div>
							</div>
							
							<div class="col-sm-3" style="cursor: pointer;" onclick="location.href='blog-details.html'">
								<div class="cate-img"
									style="position: relative; opacity: 0.4; padding-top: 50%; overflow: hidden;">
									<img src="../ruft/img/archive/japanfood.jpg"
										class="img-responsive" alt="Image">
								</div>
								<div class="img-text">
									<p>일식</p>
								</div>
							</div>
							<div class="col-sm-3" style="cursor: pointer;" onclick="location.href='blog-details.html'">
								<div class="cate-img"
									style="position: relative; opacity: 0.4; padding-top: 50%; overflow: hidden;">
									<img src="../ruft/img/archive/thaifood.jpg"
										class="img-responsive" alt="Image">
								</div>
								<div class="img-text">
									<p>동남아음식</p>
								</div>
							</div>
							<div class="col-sm-3" style="cursor: pointer;" onclick="location.href='blog-details.html'">
								<div class="cate-img"
									style="position: relative; opacity: 0.4; padding-top: 50%; overflow: hidden;">
									<img src="../ruft/img/archive/meat.jpg" class="img-responsive"
										alt="Image">
								</div>
								<div class="img-text">
									<p>고기</p>
								</div>
							</div>
						</div>
					</div>

					<br> <br>


					<!-- Start Post Area -->
					<section class="post-area">
						<div class="detail_foodset">
							<h3>
								<p>고급 정찬</p>

							</h3>
							<div class="row food-catetop">
								<div class="col-lg-3 col-md-3">
									<div class="single-post-item short">
										<figure>
											<a href="blog-details.html"><img
												class="post-img img-fluid"
												src="../ruft/img/archive/restaurant_01.jpg" alt=""></a>
										</figure>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="fas fa-heart"></i>
											</button>
										</div>
										<div class="detail_food3">
											<h4>
												<a href="blog-details.html">점포명</a>
											</h4>
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 90%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											&nbsp; <a href="">리뷰 xx건</a>
											<div class="detail_food3_tag">#일식</div>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-md-3">
									<div class="single-post-item short">
										<figure>
											<a href="blog-details.html"><img
												class="post-img img-fluid"
												src="../ruft/img/archive/restaurant_01.jpg" alt=""></a>
										</figure>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="fas fa-heart"></i>
											</button>
										</div>
										<div class="detail_food3">
											<h4>
												<a href="blog-details.html">점포명</a>
											</h4>
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 90%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											&nbsp; <a href="">리뷰 xx건</a>
											<div class="detail_food3_tag">#오래된 #분위기좋은</div>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-md-3">
									<div class="single-post-item short">
										<figure>
											<a href="blog-details.html"><img
												class="post-img img-fluid"
												src="../ruft/img/archive/restaurant_01.jpg" alt=""></a>
										</figure>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="fas fa-heart"></i>
											</button>

										</div>
										<div class="detail_food3">
											<h4>
												<a href="blog-details.html">점포명</a>
											</h4>
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 80%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											&nbsp; <a href="">리뷰 xx건</a>
											<div class="detail_food3_tag">#한식 #저렴</div>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-md-3">
									<div class="single-post-item short">
										<figure>
											<a href="blog-details.html"><img
												class="post-img img-fluid"
												src="../ruft/img/archive/restaurant_01.jpg" alt=""></a>
										</figure>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="fas fa-heart"></i>
											</button>

										</div>
										<div class="detail_food3">
											<h4>
												<a href="blog-details.html">점포명</a>
											</h4>
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 90%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											&nbsp; <a href="">리뷰 xx건</a>
											<div class="detail_food3_tag">#양식</div>
										</div>
									</div>
								</div>
							</div>
						</div>


						<div class="detail_foodset">
							<h3>
								<p>저녁 식사</p>
							</h3>
							<div class="row">
								<div class="col-lg-3 col-md-3">
									<div class="single-post-item short">
										<figure>
											<a href="blog-details.html"><img
												class="post-img img-fluid"
												src="../ruft/img/archive/restaurant_01.jpg" alt=""></a>
										</figure>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="fas fa-heart"></i>
											</button>

										</div>
										<div class="detail_foodset_name">
											<h4>
												<a href="blog-details.html">점포명</a>
											</h4>
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 90%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											&nbsp; <a href="">리뷰 xx건</a>
											<div class="detail_foodset_tag">#일식</div>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-md-3">
									<div class="single-post-item short">
										<figure>
											<a href="blog-details.html"><img
												class="post-img img-fluid"
												src="../ruft/img/archive/restaurant_01.jpg" alt=""></a>
										</figure>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="fas fa-heart"></i>
											</button>

										</div>
										<div class="detail_food3">
											<h4>
												<a href="blog-details.html">점포명</a>
											</h4>
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 90%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											&nbsp; <a href="">리뷰 xx건</a>
											<div class="detail_food3_tag">#오래된 #분위기좋은</div>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-md-3">
									<div class="single-post-item short">
										<figure>
											<a href="blog-details.html"><img
												class="post-img img-fluid"
												src="../ruft/img/archive/restaurant_01.jpg" alt=""></a>
										</figure>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="fas fa-heart"></i>
											</button>

										</div>
										<div class="detail_food3">
											<h4>
												<a href="blog-details.html">점포명</a>
											</h4>
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 80%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											&nbsp; <a href="">리뷰 xx건</a>
											<div class="detail_food3_tag">#한식 #저렴</div>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-md-3">
									<div class="single-post-item short">
										<figure>
											<a href="blog-details.html"><img
												class="post-img img-fluid"
												src="../ruft/img/archive/restaurant_01.jpg" alt=""></a>
										</figure>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="fas fa-heart"></i>
											</button>

										</div>
										<div class="detail_food3">
											<h4>
												<a href="blog-details.html">점포명</a>
											</h4>
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 90%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											&nbsp; <a href="">리뷰 xx건</a>
											<div class="detail_food3_tag">#양식</div>
										</div>
									</div>
								</div>
							</div>
						</div>



						<div class="detail_foodset">
							<h3>
								<p>인기많은</p>
							</h3>
							<div class="row">
								<div class="col-lg-3 col-md-3">
									<div class="single-post-item short">
										<figure>
											<a href="blog-details.html"><img
												class="post-img img-fluid"
												src="../ruft/img/archive/restaurant_01.jpg" alt=""></a>
										</figure>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="fas fa-heart"></i>
											</button>
										</div>
										<div class="detail_foodset_name">
											<h4>
												<a href="blog-details.html">점포명</a>
											</h4>
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 90%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											&nbsp; <a href="">리뷰 xx건</a>
											<div class="detail_foodset_tag">#일식</div>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-md-3">
									<div class="single-post-item short">
										<figure>
											<a href="blog-details.html"><img
												class="post-img img-fluid"
												src="../ruft/img/archive/restaurant_01.jpg" alt=""></a>
										</figure>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="fas fa-heart"></i>
											</button>
										</div>
										<div class="detail_food3">
											<h4>
												<a href="blog-details.html">점포명</a>
											</h4>
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 90%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											&nbsp; <a href="">리뷰 xx건</a>
											<div class="detail_food3_tag">#오래된 #분위기좋은</div>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-md-3">
									<div class="single-post-item short">
										<figure>
											<a href="blog-details.html"><img
												class="post-img img-fluid"
												src="../ruft/img/archive/restaurant_01.jpg" alt=""></a>
										</figure>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="fas fa-heart"></i>
											</button>
										</div>
										<div class="detail_food3">
											<h4>
												<a href="blog-details.html">점포명</a>
											</h4>
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 80%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											&nbsp; <a href="">리뷰 xx건</a>
											<div class="detail_food3_tag">#한식 #저렴</div>
										</div>
									</div>
								</div>
								<div class="col-lg-3 col-md-3">
									<div class="single-post-item short">
										<figure>
											<a href="blog-details.html"><img
												class="post-img img-fluid"
												src="../ruft/img/archive/restaurant_01.jpg" alt=""></a>
										</figure>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="fas fa-heart"></i>
											</button>
										</div>
										<div class="detail_food3">
											<h4>
												<a href="blog-details.html">점포명</a>
											</h4>
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 90%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											&nbsp; <a href="">리뷰 xx건</a>
											<div class="detail_food3_tag">#양식</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-12">
							<div class="body_main_set">
								<div class="row">
									<div class="col-lg-4 col-md-4">
										<a href=""><img class="post-img img-fluid" alt="음식점사진"
											style="border-radius: 10px 10px 10px 10px;"
											src="https://media-cdn.tripadvisor.com/media/photo-p/12/f9/51/7c/photo1jpg.jpg"></a>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="far fa-heart fa-fw"></i>
											</button>
										</div>
									</div>
									<div class="col-lg-8 col-md-8">
										<div class="body_main_text_title">1.농민백암왕순대</div>
										<div class="body_main_text_info">
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 90%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											<div class="body_main_text_info_reviewNum">&nbsp;xxx건의
												리뷰</div>
											<div class="body_main_text_info_foodtype">#한식 #저렴 #점심</div>
										</div>
										<div class="body_main_text_info_bestreview">
											<div class="body_main_text_info_bestreview_one">
												<i class="fas fa-quote-right"></i>&nbsp;&nbsp;&nbsp;제육백반
												강추입니다 ㅎㅎ
											</div>
											<div class="body_main_text_info_bestreview_two">
												<i class="fas fa-quote-right"></i>&nbsp;&nbsp;&nbsp;돈 받고
												먹으라고 해도 여긴 좀...
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="body_main_set">
								<div class="row">
									<div class="col-lg-4 col-md-4">
										<a href=""><img class="post-img img-fluid" alt="음식점사진"
											style="border-radius: 10px 10px 10px 10px;"
											src="https://media-cdn.tripadvisor.com/media/photo-p/12/f9/51/7c/photo1jpg.jpg"></a>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="far fa-heart fa-fw"></i>
											</button>
										</div>
									</div>
									<div class="col-lg-8 col-md-8">
										<div class="body_main_text_title">1.농민백암왕순대</div>
										<div class="body_main_text_info">
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 90%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											<div class="body_main_text_info_reviewNum">&nbsp;xxx건의
												리뷰</div>
											<div class="body_main_text_info_foodtype">#한식 #저렴 #점심</div>
										</div>
										<div class="body_main_text_info_bestreview">
											<div class="body_main_text_info_bestreview_one">
												<i class="fas fa-quote-right"></i>&nbsp;&nbsp;&nbsp;제육백반
												강추입니다 ㅎㅎ
											</div>
											<div class="body_main_text_info_bestreview_two">
												<i class="fas fa-quote-right"></i>&nbsp;&nbsp;&nbsp;돈 받고
												먹으라고 해도 여긴 좀...
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="body_main_set">
								<div class="row">
									<div class="col-lg-4 col-md-4">
										<a href=""><img class="post-img img-fluid" alt="음식점사진"
											style="border-radius: 10px 10px 10px 10px;"
											src="https://media-cdn.tripadvisor.com/media/photo-p/12/f9/51/7c/photo1jpg.jpg"></a>
										<div class="heart">
											<button class="heart_button" type="button">
												<i class="far fa-heart fa-fw"></i>
											</button>
										</div>
									</div>
									<div class="col-lg-8 col-md-8">
										<div class="body_main_text_title">1.농민백암왕순대</div>
										<div class="body_main_text_info">
											<div
												style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
												<p
													style="WIDTH: 90%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
												</p>
											</div>
											<div class="body_main_text_info_reviewNum">&nbsp;xxx건의
												리뷰</div>
											<div class="body_main_text_info_foodtype">#한식 #저렴 #점심</div>
										</div>
										<div class="body_main_text_info_bestreview">
											<div class="body_main_text_info_bestreview_one">
												<i class="fas fa-quote-right"></i>&nbsp;&nbsp;&nbsp;제육백반
												강추입니다 ㅎㅎ
											</div>
											<div class="body_main_text_info_bestreview_two">
												<i class="fas fa-quote-right"></i>&nbsp;&nbsp;&nbsp;돈 받고
												먹으라고 해도 여긴 좀...
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>

						<br> <br>





						<!-- 						<div class="col-lg-12">
							<div class="left-photo">
								<figure>
									<a href="blog-details.html"><img class="food-post"
										src="../ruft/img/archive/restaurant_01.jpg" alt=""></a>
								</figure>
								<div class="heart">
									<button class="heart_button" type="button">
										<img src="../ruft/img/archive/heart.png" alt="">
									</button>
								</div>
							</div>
							<div class="left-detail">
							
							
							</div>

						</div> -->






						<div class="col-lg-12">
							<nav class="blog-pagination justify-content-center d-flex">
								<ul class="pagination">
									<li class="page-item"><a href="#" class="page-link"
										aria-label="Previous"> <span aria-hidden="true"> <span
												class="lnr lnr-arrow-left"></span>
										</span>
									</a></li>
									<li class="page-item"><a href="#" class="page-link">01</a></li>
									<li class="page-item active"><a href="#" class="page-link">02</a></li>
									<li class="page-item"><a href="#" class="page-link">03</a></li>
									<li class="page-item"><a href="#" class="page-link">04</a></li>
									<li class="page-item"><a href="#" class="page-link">09</a></li>
									<li class="page-item"><a href="#" class="page-link"
										aria-label="Next"> <span aria-hidden="true"> <span
												class="lnr lnr-arrow-right"></span>
										</span>
									</a></li>
								</ul>
							</nav>
						</div>
				</div>
				</section>
			</div>
		</div>
	</div>

	<!-- Start main body Area -->

	<!-- start footer Area -->
	<footer class="footer-area section-gap">
		<div class="container box_1170">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6 class="footer_title">About Us</h6>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore dolore magna aliqua.</p>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6 class="footer_title">Newsletter</h6>
						<p>Stay updated with our latest trends</p>
						<div id="mc_embed_signup">
							<form target="_blank"
								action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
								method="get" class="subscribe_form relative">
								<div class="input-group d-flex flex-row">
									<input name="EMAIL" placeholder="Email Address"
										onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Email Address '" required=""
										type="email">
									<button class="btn sub-btn">
										<span class="lnr lnr-arrow-right"></span>
									</button>
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
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-dribbble"></i></a> <a href="#"><i
								class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div
				class="row footer-bottom d-flex justify-content-between align-items-center">
				<p class="col-lg-12 footer-text text-center">
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script>
						document.write(new Date().getFullYear());
					</script>
					All rights reserved | This template is made with <i
						class="fa fa-heart-o" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

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
	<script type="text/javascript"></script>
</body>
</html>