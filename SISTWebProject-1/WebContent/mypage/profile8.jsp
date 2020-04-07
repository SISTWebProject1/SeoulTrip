<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>profile</title>
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:700|Roboto:400,500"
	rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Lato:400,500,900'
	rel='stylesheet' type='text/css'>
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

<link rel="stylesheet" href="../css/profile_Instar.css">
<link rel="stylesheet" href="../css/upload.css">
<link rel="stylesheet" href="../css/dropdown.css">

<style type="text/css">
.body {
	background-color: black;
}

.row {
	margin: 50px;
}

.banner-area {
	background: gray;
	color: white;
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
</style>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script type="text/javascript">
	function upload() {
		window.open("upload.jsp", "upload",
				"width=800,height=500 scrollbars=yes");
	}
</script>
</head>
<body>
	<!-- Start banner Area -->
	<section class="banner-area relative">
		<div class="overlay overlay-bg"></div>
		<div class="container box_1170">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-md-4" style="text-align: center">
					<div >
						<h1 class="text-white">사진 추가</h1>
						<input type="file" />
					</div>

				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- blog Area -->
	<div class="container" style="margin: 10px;">
		<div class="profile">
			<div class="profile-image">
				<img
					src="https://images.unsplash.com/photo-1513721032312-6a18a42c8763?w=152&h=152&fit=crop&crop=faces"
					alt="">
			</div>
			<div class="profile-user-settings">
				<h1 class="profile-user-name">janedoe_</h1>
				<button class="btn profile-edit-btn" data-toggle="modal"
					data-target="#myModal">Edit Profile</button>
				<div>
					<div id="dropdown">
						<div id="drop-select" class="text-center">
							<img src="img/user.png" />
						</div>
						<div id="dropdown-list">
							<ul>
								<li>Filmore District</li>
								<li>Mission District</li>
								<li>Northshare Beach</li>
								<li>Some other branch</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="profile-stats">
				<ul>
					<li><span class="profile-stat-count">164</span> posts</li>
					<li><span class="profile-stat-count">188</span> followers</li>
					<li><span class="profile-stat-count">206</span> following</li>
				</ul>
			</div>
			<div class="profile-bio">
				<p>
					<span class="profile-real-name">Jane Doe</span> Lorem ipsum dolor
					sit, amet consectetur adipisicing elit 📷✈️🏕️
				</p>
			</div>
		</div>
		<!-- End of profile section -->
		<!-- Modal -->
		<jsp:include page="modal.jsp"></jsp:include>
		<!-- Modal end-->
	</div>
	<!-- End of container -->

	<nav style="background-color: black; height: 50px;">
		<ul class="nav-menu">
			<li><a href="find_review.jsp">활동 피드</a></li>
			<li><a href="wishlist.jsp">여행</a></li>
			<li><a href="#">사진</a></li>
			<li><a href="#">예약정보</a></li>
		</ul>
	</nav>


	<div class="container-fulid">
		<div class="info" style="height: 500px;">
			<div class="row" style="text-align: center">
				<div class="col-sm-3"
					style="background-color: gray; margin-top: 20px;">
					<div style="height: 50px; text-align: center; margin: 5px;">
						<ul style="text-align: left;">
							<li><h4>소개</h4></li>
						</ul>
						<ul style="text-align: left;">
							<li>~~날짜에 가입</li>
							<li><a href="#">홈페이지 추가</a></li>
							<li><a href="#">세부사항 작성</a> </ii>
						</ul>
					</div>
				</div>
				<div class="col-md-8"
					style="text-align: center; margin-left: 20px; background-color: gray">
					<div style="margin: 10px; height: 100px; text-align: center">
						<h3>프로필 작성</h3>

						<p>사람들이 회원님을 쉽게 찾고 더 알아갈 수 있도록 하려면 사진과 정보를 프로필에 추가하세요!</p>

					</div>
				</div>
			</div>
			<div class="row" style="text-align: center">
				<div class="col-sm-3"
					style="background-color: gray; margin-top: 20px; text-align: left">
					<div style="height: 100px; margin: 10px;">

						<h5>여행 조언을 공유하세요!</h5>
						<h4>
							<a onclick="upload();">사진 업로드</a>
						</h4>
						<h4>
							<a href="find_review.jsp">리뷰 쓰기</a>
						</h4>
					</div>
				</div>

			</div>
		</div>
	</div>
	<!-- Blog Area -->

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

</body>
</html>