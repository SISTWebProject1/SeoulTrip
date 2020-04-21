<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<title>Insert title here</title>
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
				<form method=post action="../detail/detail_qna_insert_ok.do">
					<table class="table text-center">
						<tr>
							<th width=20% class="text-right success">이름</th>
							<td width=80%><input type="text" name=memberid size=15 value="${memberid }" disabled />
							<input type="hidden" name=no value="${no }"/>
							<input type="hidden" name=type value="${type }"/>
							</td>
						</tr>

						<tr>
							<th width=20% class="text-right success">제목</th>
							<td width=80%><input type="text" name=title size=50
								required /></td>
						</tr>

						<tr>
							<th width=20% class="text-right success">내용</th>
							<td width=80%><textarea rows="8" cols="55" name=content
									required></textarea></td>
						</tr>
						<tr>
							<th width=20% class="text-right success">비밀번호</th>
							<td width=80%><input type="password" name=pwd size=10
								required /></td>
						</tr>

						<tr>
							<td class="text-center" colspan="2"><input type="submit"
								value="글쓰기" class="btn btn-sm btn-primary" /> <input
								type="button" value="취소" class="btn btn-sm btn-danger"
								onclick="javascript:history.back()" /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
		</div>
	</div>
</body>
</html>


<!-- <div class="wrapper row">
		<div id="services" class="clear">
			<div class="row text-center">
				<img src="../img/detail/qna_Board.jpg" style="width:900px; height:200px"/>
			</div>
		<div class="row">
		<form method=post action="../detail/detail_qna_insert_ok.do">
			<table class="table table-hover">
				<tr>
					<th width=20% class="text-right success">이름</th>
					<td width=80%>
						<input type="text" name=name size=15 required/>
					</td>
				</tr>
				
				<tr>
					<th width=20% class="text-right success">제목</th>
					<td width=80%>
						<input type="text" name=subject size=50 required/>
					</td>
				</tr>
				
				<tr>
					<th width=20% class="text-right success">내용</th>
					<td width=80%>
						<textarea rows="8" cols="55" name=content required></textarea>
					</td>
				</tr>
				<tr>
					<th width=20% class="text-right success">비밀번호</th>
					<td width=80%>
						<input type="password" name=pwd size=10 required/> 
					</td>
				</tr>

				<tr>
					<td class="text-center" colspan="2">
						<input type="submit" value="글쓰기" class="btn btn-sm btn-primary"/>
						<input type="button" value="취소" class="btn btn-sm btn-danger" onclick="javascript:history.back()"/>						 
					</td>
				</tr>				
			</table>
			</form>
		</div>
	</div>
</div> -->