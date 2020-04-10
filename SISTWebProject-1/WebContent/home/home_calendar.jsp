<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<section class="post-slider-area calendar">
	<div class="container box_1170">
		<div class="row justify-content-center">
			<div class="col-lg-10">
				<div class="owl-carousel active-post-carusel">
					<c:forEach var="monthvo" items="${ calendarvo.months }">
						<div class="month">
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
								<c:set var="fvo_count" value="0"/>
								<c:forEach var="fvo" items="${ flist }" >
										<c:set var="fvo_month" value="${ fvo.fmtEnd }"/>
										<c:set var="fvo_month" value="${ fvo_month.substring(5,7) }"/>
										<fmt:parseNumber var="fvo_month" value="${ fvo_month }"/>
										<c:if test="${ fvo_month eq monthvo.month && fvo_count lt 3 && monthvo.month ne 12 }">
											<div class="panel 
												<c:choose>
													<c:when test="${ fvo_count==0 }">panel-success</c:when>
													<c:when test="${ fvo_count==1 }">panel-info</c:when>
													<c:when test="${ fvo_count==2 }">panel-warning</c:when>
												</c:choose>
											" onclick="location.href='../festival/detail.do?no=${ fvo.no }'" 
												style="cursor:pointer;">
												<div class="panel-heading">${ fvo.fname }</div>
												<div class="panel-body">
													${ fvo.addr1 }<br/>
													${ fvo.fmtStart } ~ ${ fvo.fmtEnd }
												</div>
											</div>
											<c:set var="fvo_count" value="${ fvo_count+1 }"/>
										</c:if>
								</c:forEach>
							</div>
							
							<div></div>
						</div>
					</c:forEach>
				</div>
			</div>
			
		</div>
	</div>
</section>


















