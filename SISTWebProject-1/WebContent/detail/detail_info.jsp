<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<section class="banner-area relative">
<div class="overlay overlay-bg"></div>
<div class="container box_1170">
	<div class="row d-flex align-items-center justify-content-center">
		<div class="about-content col-lg-12">
			<h1 class="text-white">상세 페이지 (${title})</h1>
			<p class="text-white link-nav">
				<a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span>
				<a href="archive.html"> Archive</a>
			</p>
		</div>
	</div>
</div>
</section>
<!-- End banner Area -->
<hr>
<!-- Start main body Area -->
<div class="main-body">
	<div class="container box_1480">
		<div>
			<div class="category_sum" style="font-size:20px; font-weight:bold;">
				<a href=#>메인 </a> <a href=#>/${category}</a> <a href=#>//${title} </a>
			</div>
			<hr>
			<div class="container-alter container-summary">
				<ul>
					<li style="font-size:35px; font-weight:bolder;"><a href="#">${title}</a></li>
					<li><a href="#">순위 /(전체 데이터중)</a></li>
					<li>
						<div class="tag_button">
							<input type="button" value="tag1"> <input type="button"
								value="tag2">
						</div>
					</li>
				</ul>
			</div>
			<hr>
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="single-post-item short">
						<div class="content_summary">
							<ul>
								<li>
									<h4>리뷰하이라이트1</h4>
								</li>
								<li>
									<h3>리뷰 대표명1</h3>
								</li>
								<li>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua.</p> <a href="#">더보기(scroll)</a>
								</li>
								<li><a href="#">리뷰 작성 ID</a> <span>리뷰 평점 (그리기
										javascript)</span></li>
							</ul>

							<ul>
								<li>
									<h4>리뷰하이라이트2</h4>
								</li>
								<li>
									<h3>리뷰 대표명2</h3>
								</li>
								<li>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit, sed do eiusmod tempor incididunt ut labore et dolore
										magna aliqua.</p> <a href="#">더보기(scroll)</a>
								</li>
								<li><a href="#">리뷰 작성 ID</a> <span>리뷰 평점 (그리기
										javascript)</span></li>
								<ul>
						</div>
					</div>
				</div>

				<div class="col-lg-6 col-md-6">
					<div class="single-post-item short">
						<div class="main-image">
							
							<img src="${imglist[0].filepath}" alt="image1" id="current" />
						</div>
							<br>
						<div class="imgs">
						<c:forEach var="i" begin="0" end="7">
							<c:if test="${imglist[i].filepath ne NULL }">
								<img src="${imglist[i].filepath}"/>
							</c:if>
						</c:forEach>
						</div>
					</div>
				</div>
				<!-- <div class="container-alter">
                <form class="js-ReviewForm">
                  <input type="text" placeholder="Review Comment" />
                  <span class="review-content"></sapn>
                </form>
            </div> -->
				<hr>
				<hr>
				<div class="col-lg-2 col-md-2">
					<div class="single-post-item short">
						<div class="rating_statistics">
							<ul>
								<li><span>아주좋음</span></li>
								<li><span>좋음</span></li>
								<li><span>보통</span></li>
								<li><span>별로</span></li>
								<li><span>최악</span></li>
								<li><input type="hidden" name=mapx id=mapx value="${mapx}"/></li>
								<li><input type="hidden" name=mapy id=mapy value="${mapy}"/></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3">
					<div class="single-post-item short">
						<div class="content_specifit">
							<ul>
								<li>위치</li>
								<li>서울종로구 사직구 161</li>
								<li>웹사이트</li>
								<li>전화번호</li>
								<li>교통편</li>
								<li>안내정보</li>
								<p>상세안내</p>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-md-5">
					<div class="single-post-item short">
						<div id="map" style="width: 500px; height: 300px;"></div>
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=32be74c036d5c62bdc64696f8f5ab2ea"></script>
						<script>
							var container = document.getElementById('map');
							var mapx = document.getElementById('mapx').value;
							var mapy = document.getElementById('mapy').value;

							var options = {
								center : new kakao.maps.LatLng(mapx, mapy),
								level : 3
							};
							var map = new kakao.maps.Map(container, options);
							var markerPosition = options.center;

							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								position : markerPosition
							});

							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);  
							
						</script> 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>