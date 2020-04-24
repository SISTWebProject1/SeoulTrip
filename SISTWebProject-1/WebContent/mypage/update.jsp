<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
	$(function() {
		$('#pwd2')
				.keyup(
						function() {
							var k = $(this).val();
							console.log(k)
							var id = $('#id').val();
							$
									.ajax({
										type : 'POST',
										url : '../mypage/passwordCheck.do',
										data : {
											"pwd" : k,
											"id" : id
										},
										success : function(res) {
											var no = res.trim();
											console.log(no)
											if (no == 1) {
												$('#result')
														.html(
																"<font color=blue>비밀번호가 맞습니다.수정할 수 있습니다</font>")
												$('#updateBtn').attr(
														'disabled', false)

											} else {
												$('#result')
														.html(
																"<font color=red>비밀번호가 틀립니다</font>")
												$('#updateBtn').attr(
														'disabled', true)

											}
										}
									})
						});
	});
</script>

<style type="text/css">
select {
	float: left;
	width: 80px;
	margin: 2px;
}
.row {
   margin: 0px auto;
   width:1000px;
}
</style>
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:700|Roboto:400,500"
	rel="stylesheet">
<!--
			CSS
			============================================= -->
<link rel="stylesheet" href="../css/linearicons.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/bootstrap.css">
<link rel="stylesheet" href="../css/magnific-popup.css">
<link rel="stylesheet" href="../css/nice-select.css">
<link rel="stylesheet" href="../css/animate.min.css">
<link rel="stylesheet" href="../css/owl.carousel.css">
<link rel="stylesheet" href="../css/main.css">
</head>
<body>

		<div class="container">
			<h1 style="margin: 10px;">Profile 수정</h1>
			<div class="row">
				<form method=post action="../mypage/update_ok.do" id="reply_frm">
					<table class="table table-hover">
						<tr>
							<th width=20% id=name class="text-right success">아이디</th>
							<td width=80%><input type=text name=id size=15
								value="${my_vo.memberId }" disabled></td>
						</tr>
						<tr>
							<th width="20%" class="text-right success">사진 </th>
							<td width="80%">
								<div class="filebox preview-image"> 
      								<input type="file" name=photo id="photo" class="upload-hidden"> 
      							</div>
							</td>
						</tr>

						<tr>
							<th width=20% id=name class="text-right success">이름</th>
							<td width=80%><input type=text name=name size=15
								value="${my_vo.name }" id=name> <input type=hidden name=id
								id=id value="${my_vo.memberId}"></td>
						</tr>

						<tr>
							<th width=20% class="text-right success">생일</th>
							<td width=80%>
							<select id="select_year" name="year">
								<c:forEach var="i"  begin="1800" end="2020">
									<c:if test="${i==year }">
										<option value="${i }" selected>${i }년</option>
									</c:if>
									<c:if test="${i!=year }">
										<option value="${i }">${i }년</option>
									</c:if>
								
								</c:forEach>
							</select> 
							<select id="select_month" name="month">
								<c:forEach var ="i"  begin="1" end="12" step="1">
									<c:if test="${i==month }">
										<option selected value="${i }">${i }월</option>
									</c:if>
									<c:if test="${i!=day }">
										<option value="${ i}">${i }월</option>
									</c:if>
								</c:forEach>
							</select> 
							<select id="select_day" name="day">
								<c:forEach var="i" begin="1" end="31">
									<c:if test="${i==day }">
										<option value="${i }"selected>${i }일</option>
									</c:if>
									<c:if test="${i != day }">
										<option value="${i}">${i }일</option>
									</c:if>
								</c:forEach>
							</select>
							</td>
						</tr>


						<tr>
							<th width=20% class="text-right success">주소</th>
							<td width=80%><input type=text name=addr1 id=addr1 size=50
								value="${my_vo.addr1 }"></td>
						</tr>

						<tr>
							<th width=20% class="text-right success">E-mail</th>
							<td width=80%><input type=text name=email id=email size=50
								value="${my_vo.email }"></td>
						</tr>
						<tr>
							<th width=20% class="text-right success">핸드폰</th>
							<td width=80%><input type=text id=tel name=tel size=50
								value="${my_vo.tel }"></td>
						</tr>

						<tr>
							<th width=20% class="text-right success">자기소개</th>
							<td width=80%><textarea rows="8" cols="55" name=selfinfo
									id=selfinfo>${my_vo.selfInfo }</textarea></td>
						</tr>

						<tr>
							<th width=20% class="text-right success">비밀번호</th>
							<td width=80%><input type="password" name=pwd size=10
								id=pwd2>
								<div id="result"></div></td>
						</tr>

						<tr>
							<td class="text-center" colspan="2"><input type="submit"
								value="수정" class="btn btn-sm btn-primary" id="updateBtn"
								disabled> <input type="button" value="취소"
								class="btn btn-sm btn-danger"
								onclick="javascript:history.back()"></td>
						</tr>

					</table>
				</form>
			</div>
	</div>
</body>
</html>