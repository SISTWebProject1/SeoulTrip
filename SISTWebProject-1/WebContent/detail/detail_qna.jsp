<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-10">
			<div class="single-widget search-widget">
				<form class="example" action="#"
					style="margin: auto; max-width: 300px">
					<input type="text" placeholder="Search Posts" name="search2"
						id="keyword" />
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
		</div>
		<div class="col-lg-2">
			<button id="modalBtn" class="button"
				style="margin-top: 50px; background-color: #555555; color: white;"
				value="질문하기">질문하기</button>
		</div>
	</div>
	<div id="result">
		<div class="single-post-item" id="Qna_Board">
			<h3>
				<a href="blog-details.html">질문 내용은 다음과 같습니다.</a>
			</h3>
			<p>질문 내용은 다음과 같습니다./질문 내용은 다음과 같습니다./질문 내용은 다음과 같습니다. /질문 내용은 다음과
				같습니다./질문 내용은 다음과 같습니다./질문 내용은 다음과 같습니다. /질문 내용은 다음과 같습니다./질문 내용은 다음과
				같습니다./질문 내용은 다음과 같습니다.</p>
			<a href="blog-details.html" class="primary-btn text-uppercase mt-15">더보기</a>
			<div class="post-box">
				<div class="d-flex">
					<div>
						<a href="#"> <img src="img/author/a1.png" alt="" />
						</a>
					</div>
					<div class="post-meta">
						<div class="meta-head">
							<a href="#">회원명</a>
						</div>
						<div class="meta-details">
							<ul>
								<li><a href="#"> <span class="lnr lnr-calendar-full"></span>
										13th Oct, 2018 (리뷰작성일)
								</a></li>
								<li><a href="#"> <span class="lnr lnr-picture"></span>
										Image Post
								</a></li>
								<li><a href="#"> <span class="lnr lnr-coffee-cup"></span>
										Food & Travel
								</a></li>
								<li><a href="#"> <span class="lnr lnr-bubble"></span>
										03 Comments
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>