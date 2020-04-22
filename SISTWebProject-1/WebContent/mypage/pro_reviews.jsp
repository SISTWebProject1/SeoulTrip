<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div class="container">
		<c:forEach var="vo1" items="${mypage_review_list }">
			<h3 class="text-heading">${vo1.title }</h3>
			<c:if test="${vo1.filepath != 'null' }">
				<img src="${vo1.filepath }" class="img-fulid">
			</c:if>
			<c:if test="${vo1.filepath =='null' }">
				<sub style=""><b>사진을 추가 해주세요</b></sub>
				<img src="../mypage/default_reviews_image.jpg">
			</c:if>
			<p class="sample-text">${vo1.content }</p>
			<p>
				<b>등록일 :&nbsp;<fmt:formatDate	value="${vo1.expdate }" pattern="yyyy-MM-dd" /></b>
			</p>
			<div  style="border-bottom: 2px groove; text-align: right">
				<input type="button" class="btn-btn-sm btn-danger" value="수정">
				<input type="button" class="btn-btn-sm btn-danger" value="삭제">
			</div>
		</c:forEach>
	</div>
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${startPage>1 }">
				<li><a href="#">&lt;</a></li>
			</c:if>
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${curpage==1 }">
					<c:set var="typo" value="class=active" />
				</c:if>
				<c:if test="${curpage!=1 }">
					<c:set var="typo" value="" />
				</c:if>
			</c:forEach>
			<c:if test="${endPage<allPage }">
				<li><a href="#">&gt;</a></li>
			</c:if>
		</ul>
	</div>

</body>
</html>