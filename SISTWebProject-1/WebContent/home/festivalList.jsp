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

<jsp:include page="../home/home_calendar.jsp"/>

<div class="container-fluid">
	<h2 style="margin-left: 80px;">${ curmonth }월 ${ curdate }일에 열리는 축제</h2>
	<div class="row">
		<div class="col-xs-9 home_content">
			<div class="main-body body-gap">
				<div class="container-fluid">
					<div class="row">
						<div class="post-list">
							<section class="post-area">
								<div class="detail_foodset">
									<div class="row food-catetop" style="height: auto;">
										<c:forEach var="fvo" items="${ fdlist }">
											<div class="col-lg-3 col-md-3">
												<div class="single-post-item short">
													<figure>
														<a href="../detail/detail.do?type=3&no=${ fvo.no }">
														<img class="post-img img-fluid" src="${ fvo.fphoto }" style="height: 200px;">
														</a>
													</figure>
													<div class="heart">
														<button class="heart_button 
															<c:choose>
																<c:when test="${ fvo.wish eq true }">heart_on</c:when>
																<c:otherwise>heart_off</c:otherwise>
															</c:choose>
														 " type="button" data-type="3" data-no="${ fvo.no }">
															<i class="fas fa-heart"></i>
														</button>
													</div>
													<div class="detail_food3">
														<h4><a href="../detail/detail.do?type=3&no=${ fvo.no }">${ fvo.fname }</a></h4><br/>
														<div>
															${ fvo.addr1 }${ fvo.addr2 }<br/>
															${ fvo.fmtStart } ~ ${ fvo.fmtEnd }
														</div>
													</div>
												</div>
											</div>
										</c:forEach>
									</div>
								</div>
							</section>
						</div>
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