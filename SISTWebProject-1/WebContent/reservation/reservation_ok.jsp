<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="booking-form"id="result">
					<div class="form-group " >
				 		<span class="form-label">예약자명</span> 
				 		<p>  ${vo.name }</p>
				 	</div>
				 	<div class="row " >
				 		<span class="form-label">e-mail</span> 
				 		<p>  ${vo.email}</p>
				 	</div>
				 		<span class="form-label">연락처</span> 
				 		<p> ${vo.tel }</p>
				 		<span class="form-label">예약시간</span> 
				 		<p>   ${vo.time }</p>
				 		<span class="form-label">예약인원</span> 
				 		<p>  ${vo.person }</p>
				 		<span class="form-label">예약날짜</span>
				 		<p> ${vo.date} </p>
					
				</div>
				
</body>
</html>