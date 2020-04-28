<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Jua|Single+Day|Stylish&display=swap&subset=korean"
 rel="stylesheet">
<style type="text/css">
.sample-text{
	font-family: Jua;
	font-size: 18px;
}
.text-heading{
	font-family: Lato;
	font-size:30px;
}
</style>
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
			<br>
			<pre class="sample-text" style="white-space: pre-wrap;border: none;">${vo1.content }</pre>
			<p >
				<b>등록일 :&nbsp;<fmt:formatDate value="${vo1.expdate }"
						pattern="yyyy-MM-dd" /></b>
				<br>
				<b>수정일 :&nbsp;<fmt:formatDate value="${vo1.regdate }"
						pattern="yyyy-MM-dd" /></b>
			</p>
			<div style="border-bottom: 2px groove; text-align: right">
				<a href="../mypage/review_update_mypage.do?id=${ss_member.memberId}&reviewno=${vo1.reviewno}&no=${vo1.no}" class="btn-btn-sm btn-danger">수정</a>
				<a href="#" class="btn-btn-sm btn-danger">삭제</a>
			</div>
		</c:forEach>
		<div class="text-center">
      	<a href="../mypage/profile.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-md btn-primary" style="background-color: blue;color:white;" >이전</a>
       		 ${curpage } page / ${totalpage } pages
      	<a href="../mypage/profile.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary" style="background-color: blue;color:white;">다음</a>
   		 </div>
	</div>


</body>
</html>