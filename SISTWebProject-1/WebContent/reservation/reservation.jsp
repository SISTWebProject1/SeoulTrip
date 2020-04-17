<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="zxx" class="no-js">

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
	<title>Reservation</title>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=32be74c036d5c62bdc64696f8f5ab2ea"></script>
	
	<link href="https://fonts.googleapis.com/css?family=Playfair+Display:700|Roboto:400,500" rel="stylesheet">
	
	
	<link type="text/css" rel="stylesheet" href="../css/style.css" />

<script type="text/javascript">
/*  $(function(){
	$('.submit-btn').click(function(){
		document.frm.value();
		$.ajax({
			type:'POST',
			url:'../reservation/reservation_ok.do',		
			success:function(res)
			{
				$('#result').html(res);
			},
			error:function(e)
			{
				alert(e);
			}
		})
	}) 
 })
 */
 
</script>
</head>

<body>


	<!-- start banner Area -->
	<section class="banner-area relative">
		<div class="overlay overlay-bg"></div>
		<div class="container">
			<div class="row d-flex align-items-center justify-content-center">
				<div class="about-content col-lg-12">
					<h1 class="text-white">
						Reservation
					</h1>
					<p class="text-white link-nav"><a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span> <a href="contact.html">
							Reservation</a></p>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->

	<!-- Start contact-page Area -->
			
	<section class="section">
		<div id="booking" class="section">
		<div class="section-center">
			<div class="container" >
			
				<div class="row" style="width:100%;">
				 
					<div class="col-md-6 col-md-offset-1" >
						<div class="booking-form">
						<form method="POST" action="../reservation/reservation_ok.do">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<input class="form-control" type="text" name=name required>
											<span class="form-label">예약자명</span>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="email" name=email required>
											<span class="form-label">Email</span>
										</div>
									</div>
									
								</div>
								
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="tel" name=tel required>
											<span class="form-label">전화번호</span>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<span class="form-label">예약시간</span>
											<select class="form-control" name=time >
											<c:forEach var="i" begin="11" end="18">
												<option>${i}:00</option>		
											</c:forEach>
											</select>
											<span class="select-arrow"></span>
										</div>
									</div>
									
									<div class="col-md-12">
										<div class="form-group">
											<span class="form-label">예약인원</span>
											<select class="form-control" name=person>
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
											</select>
											<span class="select-arrow"></span>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<input class="form-control" type="date" name=date required>
											<span class="form-label">Date</span>
										</div>
									</div>
								</div>
								<div class="form-btn">
									<button class="submit-btn col-md-6" >예약하기</button>
									<button class="submit-btn col-md-6" 
										onclick="javascript:history.back()"
									>취소하기</button>
								</div>
							</form>
						</div>	
					</div>	
					
					<div style="width:40%; height:auto; overflow:hidden;">	
					<img src="../img/reservation.jpg" style="max-width:100%; height:auto;">
					</div>
						
				</div>
				
				<div class="row" id="result"></div>
			
			</div>
		</div>
	</div>
</section>	

<section class="contact-page-area section-gap">	
	<div class="container">
	
			<div class="row-info">
				<div class="col-lg-4 d-flex flex-column address-wrap">
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-home"></span>
						</div>
						<div class="contact-details">
							<h5>${vo.rname }</h5>
							<p>${vo.addr1 } | ${vo.addr2 }</p>
						</div>
					</div>
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-phone-handset"></span>
						</div>
						<div class="contact-details">
						
							
							<h5>${vo.openhour }</h5>  
						
							</div>
					</div>
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-envelope"></span>
						</div>
						<div class="contact-details">
						
								<a href="${vo.link}"><h5>http://www.aloftseoulmyeongdong.com/dining</h5></a>
							<p>Visit our website anytime!</p>
						</div>
					</div>
				</div>	
			</div>
			<div id="map" style="width:500px;height:400px; border:0px solid white;"></div>
							
						<!--  Kakao Map -->
								
								<script>
									var container = document.getElementById('map');
									var options = {					
										center: new kakao.maps.LatLng(${vo.mapX},${vo.mapY}),
										level: 3
									};
							
									var map = new kakao.maps.Map(container, options);
								</script>
		   	
			
		</div>
	</section>
	
	
	<script src="js/jquery.min.js"></script>
	<script>
		$('.form-control').each(function () {
			floatedLabel($(this));
		});

		$('.form-control').on('input', function () {
			floatedLabel($(this));
		});

		function floatedLabel(input) {
			var $field = input.closest('.form-group');
			if (input.val()) {
				$field.addClass('input-not-empty');
			} else {
				$field.removeClass('input-not-empty');
			}
		}
	</script>
	<!-- End contact-page Area -->

	
	

	
	

	
</body>

</html>