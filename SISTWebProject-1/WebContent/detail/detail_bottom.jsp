<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="single-widget popular-posts-widget">
	<h4 class="title">주변 명소</h4>
	<div class="blog-list row">
		<c:forEach var="vo" items="${nearT}">
		<div class="single-popular-post d-flex flex-row col-lg-3 col-md-3">
			<div class="popular-thumb">
				<img class="img-fluid" src="img/blog/r1.jpg" alt="" />
			</div>
			<div class="popular-details">
				<a href="../detail/detail.do?type=1&no=${vo.no }">
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
		<c:forEach var="vo" items="${nearR}">
		<div class="single-popular-post d-flex flex-row col-lg-3 col-md-3">
			<div class="popular-thumb">
				<img class="img-fluid" src="img/blog/r1.jpg" alt="" />
			</div>
			<div class="popular-details">
				<a href="../detail/detail.do?type=2&no=${vo.no }">
					<h4>${vo.rname }</h4>
				</a>
				<p class="text-uppercase">
				<fmt:formatNumber value="${vo.distance}" pattern="#,##0.0#"/>
				km</p>
			</div>
		</div>
		</c:forEach>
	</div>
</div>

<%-- <div class="single-widget popular-posts-widget">
	<h4 class="title">주변 축제장소</h4>
	<div class="blog-list row">
		<c:forEach var="vo" items="${nearF}">
		<div class="single-popular-post d-flex flex-row col-lg-3 col-md-3">
			<div class="popular-thumb">
				<img class="img-fluid" src="img/blog/r1.jpg" alt="" />
			</div>
			<div class="popular-details">
				<a href="../detail/detail.do?type=3&no=${vo.no }">
					<h4>${vo.fname }</h4>
				</a>
				<p class="text-uppercase">
				<fmt:formatNumber value="${vo.distance}" pattern="#,##0.0#"/>
				km</p>
			</div>
		</div>
		</c:forEach>
	</div>
</div> --%>
<!-- deatil mainbody 종료 -->
</div>
</div>