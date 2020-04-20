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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
 $(function(){
	$('.submit-btn').hover(function(){
		 $(this).css('cursor','pointer');
	},function(){
		$(this).css('cursor','none');	
	})
	
	$('.submit-btn').click(function(){
		 $('#name').text($(this).text());
		 $('#tel').text($(this).text());
		 $('#email').text($(this).text());
		 $('#person').text($(this).text());
		 $('#time').text($(this).text());
		 $('#date').text($(this).text());
		$.ajax({
			type:'POST',
			success:function(res)
			{
				$('#result').html(res);
			}
		})
	})
 })

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
			
<div class="container" >
		<div class="section">
				<div class="row" colspan="2">
						<div class="booking-form col-md-6 col-md-offset-1" style="width:100%; border:1px solid blue; float:left;">
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<input class="form-control" type="text" name=name id=name required>
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
									<button class="submit-btn col-md-6"  >예약하기</button>
									<button class="submit-btn col-md-6" 
										onclick="javascript:history.back()"
									>취소하기</button>
								</div>
						</div>	
			<%-- ==========================================Ajax출력단========================================== --%>						
						<div class="booking-form col-md-6 col-md-offset-1" id="result" style="border:1px solid red; float:left;">
						 <p class="form-group">예약자명 | &nbsp;&nbsp; <b>${name}</b> </p>
						 <p class="form-group">e-mail | &nbsp;&nbsp;<b>${email} </b></p>
						 <p class="form-group">전화번호 | &nbsp;&nbsp; <b>${tel}</b></p>
						 <p class="form-group">예약시간 | &nbsp;&nbsp; <b>${time}</b></p>
						 <p class="form-group">예약인원 | &nbsp;&nbsp; <b>${inwon}</b></p>
						 <p class="form-group">예약날짜 | &nbsp;&nbsp; <b>${reservationdate}</b></p>
						</div>
					</div>	
			<%-- ==========================================Ajax출력단========================================== --%>					
						<div class="row col-md-6 col-md-offset-1">
						<div id="map"  style="width:500px;height:400px; border:0px solid white;"></div>
					
					</div>			
				</div>			
			</div>



<div class="container">
<section class="contact-page-area section-gap">	
		   	<div class="form-group col-md-6 col-md-offset-1" style="width:100%; height:auto; overflow:hidden;">
						<img src="../img/reservation.jpg" style="max-width:100%; height:auto;">
			</div>	
			<div class="row-info col-md-6">
				<div class="col-lg-4 d-flex flex-column address-wrap">
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-home"></span>
						</div>
						<div class="contact-details">
							<h5>${vo.rname }</h5>
							<p>${vo.addr1 } 
							|
							 ${vo.addr2 }</p>
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
</section>
</div>	

		
			
						<!--  Kakao Map -->
								
								<script>
									var container = document.getElementById('map');
									var options = {					
										center: new kakao.maps.LatLng(37.515343,127.019066),
										/*${vo.mapX}, ${vo.mapY}  */
										level: 3
									};
							
									var map = new kakao.maps.Map(container, options);
								</script>
		   	

	
	
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