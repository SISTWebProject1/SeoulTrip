<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="../css/style.css" />
<style type="text/css">
.row > .form-group{
 color: #cccccc;
 font-weight: BOLD;
}

.booking-form {
	width: 100%;
	height: 350px;
}

.row {
	margin: 0px auto;
}

</style>
</head>

<body>
<!-- name, email, tel, time, person, date -->
	<div class="booking-form">
			<div class="row">
				
				 	<div class="form-group">예약자명    ${name }</div>
				 	<div class="form-group">e-mail : ${email}</div>
				 	<div class="form-group">전화번호   : ${tel }</div>
				 	<div class="form-group">예약시간  :  ${time }</div>
				 	<div class="form-group">예약인원  : ${person }</div>
				 	<div class="form-group">예약날짜  : ${date }</div>
			</div>
	</div>
</body>
</html>