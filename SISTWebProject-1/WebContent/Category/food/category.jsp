<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<link rel="stylesheet" href="css/home.css">
</head>
<body>
<!-- Start home_banner Area -->
	<jsp:include page="home_banner.jsp"></jsp:include>
<!-- End home_banner Area -->

<!-- Start body Area -->
		<div class="main-body body-gap">
		<div class="container box_1170">
			<div class="row">
				<!-- Start Post Area -->
					<jsp:include page="category_post.jsp"></jsp:include>
				<!-- End Post Area --> -->			
			</div>
			<div class="col-xs-3 home_side">
				<!-- Start side Area -->
				<div style="position: sticky; top: 130px;">
					<jsp:include page="category_content.jsp"></jsp:include>
				</div>
				<!-- End side Area -->
			</div>
		</div>
	</div>
<!-- End body Area -->
</body>
</html>