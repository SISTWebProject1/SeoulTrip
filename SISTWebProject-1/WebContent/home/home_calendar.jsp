<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="post-slider-area calendar">
	<div class="container box_1170">
		<div class="row justify-content-center">
			<div class="col-lg-10">
				<div class="owl-carousel active-post-carusel">
					<c:forEach var="monthvo" items="${ calendarvo.months }">
						<div class="month"
							<c:if test="${ monthvo.month==4 }">
								selected
							</c:if>
						>
							<div><h2>${ monthvo.month }월</h2></div>
							<div>
								<c:forEach var="datevo" items="${ monthvo.dates }">
									<input type="button"
										<c:choose>
											<c:when test="${ datevo.day eq '일' }">
												style="color:red;"
											</c:when>
											
											<c:when test="${ datevo.day eq '토' }">
												style="color:blue;"
											</c:when>
										</c:choose>
									value="${ datevo.date }"/>
								</c:forEach>
							</div>
							
							<div class="panel-group">
								<div class="panel panel-success">
									<div class="panel-heading">${ flist[0].fname }</div>
									<div class="panel-body">${ flist[0].addr1 }</div>
								</div>
								<div class="panel panel-info">
									<div class="panel-heading">${ flist[1].fname }</div>
									<div class="panel-body">${ flist[1].addr1 }</div>
								</div>
								<div class="panel panel-warning">
									<div class="panel-heading">${ flist[2].fname }</div>
									<div class="panel-body">${ flist[2].addr1 }</div>
								</div>
							</div>
							
							<div></div>
						</div>
					</c:forEach>
				</div>
			</div>
			
		</div>
	</div>
</section>