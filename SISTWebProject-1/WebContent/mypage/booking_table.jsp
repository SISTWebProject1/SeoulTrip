<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<section class="sample-text-area">
		<div class="text-heading" style="background-color: #6f42c1;background-image:url(../mypage/8.jpg);" >
		<h1 style="margin: 10px; text-align: center">${ss_member.memberId}님의예약정보</h1>
		</div>
		<div class="container-fluid" style="background-image:url()">
			<div class="row">
			<c:forEach var="b_vo" items="${Booking_list }">
			<div class="col-md-3" style="text-align: center;">
					
					<h3 class="text-heading">${b_vo.rname_reservation }</h3>
					
					<div class="content-details" style="text-align: left;margin: 5px;">
					<h4>예약 번호 : ${b_vo.bookingnumber} </h4>
					<c:if test="${b_vo.rphoto_reservation != 'null'}">
						<img src="${b_vo.rphoto_reservation}" class="img-fulid">
					</c:if>
					<c:if test="${b_vo.rphoto_reservation == null}">
						<img src="../mypage/default_reviews_image.jpg" class="img-fulid" >
					</c:if>
					<ul class="sample-text">
						<li>예약 날짜 : ${b_vo.reservationDate}</li>
						<li>예약 시간 : ${b_vo.time} </li>
						<li>가게 번호 : ${b_vo.tel }</li>
						<li>인원 : ${b_vo.inwon }</li>
					</ul>
					</div>
			</div>
			</c:forEach>
			<button style="height:100px; width:100%; text-align: center" onclick="javascript:history.back()">뒤로</button>
			</div>
		</div>
	</section>


	<div class="container">


		<div class="row">
			
			<div class="contact-details"></div>
			<div class="contact-details"></div>

		</div>

	</div>
</body>
</html>