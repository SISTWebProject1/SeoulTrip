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
#my_info >li{
	margin: 15px;
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
		<jsp:include page="my_image.jsp"></jsp:include>

	<!-- End banner Area -->

	<!-- blog Area -->
	<div class="container" style="margin: 10px;">
		<div class="profile">
			<div class="profile-image">
				<img src="${ss_member.photo }">
			</div>
			<div class="profile-user-settings" style="text-align: left">
				<h2 class="profile-user-name">${ss_member.name }</h2>
				<sub style="color: gray">ID:@${ss_member.memberId }</sub>
			</div>

			<div class="profile-bio" style="margin: 5px;">
				<ul id ="my_info"style="text-align: left;">
					<li><img src="../mypage/birth.png"
						style="width: 30px; float: left;">생일 : ${ss_member.birth }</li>
					<li><img src="../mypage/book.png"
						style="width: 30px; float: left;">가입일 : ${ss_member.regdate}</li>
					<li data-toggle="modal"
					data-target="#myModal" class="btn btn-sm btn-primary">세부사항 작성</li>
					<li class="btn btn-sm btn-primary">사진 업로드</li>
					<li class="btn btn-sm btn-primary">리뷰쓰기</li>
				</ul>
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
			<li><a href="../mypage/wishlist.do">여행</a></li>
			<li><a href="#">사진</a></li>
			<li><a href="#">예약정보</a></li>
		</ul>
	</nav>

	<div class="container-fulid">
		<div class="info">
			<div class="row" style="text-align: center; height: 500px;">
				<div class="col-md-8"
					style="text-align: center; margin-left: 20px; background-color: gray">
					<div style="margin: 10px; height: 100px; text-align: center">
						<h3>프로필 작성</h3>

						<p>사람들이 회원님을 쉽게 찾고 더 알아갈 수 있도록 하려면 사진과 정보를 프로필에 추가하세요!</p>

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