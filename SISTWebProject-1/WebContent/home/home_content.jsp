<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="post-area">
	<c:forEach begin="0" end="2" step="1">
		<div class="detail_foodset">
			<h3><p>고급 정찬</p></h3>
			
			<c:forEach begin="0" end="4" step="1">
				<div class="row food-catetop">
					<div class="col-lg-3 col-md-3">
						<div class="single-post-item short">
							<figure>
								<a href="blog-details.html"><img class="post-img img-fluid"
									src="../ruft222/img/archive/restaurant_01.jpg" alt=""></a>
							</figure>
							<div class="heart">
								<button class="heart_button" type="button">
									<i class="fas fa-heart"></i>
								</button>
							</div>
							<div class="detail_food3">
								<h4>
									<a href="blog-details.html">점포명</a>
								</h4>
								<div
									style="CLEAR: both; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft222/img/archive/icon_star2.gif) 0px 0px; FLOAT: left; PADDING-BOTTOM: 0px; MARGIN: 0px; WIDTH: 90px; PADDING-TOP: 0px; HEIGHT: 18px;">
									<p
										style="WIDTH: 90%; PADDING-RIGHT: 0px; PADDING-LEFT: 0px; BACKGROUND: url(../ruft222/img/archive/icon_star.gif) 0px 0px; PADDING-BOTTOM: 0px; MARGIN: 0px; PADDING-TOP: 0px; HEIGHT: 18px;">
									</p>
								</div>
								&nbsp; <a href="">리뷰 xx건</a>
								<div class="detail_food3_tag">#일식</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>			
		</div>
	</c:forEach>
</section>