<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="main-body body-gap">
	<div class="container">
		<div class="row">
			<div class="post-list">
				<section class="post-area">
					<div class="detail_foodset">
						<c:forEach begin="1" end="5" step="1">
							<h3><p>고급 정찬</p></h3>
							
							<div class="row food-catetop">
								<c:forEach begin="1" end="4" step="1">
									<div class="col-lg-3 col-md-3">
										<div class="single-post-item short">
											<figure>
												<a href="blog-details.html">
													<img class="post-img img-fluid" src="../img/category/restaurant_01.jpg" alt="">
												</a>
											</figure>
											
											<div class="heart">
												<button class="heart_button" type="button">
													<i class="fas fa-heart"></i>
												</button>
											</div>
											
											<div class="detail_food3">
												<h4><a href="blog-details.html">점포명</a></h4>
												
												<div class="grade">
													<p class="grade2" style="WIDTH: 50%;"></p>
												</div>
												&nbsp; <a href="">리뷰 xx건</a>
												<div class="detail_food3_tag">#태그 #태그</div>
											</div>
										</div>
									</div>
								</c:forEach>
							</div>
						</c:forEach>
					</div>
				</section>
			</div>
		</div>
	</div>
</div>