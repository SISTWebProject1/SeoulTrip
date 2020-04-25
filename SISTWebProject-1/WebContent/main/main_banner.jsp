<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<section class="banner-area main-banner">
	<div class="container box_1170">
		<div class="row fullscreen d-flex align-items-center justify-content-center">
			<div class="banner-content text-center col-lg-8">
			
				<div class="single-widget search-widget" style="border:0px solid white;">
					<form class="example" action="javascript:void(0);" style="margin:auto;max-width:500px">
						<input type="text" placeholder="검색" name="search2">
						
						<button type="submit"><i class="fa fa-search"></i></button>
					</form>
					
					<c:if test="${ !empty htlist }">
						<font color="white" style="display: inline-block; position: relative; top: 30px;">최신 태그 : </font>
						<div class="btn-group" style="display: inline-block;">
							<c:forEach var="htvo" items="${ htlist }">
								<button type="button" class="btn btn-primary" 
								onclick="location.href='../home/htitemlist.do?tagcode=${ htvo.tagcode }'">
									#${ htvo.tagname }
								</button>
							</c:forEach>
						</div>
					</c:if>
				</div>
				
			</div>
		</div>
	</div>
</section>