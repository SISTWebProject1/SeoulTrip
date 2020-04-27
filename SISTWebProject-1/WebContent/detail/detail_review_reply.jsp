<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table class="table">
		<c:forEach var="rvo" items="${list }">
			<tr>
				<td class="text-left">
					<c:if test="${rvo.group_tab>0}">
						<c:forEach var="i" begin="1" end="${rvo.group_tab }">
							&nbsp;&nbsp;
						</c:forEach>
						<img src="icon_reply.gif"/>
					</c:if>
					${rvo.memberId}&nbsp;<span style="color:#999;">(${rvo.dbday})</span>
				</td>
				<td class="text-right">
					<c:if test="${rvo.msg!='관리자가 삭제한 댓글입니다'}">
						<c:if test="${sessionScope.id==rvo.memberId }">
							<span class="btn btn-xs btn-primary upBtn" data-no="${rvo.no}">수정</span>
							<a href="../freeboard/reply_delete.do?no=${rvo.no}&bno=${no}" class="btn btn-xs btn-danger">삭제</a>
						</c:if>
							<span class="btn btn-xs btn-success inBtn" data-no="${rvo.no}">댓글</span>
					</c:if>
				</td>
			</tr>			
			<tr>
				<td colspan="2" class="text-left" valign="top">
					<c:if test="${rvo.group_tab>0}">
						<c:forEach var="i" begin="1" end="${rvo.group_tab }">
							&nbsp;&nbsp;
						</c:forEach>
					</c:if>	
					<pre style="white=space: pre-wrap;">${rvo.msg }</pre>
				</td>
			</tr>
			<tr id="m${rvo.no}" style="display:none" class="reply_update">
				<td colspan="2">
					<form method="post" action="../freeboard/reply_update.do">
						<input type=hidden name=bno value="${vo.no}">
						<input type=hidden name=no value="${rvo.no}">
						<textarea rows="5" cols="110" name="msg" style="float:left">${rvo.msg }</textarea>
						<input type="submit" class="btn btn-sm btn-primary" style="height:100px; float:left" value="수정하기">
					</form>
				</td>
			</tr>	
			
			<tr id="i${rvo.no}" style="display:none" class="reply_insert">
				<td colspan="2">
					<form method="post" action="../freeboard/reply_reply_insert.do">
						<input type=hidden name=bno value="${vo.no}">
						<input type=hidden name=pno value="${rvo.no}">
						<textarea rows="5" cols="110" name="msg" style="float:left"></textarea>
						<input type="submit" class="btn btn-sm btn-primary" style="height:100px; float:left" value="댓글쓰기">
					</form>
				</td>
			</tr>				
		</c:forEach>
	</table>
	<table class="table">
		<tr>
			<td>
				<form method="post" action="../freeboard/reply_insert.do">
					<input type=hidden name=bno value="${no}">
					<textarea rows="5" cols="110" name="msg" style="float:left"></textarea>
					<input type="submit" class="btn btn-sm btn-primary" style="height:100px; float:left" value="댓글쓰기">
				</form>
			</td>
		</tr>
	</table>
</body>
</html>