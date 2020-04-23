<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
</head>
<body>
	<!-- Start body Area -->
	<div class="main-body body-gap">
		<div class="container box_1170">
			<div class="row">
				<div class="col-lg-3 sidebar">
					<!-- Start food_side Area -->
					<jsp:include page="food_side.jsp"></jsp:include>
					<!-- End food_side Area -->
				</div>
				<div class="col-lg-9 post-list">
					<!-- Start food_content Area -->
					<jsp:include page="food_content.jsp"></jsp:include>
					<!-- End food_content Area -->
				</div>
			</div>
		</div>
	</div>
	<!-- End body Area -->
</body>
</html>