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


	<c:forEach var="vo1" items="${list }">

		<section class="sample-text-area" >
				<div class="col-md-6" style="width:80%">
					<h3 class="text-heading">${vo1.title }</h3>
					<p class="sample-text">${vo1.content}</p>
					<p>
						<b> <fmt:formatDate value="${vo1.regdate }"
								pattern="yyyy-MM-dd" /></b> <b><fmt:formatDate
								value="${vo1.expdate }" pattern="yyyy-MM-dd" /></b>
					<p>
				</div>
		</section>
	</c:forEach>

	<div class="text-center">
		<ul class="pagination">
			<c:if test="${startPage>1 }">
				<li><a
					href="../detail/detail.do?type=${type}&no=${no}&page=${startPage-1 }">&lt;</a></li>
			</c:if>
			<c:set var="typo" value="" />
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${curpage==i }">
					<c:set var="typo" value="class=active" />
				</c:if>
				<c:if test="${curpage!=i }">
					<c:set var="typo" value="" />
				</c:if>
				<li ${typo }><a
					href="../mypage/detail.do?type=${type}&no=${no}&page=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${endPage<allPage }">
				<li><a
					href="../detail/detail.do?type=${type}&no=${no}&page=${endPage+1 }">&gt;</a></li>
			</c:if>
		</ul>
	</div>

</body>
</html>