<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- <!-- Start home_calendar Area -->
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
	</div> --%>
<!-- End body Area -->
<!-- Detail Bottom Area -->
 <jsp:include page="../detail/detail_info.jsp"></jsp:include>
 <jsp:include page="../detail/detail_review.jsp"></jsp:include>
 <jsp:include page="../detail/detail_bottom.jsp"></jsp:include>
</body>
</html>