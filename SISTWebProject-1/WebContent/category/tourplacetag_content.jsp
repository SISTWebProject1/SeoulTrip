<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE>
<html>
<head>
</head>
<body>
	<section class="post-area">
					<div class="col-lg-12">
						<h3>
							<p>${ (tagvo.tagname eq null) ? "서울의 명소" : tagvo.tagname }</p>
						</h3>
						<div class="body_main_set">
							<div class="row">
								<c:forEach var="vo" items="${list }">
									<div class="cate_body">
										<div class="col-lg-4 col-md-4" style="height: 200px">
											<a href="../detail/detail.do?type=1&no=${ vo.no }"><img class="post-img img-fluid" alt="음식점사진"
												style="border-radius: 10px 10px 10px 10px;"
												src="${vo.tphoto }"></a>
											<div class="heart">
												<button class="heart_button 
													<c:if test="${ vo.wish eq true }">heart_on</c:if>
													<c:if test="${ vo.wish eq false }">heart_off</c:if>
												" type="button" data-type="1" data-no="${ vo.no }">
													<i class="fas fa-heart"></i>
												</button>
											</div>
										</div>
										<div class="col-lg-8 col-md-8">
											<div class="body_main_text_title">${ vo.tel }. ${ vo.tname }</div>
											<div class="body_main_text_info">
												<div class="grade">
													<p class="grade2" style="WIDTH: ${ vo.grade }%;"></p>
												</div>
												<div class="body_main_text_info_reviewNum">&nbsp;${ vo.rank }건의
													리뷰</div>
												<div class="body_main_text_info_foodtype">
													<c:forEach var="hashtag" items="${ vo.hashtags }">
														<a class="btn btn-sm p-0" href="../home/htitemlist.do?tagcode=${ hashtag.tagcode }">#${ hashtag.tagname }</a>
													</c:forEach>
												</div>
											</div>
											<div class="body_main_text_info_bestreview">
												<div class="body_main_text_info_bestreview_one">
													<i class="fas fa-quote-right"></i>&nbsp;&nbsp;&nbsp;
													<font color="green">${ fn:substring(vo.topRv.content,0,35) }...</font>
												</div>
												<div class="body_main_text_info_bestreview_two">
													<i class="fas fa-quote-right"></i>&nbsp;&nbsp;&nbsp;
													<font color="red">${ fn:substring(vo.worstRv.content,0,35) }...</font>
												</div>
											</div>
										</div>
									</div>
									<br>
								</c:forEach>
							</div>
						</div>
					</div>

					<br> <br>

					<div class="col-lg-12">
						<nav class="blog-pagination justify-content-center d-flex">
							<ul class="pagination">

								<c:if test="${startPage>1 }">
									<li class="page-item"><a
										href="../category/tourplace.do?page=${startPage-1}"
										class="page-link" aria-label="Previous"> <span
											aria-hidden="true"> <span class="lnr lnr-arrow-left"></span></span>
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
										href="../category/tourplace.do?page=${i}" class="page-link">${i}</a></li>
								</c:forEach>
								<c:if test="${endPage<allPage }">
									<li class="page-item"><a
										href="../category/tourplace.do?page=${endPage+1}" class="page-link"
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