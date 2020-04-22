<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<title>Detail</title>
</head>
<body>
	<div class="wrapper row2">
		<div id="services" class="clear">
			<div class="text-center">
				<img src="../img/detail/qna_Board.jpg"
					style="width: 700px; height: 150px" />
			</div>
		<div class="row text-center">
			<table class="table">
				<tr>
					<th class="text-center danger" width=20%>번호</th>
					<td class="text-center" width=30%>${vo.seq}</td>
					<th class="text-center danger" width=20%>작성일</th>
					<td class="text-center" width=30%>
						<fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/>
					</td>
				</tr>
				<tr>
					<th class="text-center danger" width=20%>이름</th>
					<td class="text-center" width=30%>${vo.memberid }</td>
					<th class="text-center danger" width=20%>조회수</th>
					<td class="text-center" width=30%>${vo.hit }</td>
				</tr>
				<tr>
					<th class="text-center danger" width=20%>제목</th>
					<td class="text-left" colspan="3">${vo.title }</td>
				</tr>
				<tr>
					<td class="text-left" colspan="4" valign="top" height="200">${vo.content }</td>
				</tr>
				<tr>
					<td class="text-right" colspan="4">
						<a href="../detail/detail_qna_reply.do?type=${type}&no=${no}&seq=${vo.seq}" class="btn btn-xs btn-primary">답변</a>
						<a href="../detail/detail_qna_update.do?type=${type}&no=${no}&seq=${vo.seq}" class="btn btn-xs btn-success">수정</a>
						<a href="../detail/detail_qna_delete.do?type=${type}&no=${no}&seq=${vo.seq}" class="btn btn-xs btn-info">삭제</a>
						<a href="../detail/detail.do?type=${type}&no=${no}" class="btn btn-xs btn-warning">목록</a>
					</td>
				</tr>
			</table>
		</div>
		</div>
	</div>
</body>
</html>