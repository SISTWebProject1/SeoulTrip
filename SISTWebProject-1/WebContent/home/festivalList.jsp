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
	<div class="row">
		<div class="col-xs-9 home_content">
			<section class="post-area">
				<div class="row">
					<c:forEach var="fvo" items="${ flist }">
						<div class="col-lg-4 col-md-4">
							<div class="single-post-item short">
								<figure>
									<img class="post-img img-fluid" src="${ fvo.fphoto }" style="height: 400px;">
								</figure>
								<h3>
									<a href="../detail/detail?type=3&no=${ fvo.no }">${ fvo.fname }</a>
								</h3>
								<p>
									${ fvo.addr1 }${ fvo.addr2 }<br/>
									${ fvo.fmtStart } ~ ${ fvo.fmtEnd }
								</p>
								<a href="../detail/detail?type=3&no=${ fvo.no }" class="primary-btn text-uppercase mt-15">축제 상세보기</a>
								<!-- <div class="post-box">
									<div class="d-flex">
										<div>
											<a href="#">
												<img src="img/author/a1.png" alt="">
											</a>
										</div>
										<div class="post-meta">
											<div class="meta-head">
												<a href="#">Marvel Maison</a>
											</div>
											<div class="meta-details">
												<ul>
													<li>
														<a href="#">
															<span class="lnr lnr-calendar-full"></span>
															13th Oct, 2018
														</a>
													</li>
													<li>
														<a href="#">
															<span class="lnr lnr-bubble"></span>
															03
														</a>
													</li>
												</ul>
											</div>
										</div>
									</div>
								</div> -->
							</div>
						</div>
					</c:forEach>
				</div>
			</section>
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