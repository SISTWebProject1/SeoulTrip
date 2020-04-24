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
			<div class="col-md-4" style="text-align: center;">
						<div class="content-details" style="text-align: left; margin: 5px; height:300px;width: 500px;">
						<h3 class="text-heading">${b_vo.rname_reservation }</h3>
							<a href="../detail/detail.do?no=${b_vo.no }&type=2">
						<c:if test="${b_vo.rphoto_reservation == null}">
							<img src="../mypage/default_reviews_image.jpg" class="img-fluid" >
						</c:if>
						<c:if test="${b_vo.rphoto_reservation != 'null'}">
							<img src="${b_vo.rphoto_reservation}" class="img-fulid">
						</c:if>
							</a>
						</div>
				<table class="table">
					<tr>
						<th width="30%">예약</th>
						<td width="70%">${b_vo.bookingnumber}번
						</td>
					</tr>
					<tr>
						<th width="30%">예약 날짜 </th>
						<td width="70%"> ${b_vo.reservationDate}</td>
					<tr>
					<tr>
						<th width="30%">예약 시간</th>
						<td width="70%">${b_vo.time} </td>
					</tr>
					<tr>
						<th width="30%">가게 번호</th>
						<td width="70%">${b_vo.tel }</td>
					</tr>
					<tr>
						<th width="30%">인원</th>
						<td width="70%"> ${b_vo.inwon }</td>
					</tr>
					<tr>
						<th width="30%">평점</th>
						<td width="70%">${b_vo.grade }</td>
					</tr>
				</table>
					
			</div>
			</c:forEach>
			<button style="height:100px; width:100%; text-align: center" onclick="javascript:history.back()">뒤로</button>
			</div>
		</div>
	</section>
</body>
</html>