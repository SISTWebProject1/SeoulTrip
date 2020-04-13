<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="single-widget popular-posts-widget">
	<h4 class="title">주변 음식점</h4>
	<div class="blog-list row">
		<c:forEach var="vo" items="${nearlist}">
		<div class="single-popular-post d-flex flex-row col-lg-3 col-md-3">
			<div class="popular-thumb">
				<img class="img-fluid" src="img/blog/r1.jpg" alt="" />
			</div>
			<div class="popular-details">
				<a href="blog-details.html">
					<h4>${vo.tname }</h4>
				</a>
				<p class="text-uppercase">
				<fmt:formatNumber value="${vo.distance}" pattern="#,##0.0#"/>
				km</p>
			</div>
		</div>
		</c:forEach>
	</div>
</div>

<hr>

<div class="single-widget popular-posts-widget">
	<h4 class="title">주변 음식점</h4>
	<div class="blog-list row">
		<div class="single-popular-post d-flex flex-row col-lg-3 col-md-3">
			<div class="popular-thumb">
				<img class="img-fluid" src="img/blog/r1.jpg" alt="" />
			</div>
			<div class="popular-details">
				<a href="blog-details.html">
					<h4>Space Final Frontier</h4>
				</a>
				<p class="text-uppercase">1.7 km away</p>
			</div>
		</div>
		<div class="single-popular-post d-flex flex-row col-lg-3 col-md-3">
			<div class="popular-thumb">
				<img class="img-fluid" src="img/blog/r2.jpg" alt="" />
			</div>
			<div class="popular-details">
				<a href="blog-details.html">
					<h4>The Amazing Hubble</h4>
				</a>
				<p class="text-uppercase">1.7 km away</p>
			</div>
		</div>
		<div class="single-popular-post d-flex flex-row col-lg-3 col-md-3">
			<div class="popular-thumb">
				<img class="img-fluid" src="img/blog/r3.jpg" alt="" />
			</div>
			<div class="popular-details">
				<a href="blog-details.html">
					<h4>Astronomy Astrology</h4>
				</a>
				<p class="text-uppercase">1.7 km away</p>
			</div>
		</div>
		<div class="single-popular-post d-flex flex-row col-lg-3 col-md-3">
			<div class="popular-thumb">
				<img class="img-fluid" src="img/blog/r4.jpg" alt="" />
			</div>
			<div class="popular-details">
				<a href="blog-details.html">
					<h4>Asteroids telescope</h4>
				</a>
				<p class="text-uppercase">1.7 km away</p>
			</div>
		</div>
	</div>
</div>
<!-- deatil mainbody 종료 -->
</div>
</div>