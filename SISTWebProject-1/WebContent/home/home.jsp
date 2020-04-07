<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
	<link rel="stylesheet" href="../css/home.css">
</head>
<body>

<!-- Start home_calendar Area -->
	<jsp:include page="../home/home_calendar.jsp"></jsp:include>
<!-- Start home_calendar Area -->

<!-- Start body Area -->
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-9 home_content">
				<!-- Start content Area -->
					<jsp:include page="../home/home_content.jsp"></jsp:include>
				<!-- End content Area -->			
			</div>
			<div class="col-xs-3 home_side">
				<!-- Start side Area -->
				<div style="position: sticky; top: 130px;">
					<jsp:include page="../home/home_side.jsp"></jsp:include>
				</div>
				<!-- End side Area -->
			</div>
		</div>
	</div>
<!-- End body Area -->
</body>
</html>