<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/bootstrap.min.css">
<style type="text/css">
.row{
	margin: 0px auto;
	width: 600px;
}

h2{
	text-align: center;
	
}

</style>
</head>
<body>
	<form method=post action="insert_ok.jsp">
	<div class="container">
		<h2>글쓰기</h2>
		<div class="row">
		<table class="table table-hover">
			<tr>
				<th width="20%" class="text-right default">제목</th>
				<td width="80%">
					<input type=text name=name size=50>
				</td>
			</tr>
			<tr>
				<th width="20%" class="text-right default">내용</th>
				<td width="80%">
					<input type=text name=name size=50>
				</td>
			</tr>
			<tr>
				<th width="20%" class="text-right default">사진</th>
				<td width="80%">
					<textarea rows="8" cols="55" name=content></textarea>
				</td>
			</tr>
			
			<tr>
				<th width="20%" class="text-right default">비밀번호</th>
				<td width="80%">
					<input type="password" name=pwd size=10>
				</td>
			</tr>
			<tr>
				<td class="text-center" colspan="2">
				<input type="submit" value="글쓰기" class="btn btn-sm btn-primary"> 
				<input type="button" value="취소" class="btn btn-sm btn-danger"
				onclick="profile.jsp"> 
				
				</td>
			</tr>
		</table>
		
		
		</div>
	</div>
	</form>
</body>
</html>