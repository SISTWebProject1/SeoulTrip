<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 리뷰 뿌려주기 -->
<div class="col-lg-10 post-list" id="Content-List">
	<!-- Start Post Area -->
	<section class="post-area">
		<c:forEach var="vo" items="${list }">
		<div class="single-post-item">
			<h3>
				<a href="blog-details.html">${vo.title }</a>
			</h3>
				<br>
				<c:forEach var="vo2" items="${imglist }">
					<c:if test="${vo.reviewno eq vo2.reviewno}">
						<img src="${vo2.filepath }" width="80" height="80" style="display:inline-block"/>
					</c:if>	
			</c:forEach>

			<div style="width:100%; height:70px;">${vo.content}</div>

			<a href="blog-details.html" class="primary-btn text-uppercase mt-15" id="continue">continue
				Reading</a>
			<div class="post-box" style="width:100%" id='mouse_over'>
				<div class="d-flex">
					<div>
						<a href="#"> <img src="img/author/a1.png" alt="" />
						</a>
					</div>
					<div class="post-meta">
						<div class="meta-head">
							<a href="../home/profile_data.do?id=${vo.memberid}">${vo.memberid }</a>
						</div>
						<div class="meta-details">
							<ul>
								<li><a href="#"> <span class="lnr lnr-calendar-full"></span>
										<fmt:formatDate	value="${vo.regdate }" pattern="yyyy-MM-dd" />
								</a></li>
								<li><a href="#"> <span class="lnr lnr-picture"></span>
										<fmt:formatDate	value="${vo.expdate }" pattern="yyyy-MM-dd" />
								</a></li>
								<li><a href="#"> <span class="lnr lnr-coffee-cup"></span>
										${vo.likecount }
								</a></li>
								<li><a href="#"> <span class="lnr lnr-bubble"></span>
										${vo.grade }
								</a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
<!-- ####################################################################################################################################### -->
			<div style="height:20px"></div>
			<table class="table">
				<c:forEach var="rvo" items="${list }">
					<tr>
						<td class="text-left">
							<c:if test="${rvo.group_tab>0}">
								<c:forEach var="i" begin="1" end="${rvo.group_tab }">
									&nbsp;&nbsp;
								</c:forEach>
								<img src="icon_reply.gif"/>
							</c:if>
							${rvo.name}&nbsp;<span style="color:#999;">(${rvo.dbday})</span>
						</td>
						<td class="text-right">
							<c:if test="${rvo.msg!='관리자가 삭제한 댓글입니다'}">
								<c:if test="${sessionScope.id==rvo.id }">
									<span class="btn btn-xs btn-primary upBtn" data-no="${rvo.no}">수정</span>
									<a href="../freeboard/reply_delete.do?no=${rvo.no}&bno=${vo.no}" class="btn btn-xs btn-danger">삭제</a>
								</c:if>
									<span class="btn btn-xs btn-success inBtn" data-no="${rvo.no}">댓글</span>
							</c:if>
						</td>
					</tr>			
					<tr>
						<td colspan="2" class="text-left" valign="top">
		<%-- 					<c:if test="${rvo.group_tab>0}">
								<c:forEach var="i" begin="1" end="${rvo.group_tab }">
									&nbsp;&nbsp;
								</c:forEach>
							</c:if>	 --%>
							<pre style="white=space: pre-wrap;">${rvo.msg }</pre>
						</td>
					</tr>
					<tr id="m${rvo.no}" style="display:none" class="reply_update">
						<td colspan="2">
							<form method="post" action="../freeboard/reply_update.do">
								<input type=hidden name=bno value="${vo.no}">
								<input type=hidden name=no value="${rvo.no}">
								<textarea rows="5" cols="110" name="msg" style="float:left">${rvo.msg }</textarea>
								<input type="submit" class="btn btn-sm btn-primary" style="height:100px; float:left" value="수정하기">
							</form>
						</td>
					</tr>	
					
					<tr id="i${rvo.no}" style="display:none" class="reply_insert">
						<td colspan="2">
							<form method="post" action="../freeboard/reply_reply_insert.do">
								<input type=hidden name=bno value="${vo.no}">
								<input type=hidden name=pno value="${rvo.no}">
								<textarea rows="5" cols="110" name="msg" style="float:left"></textarea>
								<input type="submit" class="btn btn-sm btn-primary" style="height:100px; float:left" value="댓글쓰기">
							</form>
						</td>
					</tr>				
				</c:forEach>
					<tr>
						<td class="text-center" colspan="2">
							<a href="#" class="btn btn-xs btn-danger">이전</a>
							${curpage } page/ ${totalpage } pages
							<a href="#" class="btn btn-xs btn-danger">다음</a>
						</td>
					</tr>
			</table>
			<table class="table">
				<tr>
					<td>
						<form method="post" action="../freeboard/reply_insert.do">
							<input type=hidden name=bno value="${vo.no}">
							<textarea rows="5" cols="110" name="msg" style="float:left"></textarea>
							<input type="submit" class="btn btn-sm btn-primary" style="height:100px; float:left" value="댓글쓰기">
						</form>
					</td>
				</tr>
			</table>
<!-- ####################################################################################################################################### -->			
		</div>
		</c:forEach>
		<div class="text-center">
		<ul class="pagination">
			<c:if test="${startPage>1 }">
				<li><a href="../detail/detail.do?type=${type}&no=${no}&page=${startPage-1 }">&lt;</a></li>
			</c:if>
			<c:set var="typo" value="" />
			<c:forEach var="i" begin="${startPage }" end="${endPage }">
				<c:if test="${curpage==i }">
					<c:set var="typo" value="class=active" />
				</c:if>
				<c:if test="${curpage!=i }">
					<c:set var="typo" value="" />
				</c:if>
				<li ${typo }><a href="../detail/detail.do?type=${type}&no=${no}&page=${i}">${i}</a></li>
			</c:forEach>
			<c:if test="${endPage<allPage }">
				<li><a href="../detail/detail.do?type=${type}&no=${no}&page=${endPage+1 }">&gt;</a></li>
			</c:if>
		</ul>
	</div>
<!-- 	</section>
</div> -->
