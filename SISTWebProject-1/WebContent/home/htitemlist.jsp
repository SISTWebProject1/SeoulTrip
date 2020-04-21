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
			<h1 style="margin: 50px 25px;">#${ htvo.tagname }</h1>
			<section class="post-area">
				<div class="row">
					<c:forEach var="htit" items="${ htitemlist }">
						<div class="col-lg-3 col-md-3">
							<div class="single-post-item short">
								<figure>
									<a href="../detail/detail.do?type=${ htit.type }&no=${ htit.no }">
									<img class="post-img img-fluid" src="${ htit.photo }" onerror="javascript:src='../img/logo.png'" style="height: 300px;">
									</a>
								</figure>
								<h3>
									<a href="../detail/detail.do?type=${ htit.type }&no=${ htit.no }">${ htit.name }</a>
								</h3>
								<a href="../detail/detail.do?type=${ htit.type }&no=${ htit.no }" class="primary-btn text-uppercase mt-15">상세보기</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</section>
			
			<div class="text-center">
				<ul class="pagination">
					<c:forEach var="i" begin="1" end="${ totalpage }">
						<li 
							<c:if test="${ i eq curpage }">class="active"</c:if>
						 ><a href="htitemlist.do?tagcode=${ htvo.tagcode }&page=${ i }">${ i }</a></li>
					</c:forEach>
				</ul>
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