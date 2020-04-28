<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/home.css">
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-xs-9 home_content">
			<div class="main-body body-gap">
				<div class="container-fluid">
					<div class="row">
						<div class="post-list">
							<section class="post-area">
								<div class="detail_foodset">
									<h3 style="margin: 50px 25px;">#${ htvo.tagname }</h3>
									<div id="morehtitemlisttarget" class="row food-catetop" style="height: auto;">
										<c:forEach var="htit" items="${ htitemlist }">
											<div class="col-lg-3 col-md-3">
												<div class="single-post-item short">
													<figure>
														<a href="../detail/detail.do?type=${ htit.type }&no=${ htit.no }">
														<img style="height: 150px; width: 100%;" class="post-img img-fluid" src="${ htit.photo }" onerror="javascript:src='../img/logo.png'">
														</a>
													</figure>
													<div class="heart">
														<button class="heart_button 
															<c:choose>
																<c:when test="${ htit.wish eq true }">heart_on</c:when>
																<c:otherwise>heart_off</c:otherwise>
															</c:choose>
														 " type="button" data-type="${ htit.type }" data-no="${ htit.no }">
															<i class="fas fa-heart"></i>
														</button>
													</div>
													<div class="detail_food3">
														<h4><a href="../detail/detail.do?type=${ htit.type }&no=${ htit.no }">${ htit.name }</a></h4>
														
														<div class="grade">
															<p class="grade2" style="WIDTH: ${ htit.grade }%;"></p>
														</div>
														&nbsp; <a href="../detail/detail.do?type=${ htit.type }&no=${ htit.no }">리뷰 ${ htit.reviewCnt }건</a>
														<div class="detail_food3_tag">
															<c:forEach var="hashtag" items="${ htit.hashtags }">
																<a class="btn btn-sm p-0" href="htitemlist.do?tagcode=${ hashtag.tagcode }">#${ hashtag.tagname }</a>
															</c:forEach>
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
										<c:if test="${ htitemlist.size() lt 3 }">
											<div class="col-lg-3 col-md-3"></div>
										</c:if>
									</div>
								</div>
							</section>
						</div>
					</div>
					<div class="text-center">
						<span class="btn btn-lg m-1" id="morehtitemlist" curpage=${ curpage } totalpage=${ totalpage } tagcode="${ htvo.tagcode }">더 보기 (<span id="morehtitemlistcurpage">${ curpage }</span>/${ totalpage })</span>
						<span id="morehtitemlisttext">|</span>
						<span class="btn btn-lg m-1" onclick="window.scroll({top:0,left:0,behavior:'smooth'})">맨 위로 (Top)</span>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-3 home_side">
			<!-- Start side Area -->
			<div style="position: sticky; top: 130px;">
				<jsp:include page="../home/home_side.jsp"></jsp:include>
			</div>
			<!-- End side Area -->
		</div>
	</div>
</div>
</body>
</html>