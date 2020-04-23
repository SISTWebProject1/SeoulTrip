<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-lg-10">
			<div class="single-widget search-widget">
				<form class="example" action="#"
					style="margin: auto; max-width: 300px">
					<input type="text" placeholder="Search Posts" name="search2"
						id="keyword" />
					<button type="submit">
						<i class="fa fa-search"></i>
					</button>
				</form>
			</div>
		</div>
		<div class="col-lg-2">
			<a href="../detail/detail_qna_insert.do?type=${type}&no=${no}"><input type="button" class="button"
				style="margin-top: 50px; background-color: #555555; color: white;"
				value="질문하기"/></a>
		</div>
	</div>
	<div id="result">
		<!-- ####################################  -->
		<div class="wrapper row2">
		<div id="services" class="clear">
			<div class="text-center">
				<img src="../img/detail/qna_Board.jpg" style="width:700px; height:150px"/>
			</div>
			<div class="row">
				<table class="table">
					<tr class="success">
						<th width="10%" class="text-center">번호</th>
						<th width="45%" class="text-center">제목</th>
						<th width="15%" class="text-center">이름</th>
						<th width="20%" class="text-center">작성일</th>
						<th width="10%" class="text-center">조회수</th>
					</tr>
					<c:forEach var="vo" items="${list }">
						<tr>
							<td width="10%" class="text-center">${vo.seq }</td>
							<td width="45%">
							<c:if test="${vo.group_tab>0 }">
								<c:forEach var="i" begin="1" end="${vo.group_tab }" step="1">
									&nbsp;&nbsp;
								</c:forEach>
								<img src="../img/detail/icon_reply.gif"/>
							</c:if>
							<a href="../detail/detail_qna_detail.do?type=${type}&no=${no}&seq=${vo.seq}">${vo.title }</a>
							</td>
							<td width="15%" class="text-center">${vo.memberid }</td>
							<td width="20%" class="text-center"><fmt:formatDate
									value="${vo.regdate }" pattern="yyyy-MM-dd" />
							<td width="10%" class="text-center">${vo.hit }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			</div>
		</div>

	</div>
</body>
</html>

<!-- 
		<div class="single-post-item" id="Qna_Board">
			<h3>
				<a href="blog-details.html">질문 내용은 다음과 같습니다.</a>
			</h3>
			<p>질문 내용은 다음과 같습니다./질문 내용은 다음과 같습니다./질문 내용은 다음과 같습니다. /질문 내용은 다음과
				같습니다./질문 내용은 다음과 같습니다./질문 내용은 다음과 같습니다. /질문 내용은 다음과 같습니다./질문 내용은 다음과
				같습니다./질문 내용은 다음과 같습니다.</p>
			<a href="blog-details.html" class="primary-btn text-uppercase mt-15">더보기</a>
			<div class="post-box">
				<div class="d-flex">
					<div>
						<a href="#"> <img src="img/author/a1.png" alt="" />
						</a>
					</div>
					<div class="post-meta">
						<div class="meta-head">
							<a href="#">회원명</a>
						</div>
						<div class="meta-details">
							<ul>
								<li><a href="#"> <span class="lnr lnr-calendar-full"></span>
										13th Oct, 2018 (리뷰작성일)
								</a></li>
								<li><a href="#"> <span class="lnr lnr-picture"></span>
										Image Post
								</a></li>
								<li><a href="#"> <span class="lnr lnr-coffee-cup"></span>
										Food & Travel
								</a></li>
								<li><a href="#"> <span class="lnr lnr-bubble"></span>
										03 Comments
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div> -->