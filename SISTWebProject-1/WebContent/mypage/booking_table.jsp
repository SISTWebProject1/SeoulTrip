<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="https://fonts.googleapis.com/css?family=Jua|Poor+Story|Single+Day|Stylish&display=swap&subset=korean" rel="stylesheet">
<style type="text/css">
.body_main_text_info_reviewNum{
	font-size: 20px;
	font-family: 'PoorStory';
}
#booking{
transform: translate(-50%, -50%);
top: 50%;
left: 50%;
}
</style>
<body>
	<div class="container">
		<h1 style="margin: 30px; text-align: left;">${ss_member.memberId}님의예약정보</h1>
		<c:if test="${Booking_countkey == true }">
				<div style="height: 200px; text-align: center; border-top: 2px solid">
					<h2><b>예약 정보가 없습니다</b></h2>
				</div>
		</c:if>
		<c:if test="${Booking_countkey != true }">
		<div class="row" style="background-color: infotext;">
			<c:forEach var="b_vo" items="${Booking_list }">
			
				<div class="cate_body">
					<div class="col-lg-4 col-md-4" style="height: 200px">
							<a href="">
							<img class="post-img img-fluid" alt="음식점사진"
							style="border-radius: 10px 10px 10px 10px;"
							src="${b_vo.rphoto_reservation }">
							</a>
					</div>
					<div class="col-lg-8 col-md-8">
						<div class="body_main_text_title">${b_vo.rname_reservation }</div>
						<div class="body_main_text_info">
							<div class="grade">
								<p class="grade2" style="WIDTH: ${b_vo.grade*20 }%;"></p>
							</div>
							<br>
							<div class="body_main_text_info_bestreview">
								<a href="../mypage/reservation_del.do?id=${b_vo.memberId }&bookingnumber=${b_vo.bookingnumber}" class ="btn btn-sm btn-danger">삭제</a>									
								<a href="../mypage/profile.do" class="btn btn-sm btn-primary">뒤로</a>
							</div>
						</div>
						<div class="body_main_text_info_bestreview">
							<div class="body_main_text_info_reviewNum">
							<i class="fas fa-quote-right"></i>&nbsp;&nbsp;
							예약 날짜 :&nbsp;${b_vo.reservationDate }</div>
							<div class="body_main_text_info_reviewNum">
							<i class="fas fa-quote-right"></i>&nbsp;&nbsp;
							예약 시간 :&nbsp;${b_vo.time} </div>
							<div class="body_main_text_info_reviewNum">
							<i class="fas fa-quote-right"></i>&nbsp;&nbsp;
							인원 : &nbsp;${b_vo.inwon }</div>
						</div>
					</div>
				</div>
				<br>
			</c:forEach>
		</div>
		<div class="text-center" style="margin: 15px;">
      	<a href="../mypage/bookingList.do?page=${curpage>1?curpage-1:curpage }&id=${booking_id}" class="btn btn-md btn-primary" style="background-color: blue;color:white;" >이전</a>
       		 ${curpage } page / ${totalpage } pages
      	<a href="../mypage/bookingList.do?page=${curpage<totalpage?curpage+1:curpage }&id=${booking_id}" class="btn btn-sm btn-primary" style="background-color: blue;color:white;">다음</a>
   		 </div>
		</c:if>
	</div>
</body>
</html>