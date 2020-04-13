<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- <div class="single-widget protfolio-widget">
	<img class="img-fluid" src="../img/blog/user2.png" alt="">
	<a href="#">
		<h4>Charlie ALison Barber</h4>
	</a>
	<div class="desigmation">
		<p>Senior blog writer</p>
	</div>
	<p>
		Boot camps have its supporters andit sdetractors. Some people do not understand why you should have to spend
		money on boot camp whenyou can get. Boot camps have itssuppor ters andits detractors.
	</p>
	<ul>
		<li><a href="#"><i class="fa fa-facebook"></i></a></li>
		<li><a href="#"><i class="fa fa-twitter"></i></a></li>
		<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
		<li><a href="#"><i class="fa fa-behance"></i></a></li>
	</ul>
</div> -->

<div class="single-widget category-widget">
	<h4 class="title">Popular Tags</h4>
	<ul>
		<li><a href="#" class="justify-content-between align-items-center d-flex">
				<p>Techlology</p> <span>37</span>
			</a></li>
		<li><a href="#" class="justify-content-between align-items-center d-flex">
				<p>Lifestyle</p> <span>24</span>
			</a></li>
		<li><a href="#" class="justify-content-between align-items-center d-flex">
				<p>Fashion</p> <span>59</span>
			</a></li>
		<li><a href="#" class="justify-content-between align-items-center d-flex">
				<p>Art</p> <span>29</span>
			</a></li>
		<li><a href="#" class="justify-content-between align-items-center d-flex">
				<p>Food</p> <span>15</span>
			</a></li>
		<li><a href="#" class="justify-content-between align-items-center d-flex">
				<p>Architecture</p> <span>09</span>
			</a></li>
		<li><a href="#" class="justify-content-between align-items-center d-flex">
				<p>Adventure</p> <span>44</span>
			</a></li>
	</ul>
</div>

<c:if test="${ hiSize ne 0 }">
	<div class="single-widget popular-posts-widget">
		<h4 class="title">Recent Items</h4>
		<div class="blog-list ">
			<c:forEach var="hivo" items="${ hiList }">
				<div class="single-popular-post d-flex flex-row">
					<div class="popular-thumb">
						<img class="img-fluid" src="${ hivo.photo }" alt="">
					</div>
					<div class="popular-details">
						<a href="blog-details.html">
							<h4>${ hivo.name }</h4>
						</a>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</c:if>

<!-- <div class="single-widget newsletter-widget">
	<h4 class="title">Newsletter</h4>
	<div id="mc_embed_signup">
		<form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
		 method="get" class="">
			<div class="form-group" style="width: 100%">
				<input name="EMAIL" placeholder="Email Address" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Email Address '"
				 required="" type="email">
				<div style="position: absolute; left: -5000px;">
					<input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
				</div>

				<button class="primary-btn text-uppercase">
					Subscribe Now
					<span class="lnr lnr-arrow-right"></span>
				</button>
			</div>
			<div class="info"></div>
		</form>
	</div>
</div> -->