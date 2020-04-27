<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="htit" items="${ htitemlist }">
	<div class="col-lg-3 col-md-3">
		<div class="single-post-item short">
			<figure>
				<a href="../detail/detail.do?type=${ htit.type }&no=${ htit.no }">
				<img style="height: 150px; width: 100%;" class="post-img img-fluid" src="${ htit.photo }" onerror="javascript:src='../img/logo.png'" style="height: 300px;">
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
</body>
</html>