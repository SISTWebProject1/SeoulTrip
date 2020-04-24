<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<!-- 오른쪽  -->
<div class="container-fluid bg-3 text-center">
	<h3 style="">음식으로 서울여행</h3>
	<br>
	<div class="row">
		<div class="col-sm-3" style="cursor: pointer;"
			onclick="../category/foodtag_content.do">
			<div class="cate-img">
				<img src="../img/category/seafood.jpg" class="img-responsive"
					alt="Image">
			</div>
			<div class="img-text">
				<p>해산물</p>
			</div>
		</div>
		<div class="col-sm-3" style="cursor: pointer;"
			onclick="location.href='blog-details.html'">
			<div class="cate-img">
				<img src="../img/category/coffe.jpg" class="img-responsive"
					alt="Image">
			</div>
			<div class="img-text">
				<p>카페</p>
			</div>
		</div>
		<div class="col-sm-3" style="cursor: pointer;"
			onclick="location.href='blog-details.html'">
			<div class="cate-img">
				<img src="../img/category/pizza.jpg" class="img-responsive"
					alt="Image">
			</div>
			<div class="img-text">
				<p>피자</p>
			</div>
		</div>
		<div class="col-sm-3" style="cursor: pointer;"
			onclick="location.href='blog-details.html'">
			<div class="cate-img">
				<img src="../img/category/koreafood.jpg" class="img-responsive"
					alt="Image">
			</div>
			<div class="img-text">
				<p>한식</p>
			</div>
		</div>
	</div>
</div>
<br>

<div class="container-fluid bg-3 text-center">
	<div class="row">
		<div class="col-sm-3" style="cursor: pointer;"
			onclick="location.href='blog-details.html'">
			<div class="cate-img">
				<img src="../img/category/indiafood.jpeg" class="img-responsive"
					alt="Image">
			</div>
			<div class="img-text">
				<p>인도요리</p>
			</div>
		</div>

		<div class="col-sm-3" style="cursor: pointer;"
			onclick="location.href='blog-details.html'">
			<div class="cate-img">
				<img src="../img/category/japanfood.jpg" class="img-responsive"
					alt="Image">
			</div>
			<div class="img-text">
				<p>일식</p>
			</div>
		</div>
		<div class="col-sm-3" style="cursor: pointer;"
			onclick="location.href='blog-details.html'">
			<div class="cate-img">
				<img src="../img/category/thaifood.jpg" class="img-responsive"
					alt="Image">
			</div>
			<div class="img-text">
				<p>동남아음식</p>
			</div>
		</div>
		<div class="col-sm-3" style="cursor: pointer;"
			onclick="location.href='blog-details.html'">
			<div class="cate-img">
				<img src="../img/category/meat.jpeg" class="img-responsive"
					alt="Image">
			</div>
			<div class="img-text">
				<p>고기</p>
			</div>
		</div>
	</div>
</div>

<br>
<br>

<section class="post-area">
<div class="detail_foodset">
	<h3>
		<p>고급 정찬</p>
	</h3>
	<div class="row">
		<c:forEach var="vo" items="${list }">
			<div class="col-lg-3 col-md-3">
				<div class="single-post-item short">
					<figure> <a href="foodtag_content.do"><img
						class="post-img img-fluid" src="${vo.rphoto }" onerror="javascript:src='../img/logo.png'"
						alt=""></a> </figure>
					<div class="heart">
						<button class="heart_button" type="button">
							<i class="fas fa-heart"></i>
						</button>
					</div>
					<div class="detail_food3">
						<h4>
							<a href="blog-details.html">${vo.rname }</a>
						</h4>
						<div class="grade">
							<p class="grade2" style="WIDTH: 80%;"></p>
						</div>
						&nbsp; <a href="">리뷰 xx건</a>
						<div class="detail_food3_tag">#태그 #태그</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<div class="detail_foodset">
	<h3>
		<p>저녁 식사</p>
	</h3>
	<div class="row">
		<c:forEach var="vo" items="${list }">
			<div class="col-lg-3 col-md-3">
				<div class="single-post-item short">
					<figure> <a href="blog-details.html"><img
						class="post-img img-fluid" src="../img/category/restaurant_01.jpg"
						alt=""></a> </figure>
					<div class="heart">
						<button class="heart_button" type="button">
							<i class="fas fa-heart"></i>
						</button>
					</div>
					<div class="detail_food3">
						<h4>
							<a href="blog-details.html">${vo.rname }</a>
						</h4>
						<div class="grade">
							<p class="grade2" style="WIDTH: 80%;"></p>
						</div>
						&nbsp; <a href="">리뷰 xx건</a>
						<div class="detail_food3_tag">#태그 #태그</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<div class="detail_foodset">
	<h3>
		<p>인기많은</p>
	</h3>
	<div class="row">
		<c:forEach var="vo" items="${list }">
			<div class="col-lg-3 col-md-3">
				<div class="single-post-item short">
					<figure> <a href="blog-details.html"><img
						class="post-img img-fluid" src="../img/category/restaurant_01.jpg"
						alt=""></a> </figure>
					<div class="heart">
						<button class="heart_button" type="button">
							<i class="fas fa-heart"></i>
						</button>
					</div>
					<div class="detail_food3">
						<h4>
							<a href="blog-details.html">${vo.rname }</a>
						</h4>
						<div class="grade">
							<p class="grade2" style="WIDTH: 80%;"></p>
						</div>
						&nbsp; <a href="">리뷰 xx건</a>
						<div class="detail_food3_tag">#태그 #태그</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<!-- https://media-cdn.tripadvisor.com/media/photo-p/12/f9/51/7c/photo1jpg.jpg -->


<div class="col-lg-12">
	<h3>
		<p>서울의 음식점</p>
	</h3>
	<div class="body_main_set">
		<div class="row">
			<c:forEach var="vo" items="${list }">
				<div class="cate_body">
					<div class="col-lg-4 col-md-4" style="height: 200px">
							<a href="../detail/detail.do?type=2&no=${vo.no}"><img class="post-img img-fluid" alt="음식점사진"
							style="border-radius: 10px 10px 10px 10px;"
							src="${vo.rphoto }" onerror="javascript:src='../img/logo.png'"></a>
							<div class="heart">
								<button class="heart_button" type="button">
									<i class="far fa-heart fa-fw"></i>
								</button>
						</div>
					</div>
					<div class="col-lg-8 col-md-8">
						<div class="body_main_text_title">${vo.rname }</div>
						<div class="body_main_text_info">
							<div class="grade">
								<p class="grade2" style="WIDTH: 100%;"></p>
							</div>
							<div class="body_main_text_info_reviewNum">&nbsp;xxx건의 리뷰</div>
							<div class="body_main_text_info_foodtype">#한식 #저렴 #점심</div>
							<div class="body_main_text_info_foodtype">${vo.price }</div>
						</div>
						<div class="body_main_text_info_bestreview">
							<div class="body_main_text_info_bestreview_one">
								<i class="fas fa-quote-right"></i>&nbsp;&nbsp;&nbsp;제육백반입니다 ㅎㅎ
							</div>
							<div class="body_main_text_info_bestreview_two">
								<i class="fas fa-quote-right"></i>&nbsp;&nbsp;&nbsp;돈 받고 먹으라고 해도
								여긴 좀...
							</div>
						</div>
					</div>
				</div>
				<br>
			</c:forEach>
		</div>
	</div>
</div>

<br>
<br>


<div class="col-lg-12">
	<nav class="blog-pagination justify-content-center d-flex">
	<ul class="pagination">

		<c:if test="${startPage>1 }">
			<li class="page-item"><a
				href="../category/food.do?page=${startPage-1}" class="page-link"
				aria-label="Previous"> <span aria-hidden="true"> <span
						class="lnr lnr-arrow-left"></span></span>
			</a></li>
		</c:if>


		<c:set var="type" value="" />
		<c:forEach var="i" begin="${startPage}" end="${endPage }">

			<c:if test="${curpage==i }">
				<c:set var="type" value="class=active" />
			</c:if>
			<c:if test="${curpage!=i }">
				<c:set var="type" value="" />
			</c:if>
			<li ${type } class="page-item"><a
				href="../category/food.do?page=${i}" class="page-link">${i}</a></li>

		</c:forEach>


		<c:if test="${endPage<allPage }">
			<li class="page-item"><a
				href="../category/food.do?page=${endPage+1}" class="page-link"
				aria-label="Next"> <span aria-hidden="true"> <span
						class="lnr lnr-arrow-right"></span></span>
			</a></li>
		</c:if>
	</ul>
	</nav>
</div>
</section>
</body>
</html>