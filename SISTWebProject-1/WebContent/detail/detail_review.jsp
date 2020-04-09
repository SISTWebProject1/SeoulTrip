<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 리뷰 뿌려주기 -->
<div class="col-lg-10 post-list" id="Content-List">
	<!-- Start Post Area -->
	<section class="post-area">
		<c:forEach var="vo" items="${list }">
		<div class="single-post-item">
			<h3>
				<a href="blog-details.html">${vo.title }</a>
			</h3>
			<p>${vo.content}</p>
			<br><br>
			<br><br>
			<a href="blog-details.html" class="primary-btn text-uppercase mt-15">continue
				Reading</a>
			<div class="post-box" style="width:100%">
				<div class="d-flex">
					<div>
						<a href="#"> <img src="img/author/a1.png" alt="" />
						</a>
					</div>
					<div class="post-meta">
						<div class="meta-head">
							<a href="#">${vo.memberid }</a>
						</div>
						<div class="meta-details">
							<ul>
								<li><a href="#"> <span class="lnr lnr-calendar-full"></span>
										${vo.regdate }
								</a></li>
								<li><a href="#"> <span class="lnr lnr-picture"></span>
										${vo.expdate}
								</a></li>
								<li><a href="#"> <span class="lnr lnr-coffee-cup"></span>
										${vo.likecount }
								</a></li>
								<li><a href="#"> <span class="lnr lnr-bubble"></span>
										${vo.grade }
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		</c:forEach>
		<div class="text-center">
		<ul class="pagination">
			<c:if test="${startPage>1 }">
				<li><a href="../detail/detail_review.do?type=1&no=198&page=${startPage-1 }">&lt;</a></li>
			</c:if>
			<c:set var="type" value="" />
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${curpage==i }">
					<c:set var="type" value="class=active" />
				</c:if>
				<c:if test="${curpage!=i }">
					<c:set var="type" value="" />
				</c:if>
				<li ${type }><a href="../detail/detail_review.do?type=1&no=198&page=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${endPage<allPage }">
				<li><a href="../detail/detail_review.do?type=1&no=198&page=${endPage+1 }">&gt;</a></li>
			</c:if>
		</ul>
	</div>
<!-- 	</section>
</div> -->
