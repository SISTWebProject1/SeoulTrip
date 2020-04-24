<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
</head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(function () {
	var foodtagcode = [];
	$('.check:checked').each(function(){
    	foodtagcode.push($(this).val());
    	
		$.ajax({
			type:"POST",
			url:"foodtag_content.do",
			data:{"foodtagcode":foodtagcode},
			success:function(res)
			{
				$('#foodtag').html(res);
			},
			error: function () {
				alert("오류");
			}
		})
     });
});
</script>
<body>
	<!-- Start body Area -->
	<div class="main-body body-gap">
		<div class="container box_1170">
			<div class="row">
				<div class="col-lg-3 sidebar">
					<!-- Start food_side Area -->
					<jsp:include page="food_side.jsp"/>
					<!-- End food_side Area -->
				</div>
				<div class="col-lg-9 post-list" id="foodtag">
					<!-- Start food_content Area -->
					<jsp:include page="food_content.jsp"/>
					<!-- End food_content Area -->
				</div>
			</div>
		</div>
	</div>
	<!-- End body Area -->
</body>
</html>