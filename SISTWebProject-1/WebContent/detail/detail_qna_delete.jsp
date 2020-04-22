<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>삭제</title>

</head>
<body>
	<div class="wrapper row2">
		<div id="services" class="clear">
			<div class="text-center">
				<img src="../img/detail/qna_Board.jpg"
					style="width: 700px; height: 150px" />
			</div>
		<div class="row justify-content-md-center">
			<div class="text-center">
				<form method=post action="../detail/detail_qna_delete_ok.do">
					<table class="table">
						<tr>
							<th class="text-center success" width=25%>비밀번호</th>
							<td width=75%><input type="password" name=pwd size=15>
								<input type="hidden" name=seq value="${seq}">
								<input type="hidden" name=no value="${no}">
								<input type="hidden" name=type value="${type}">
								
							</td>
						</tr>
						<tr>
							<td colspan="2" class="text-center"><input type="submit"
								class="btn btn-sm btn-primary" value="삭제"> <input
								type="button" class="btn btn-sm btn-danger" value="취소"
								onclick="javascript:history.back()"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		</div>
	</div>
</body>
</html>