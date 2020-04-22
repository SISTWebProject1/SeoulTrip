<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${bCheck==true }">
	<c:redirect url="../detail/detail.do?type=${type}&no=${no}"/>
</c:if>
<c:if test="${bCheck==false }">
	<script>
		alert("비밀번호가 틀립니다 !!");
		history.back();
	</script>
</c:if>
