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
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<style type="text/css">
body {
 font-family: 'Noto Sans KR', sans-serif;
 font-size: 15px;
}

h1,h2,h3 {
 font-family: 'Noto Sans KR', sans-serif;

}

a {
 font-family: 'Noto Sans KR', sans-serif;
 font-size: 12px;
}


p {
 font-family: 'Noto Sans KR', sans-serif;
 font-size: 20px;
}
span {
 font-family: 'Noto Sans KR', sans-serif;
 font-size:25px;
}
#noInfo {
  color: #8c8c8c;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script> -->
<script type="text/javascript">	
$(function(){
	$('#person').click(function(){
		 var person=$('#person').val();
		$.ajax({
			type:'post',
			url:'../reservation/reservation.do',
			success:function(res)
			{
				if(person==null)
					hidden();
				else
				{
					$('#data-person').text(person+"명");
					$('#person2').val(person);
				}
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
		$.ajax({
			type:'post',
			url:'../reservation/reservation.do',
			success:function(res)
			{
				$('#data-tel').text(tel);
				$('#tel2').val(tel);			
			}
		})
	})

	$('#emails').keyup(function(){
		var email=$('#emails').val();
		$.ajax({
			type:'post',
			url:'../reservation/reservation.do',
			success:function(res)
			{
				$('#data-email').text(email);
				$('#email2').val(email);
			}
			
		})
	}) 
	$("#form").validate({
		rules : {
			name : {required:true, minlength:3},
			tel : {required:true, minlength:11},
			email : {required:true,email:true},
		},
		messages :{
			name : {
				required: "예약하실 분의 성함을 입력하세요",
				minlength: "0글자 이상 입력하세요!"
			},
			tel : {
				required: "연락을 받으실 휴대폰 번호를 입력해주세요 (예)010-XXXX-XXXX",
				minlength: "휴대폰번호 11자리를 정확히 입력하세요"
			},
			email: {
				required: "이메일 형식을 지켜서 입력해주세요  (예)sist@sist.co.kr",
				email: "연락받으실 이메일 주소를 정확히 입력해주세요"
			}
		},
		submitHandler:function(frm){
			frm.submit();
		},
		success:function(e)
		{
			
		}
	});    
	
	});	

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
	  
	<h1 style="text-align:center;">&nbsp;&nbsp;${vo.rname }</h1>	
	
	<section class="contact-page-area" style="margin-top:20px;">	
		   	<div class="row-info col-md-6 col-md-offset-0" style="width:100%;">
						<img src="${vo.rphoto }" class="rphoto">
				<c:if test="${empty vo.rphoto}" >
						<img src="img/img_def.png" class="rphoto" id="noInfo" >
				</c:if>
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

						<c:if test="${empty vo.addr1}" >
							<h5 id="noInfo">주소 정보가 없습니다</h5>
						</c:if>
						</div>
					</div>
					

					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-phone-handset"></span>
						</div>
						<div class="contact-details">
							<h5>${vo.tel }</h5>
						<c:if test="${empty vo.tel}" >
							<h5 id="noInfo" >전화번호 정보가 없습니다</h5>
						</c:if>
						</div>	
					</div>
					
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-alarm"></span>
						</div>
						
						<div class="contact-details">
						  <h5>${vo.openhour}</h5> 
						<c:if test="${empty vo.openhour}" >
						  <h5 id="noInfo">운영시간 정보가 없습니다</h5>
						 </c:if>
   						</div>
   				
					</div>
					<div class="single-contact-address d-flex flex-row">
						<div class="icon">
							<span class="lnr lnr-diamond"></span>
						</div>
						<div class="contact-details">
							<h5>${vo.price}</h5>
						<c:if test="${empty vo.price}" >
							<h5 id="noInfo">가격대 정보가 없습니다</h5>
						</c:if>
						</div>
					</div>
				</div>	
			
			</div>
	</section>
</div>
</div>	
<!-- ==================================================================================================음식점정보 -->		
	
	
		
<div class="container">		

<!-- ==================================================================================================예약단 -->	
		<div class="section" >
				<form method="post" action="reserve_ok.do" id="form">
						<div class="booking-form col-md-6" style="width:100%;margin-left:10px; margin-top:5px;">
										<div class="form-group col-sm-6">
											<span class="form-label">예약인원</span>
											<select class="form-control" id="person" name="person">
												<option selected disabled >인원을 선택해주세요</option>
											<c:forEach var="i" begin="1" end="10">
												<option>${i}</option>
											</c:forEach>
											</select>
											
											<span class="select-arrow"></span>
										</div>
							
								
										<div class="form-group col-sm-6">
											<span class="form-label">예약시간</span>
											<select class="form-control" id="time" name="time" >
												<option selected disabled>시간을 선택해주세요</option>
											<c:forEach var="i" begin="11" end="18">
												<option>${i}:00</option>		
											</c:forEach>
											</select>
											<span class="select-arrow"></span>
										</div>
								
									
									<div class="row" >
									<div class="col-sm-12">
										<div class="form-group col-sm-12">
											<input class="form-control" type="date" id="date" name="date" min="${today }" >
											<span class="form-label">예약날짜</span>
										</div>
									</div>
									</div>
									
									
								<div class="row">	
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="text" id="name" name="name" >
											<span class="form-label">예약자명</span>
										</div>
									</div>
									
									<div class="col-md-6">
										<div class="form-group">
											<input class="form-control" type="tel" id="tel" name="tel" >
											<span class="form-label">전화번호</span>
										</div>
									</div>
									
								</div>
								
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<input  class="form-control" id="emails" type="email" name="email" 	>
											<span class="form-label">Email</span>
										</div>
									</div>							
								</div>
								
							
						
							
								<input type="hidden" name="no" id="no" value="${vo.no }"/>
								<input type="hidden" name="date2" id="date2" value=""/>
								<input type="hidden" name="time2" id="time2" value=""/>
								<input type="hidden" name="person2" id="person2" value=""/>
								<input type="hidden" name="name2" id="name2" value=""/>
								<input type="hidden" name="email2" id="email2" value=""/>
								<input type="hidden" name="tel2" id="tel2" value=""/>
								<input type="hidden" name="id" id="id" value="${ss_member.memberId}" />			
								<input type="hidden" name="tagcode" id="tagcode" value="${tvo.tagcode }">  
								<div class="form-btn">
									<button class="submit-btn col-md-6">예약하기</button>
								<!--disabled  -->
					
								</div>			
								<div class="form-btn">
									<button class="submit-btn col-md-6" 
										onclick="javascript:history.back()"
									>취소하기</button>
								</div>
								
							</div>
						</form>		
					 </div>	
	
			<%-- ==========================================Ajax출력단========================================== --%>						
			<div class="section">		
					 <div class="booking-form col-md-6 col-md-offset-0" id="result" style="margin-left:15px" ">
						 <div class="row" >예약인원   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b id="data-person"></b></div>
						 <div class="row" >예약시간  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b id="data-time"></b></div>
						 <div class="row" >예약날짜   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b id="data-date"></b></div>
						 <div class="row">예약자명   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b id="data-name"></b> </div>
						 <div class="row" >전화번호   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b id="data-tel"></b></div>
						 <div class="row">E-MAIL  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <b id="data-email"></b></div>
					</div>
			</div>
<!-- ==================================================================================================예약단 -->	
			<div class="section">				
					<div class="row" style="margin: 0px auto;">
					 	
					 	
					<c:if test="${list!=null }"> 	
					 	<div class="row" style="margin: 0px auto;float:left; border:0px solid red;"> 
					 	 
						 <b style="font-size:25px; text-align:right;">&nbsp;&nbsp;
						  ${ss_member.memberId==null?"방문객 ":ss_member.memberId} 님에게  
						&nbsp; # ${tvo.tagname } &nbsp; 관련  음식점을 추천해드려요</b>
						</div>
					</c:if>
					
					
					 			
					 </div>
						 		
					<div class="blank-space" style="margin-top:20px;"></div>							
					
					
						
						 <c:forEach var="rvo" items="${list}">
						 
							<div class="col-md-4" style="margin: 0px auto; float:left;  width:100%;">
						   	 <div class="thumbnail">
						   	 	
						   	 <c:if test="${rvo.no!=vo.no }">
						   		<a href="../detail/detail.do?type=2&no=${rvo.no}">
						   	 
						        	<img src="${rvo.rphoto }" style="width:100%; height:220px;"/>
						        </a>
						     </c:if>
						     
						     <c:if test="${rvo.no==vo.no }">
						   		
						        	<img src="../img/img_def.png" style="width:100%; height:220px;"/>
						 
						     </c:if>
						     
						      
						          <div class="caption text-center">

						          <p>${rvo.rname==vo.rname?"준비중입니다":rvo.rname}</p>

						        </div>
						    	</div>
 							 </div>
 			
 						  
						 </c:forEach>
					    
	
		 	 </div>
		
						
		<div class="section">
				<div class="row col-md-12 col-md-offset-0">
					<h3 style="text-align:center;"> ${vo.rname } &nbsp;위치와 가는 길을 검색해보세요</h3>
						<div id="map"  style="width:100%; height:400px;  border:0px solid white; margin-top:10px;"></div>
				</div>	
		</div>
		
		
</div>					




		
			
	<script>
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng("${vo.mapX}","${vo.mapY}"), // 지도의 중심좌표
        level: 4 // 지도의 확대 레벨
    };

	var map = new kakao.maps.Map(mapContainer, mapOption);
	
	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng("${vo.mapX}","${vo.mapY}"); 
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);
	
	var X=${vo.mapX};
	var Y=${vo.mapY};
	
	var iwContent = '<div style="padding:20px; color:#8050fa;font-size:15px;">'+"${vo.rname}"
		+'<a href="https://map.kakao.com/link/map/'
		+"${vo.rname}"+','+"${vo.mapX}"+','+"${vo.mapY}"
		+'style="color:blue" target="_blank"><br>길찾기</a>'
		+'</div>'
		,
	    iwPosition = new kakao.maps.LatLng("${vo.mapX}","${vo.mapY}"); //인포윈도우 표시 위치입니다
	
	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 
		/* var container = document.getElementById('map');
		var options = {					
			center: new kakao.maps.LatLng("${vo.mapX}","${vo.mapY}"),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		var mapContainer = document.getElementById('map'), 
	    mapOption = { 
	        center: new kakao.maps.LatLng("${vo.mapX}", "${vo.mapY}"), // 지도의 중심좌표
	        level: 4 // 지도의 확대 레벨
	    };
		
		var markerPosition  = new kakao.maps.LatLng("${vo.mapX}", "${vo.mapY}");

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);
 */
	</script>


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

	
	

	
	

	
</body>

</html>