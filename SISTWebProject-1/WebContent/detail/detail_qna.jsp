<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-lg-10 post-list" id="QnA-List">
	<section class="post-area">
<%-- 	<div class="wrapper row2">
		<div id="services" class="clear">
			<div class="row text-center">
				<img src="reply.png" />
			</div>
			<div class="row">
				<table class="table">
					<tr>
						<td>
							<a href="../reply/insert.do" class="btn btn-sm btn-danger">새글</a>
						</td>
					</tr>
				</table>
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
							<td width="10%" class="text-center">${vo.no }</td>
							<td width="45%">
							<c:if test="${vo.group_tab>0 }">
								<c:forEach var="i" begin="1" end="${vo.group_tab }" step="1">
									&nbsp;&nbsp;
								</c:forEach>
								<img src="icon_reply.gif"/>
							</c:if>
							<a href="../reply/detail.do?no=${vo.no}">${vo.subject }</a>
							</td>
							<td width="15%" class="text-center">${vo.name }</td>
							<td width="20%" class="text-center"><fmt:formatDate
									value="${vo.regdate }" pattern="yyyy-MM-dd" />
							<td width="10%" class="text-center">${vo.hit }</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div class="row text-center">
				<a href="../reply/list.do?page=${curpage>1?curpage-1:curpage }" class="btn btn-sm btn-primary">이전</a>
					${curpage } page/ ${totalpage } pages
				<a href="../reply/list.do?page=${curpage<totalpage?curpage+1:curpage }" class="btn btn-sm btn-primary">다음</a>
			</div>
		</div>
	</div> --%>

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
		</div>
<!-- 	</section>
</div> -->