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
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
<style type="text/css">
body {
 font-family: 'Noto Sans KR', sans-serif;
 font-size: 15px;
}

h3,h5 {
 font-family: 'Noto Sans KR', sans-serif;
 font-size: 30px;
}

h2 {

 font-family: 'Noto Sans KR', sans-serif;
 font-size: 40px;

}

b {
 font-size: 15px; 
}
</style>
	
	
	<link type="text/css" rel="stylesheet" href="../css/style.css" />
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
 $(function(){
	$('#person').click(function(){
		 var person=$('#person').val();
		$.ajax({
			type:'post',
			url:'../reservation/reservation.do',
			success:function(res)
			{
				$('#data-person').text(person+"명");
				$('#person2').val(person);
			}
		})
	})
	$('#time').click(function(){
		 var time=$('#time').val();
		$.ajax({
			type:'post',
			url:'../reservation/reservation.do',
			success:function(res)
			{
				$('#data-time').text(time);
				$('#time2').val(time);
			}
		})
	})	
	$('#date').click(function(){
		 var date=$('#date').val();
		$.ajax({
			type:'post',
			url:'../reservation/reservation.do',
			success:function(res)
			{
				$('#data-date').text(date);
				$('#date2').val(date);
			}
		})
	})
	$('#name').keyup(function(){
		 var name=$('#name').val();
		$.ajax({
			type:'post',
			url:'../reservation/reservation.do',
			success:function(res)
			{
				$('#data-name').text(name);
				$('#name2').val(name);
			}
		})
	})
	
	$('#tel').keyup(function(){
		var tel=$('#tel').val();
		var email=$('#email').val();
		$.ajax({
			type:'post',
			url:'../reservation/reservation.do',
			success:function(res)
			{
				$('#data-tel').text(tel);
				$('#tel2').val(tel);
				$('#email2').val(email);
				$('#submit-btn').attr("disabled",false);
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
<!-- ==================================================================================================음식점정보 -->	
<div class="container">
	<div class="section">
	
	<h2 style="text-align:center;">&nbsp;&nbsp;${vo.rname }</h2>	
	
	<section class="contact-page-area" style="margin-top:20px;">	
		   	<div class="row-info col-md-6 col-md-offset-0" style="width:100%;">
						<img src="${vo.rphoto}" class="rphoto">
							<!--  ../img/reservation.jpg -->
			</div>	
			
			
			<div class="row-info col-md-6" >
				<div class="d-flex flex-column address-wrap">
					<br><br>
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-map"></span>
						</div>
						<div class="contact-details">
							<h5>${vo.addr1 }</h5>
							<br>
							<h5>${vo.addr2 }</h5>
						</div>
					</div>
					

					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-phone-handset"></span>
						</div>
						<div class="contact-details">
							<h5>${vo.tel }</h5>
						</div>	
					</div>
					
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-alarm"></span>
						</div>
						<div class="contact-details">
							<h5>${vo.openhour}</h5>  
						</div>
					</div>
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-diamond"></span>
						</div>
						<div class="contact-details">
							<h5>${vo.price}</h5>
						</div>
					</div>
				</div>	
			</div>
	</section>
</div>
</div>	
<!-- ==================================================================================================음식점정보 -->		
	
	
<!-- ==================================================================================================예약단 -->			
<div class="container">
		<div class="section section-center">

				
						<div class="booking-form col-md-6" style="width:100%;margin-left:10px; margin-top:5px; border:0px solid blue;">
								
					
										<div class="form-group col-sm-6">
											<span class="form-label">예약인원</span>
											<select class="form-control" id="person" >
									
												<option>1</option>
												<option>2</option>
												<option>3</option>
												<option>4</option>
												<option>5</option>
												<option>6</option>
												<option>7</option>
												<option>8</option>
												
											</select>
											<span class="select-arrow"></span>
										</div>
							
								
										<div class="form-group col-sm-6">
											<span class="form-label">예약시간</span>
											<select class="form-control" id="time" >
											<c:forEach var="i" begin="11" end="18">
												<option>${i}:00</option>		
											</c:forEach>
											</select>
											<span class="select-arrow"></span>
										</div>
								
									
									<div class="row" >
									<div class="col-sm-12">
										<div class="form-group col-sm-12">
											<input class="form-control" type="date" id="date" >
											<span class="form-label">Date</span>
										</div>
									</div>
									</div>
									
									
								<div class="row">	
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="text" id="name" required>
											<span class="form-label">예약자명</span>
										</div>
									</div>
									
									
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="email" id="email" required>
											<span class="form-label">Email</span>
										</div>
									</div>
									
								</div>
								
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="tel" id="tel" required>
											<span class="form-label">전화번호</span>
										</div>
									</div>
							
								</div>
								
							<form method="post" action="reserve_ok.do">
								
								<input type="hidden" name="no" id="no" value="${vo.no }"/>
								<input type="hidden" name="date2" id="date2" value=""/>
								<input type="hidden" name="time2" id="time2" value=""/>
								<input type="hidden" name="person2" id="person2" value=""/>
								<input type="hidden" name="name2" id="name2" value=""/>
								<input type="hidden" name="email2" id="email2" value=""/>
								<input type="hidden" name="tel2" id="tel2" value=""/>
								<input type="hidden" name="id" id="id" value="${ss_member.memberId}"/>
									  
								<div class="form-btn">
									<button class="submit-btn col-md-6"  id="submit-btn" disabled>예약하기</button>
								</div>
							</form>
							
								<div class="form-btn">
									<button class="submit-btn col-md-6" 
										onclick="javascript:history.back()"
									>취소하기</button>
								</div>
								
							</div>	
							
					<div class="row col-md-offset-1">	
						<table class="table col-md-offset-1" style="margin-top:30px;width:300px; height:300px;">			
						 <tr class="row">
						  	<th><b style="font-size:30px;">${ss_member.memberId==null?"방문객 ":ss_member.memberId} 님이 <br>관심있어 할 음식점</b></th>
						  </tr>
						 <tr class="row">
						 	<td>1</td>
						 	<td>recommendation1</td>
						 
						 </tr>
						 <tr class="row">
						 	<td>2</td>
						 	<td>recommendation2</td>
						 </tr>
						 <tr class="row">
						 	<td>3</td>
						 	<td>recommendation3</td>
						 </tr>
						</table>
					</div>
			<%-- ==========================================Ajax출력단========================================== --%>						
					
					  <div class="booking-form col-md-6 col-md-offset-0" id="result" style="border:0px solid red; margin-left:15px">
						 <div class="row">예약자명   &nbsp;&nbsp; | &nbsp;&nbsp; <b id="data-name"></b> </div>
						 <div class="row" >전화번호   &nbsp;&nbsp; | &nbsp;&nbsp; <b id="data-tel"></b></div>
						 <div class="row" >예약시간  &nbsp;&nbsp;  | &nbsp;&nbsp; <b id="data-time"></b></div>
						 <div class="row" >예약인원   &nbsp;&nbsp; | &nbsp;&nbsp;<b id="data-person"></b></div>
						 <div class="row" >예약날짜   &nbsp;&nbsp; | &nbsp;&nbsp; <b id="data-date"></b></div>
					</div>

	
		</div>	
						
		<div class="section">
				<div class="row col-md-12 col-md-offset-0">
						<div id="map"  style="width:100%;height:400px;  border:0px solid white; margin-top:10px;"></div>
				</div>	
		</div>
	</div>					
<!-- ==================================================================================================예약단 -->	



		
			
	<script>
		var container = document.getElementById('map');
		var options = {					
			center: new kakao.maps.LatLng("${vo.mapX}","${vo.mapY}"),
			/*${vo.mapX}, ${vo.mapY}  */
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		var mapContainer = document.getElementById('map'), 
	    mapOption = { 
	        center: new kakao.maps.LatLng("${vo.mapX}", "${vo.mapY}"), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
		
		var markerPosition  = new kakao.maps.LatLng("${vo.mapX}", "${vo.mapY}"); 

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

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