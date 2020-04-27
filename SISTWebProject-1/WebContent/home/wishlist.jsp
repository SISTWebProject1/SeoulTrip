<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
</head>

<body>
	<!-- End header Area -->

	<!-- Start banner Area -->
	<div class="container" style="background-color: #6f42c1">
		<img src="../mypage/default_wishlist.png" class="img-fluid">
	</div>
	<!-- End banner Area -->
	<!-- Start main body Area -->
	<div class="container">
		<c:if test="${wish_count == '0' }">
			<div class="row" style="margin: 30px;">
				<div style="margin: 10px; text-align: center;">
					<h2><b>아직 저장한 내용이 없습니다</b></h2>
					저장하려면 호텔, 음식점, 즐길거리를 검색하고 하트를 누릅니다.
				</div>
			</div>
		</c:if>
		<c:if test="${wish_count !='0' }">
			<div class="row gallery-item">
				<c:forEach var ="vo" items="${ wish_list}">
					<div class="col-md-4">
						<div class="single-gallery-image">
					<a href="../detail/detail.do?type=${vo.type }&no=${vo.no}" class="img-pop-up">
							<img src="${vo.wish_photo}" style="width:300px; height:200px;" >
						<!--  <div class="single-gallery-image"
							style="background: url(${vo.wish_photo});"></div>-->
						<b>${vo.wishlistname }</b> 
						</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>
</body>