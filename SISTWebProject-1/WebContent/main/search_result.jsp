<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<tr height="20">
	<th class="bg-light">명소 검색 결과</th>
</tr>
<c:forEach var="tp" items="${ tpList }">
	<tr height="20">
		<td>${ tp.name }</td>
	</tr>
</c:forEach>
<tr height="20">
	<th class="bg-light">음식점 검색 결과</th>
</tr>
<c:forEach var="rs" items="${ rsList }">
	<tr height="20">
		<td>${ rs.name }</td>
	</tr>
</c:forEach>
<tr height="20">
	<th class="bg-light">축제 검색 결과</th>
</tr>
<c:forEach var="fs" items="${ fsList }">
	<tr height="20">
		<td>${ fs.name }</td>
	</tr>
</c:forEach>
<tr height="20">
	<th class="bg-light">태그 검색 결과</th>
</tr>
<%-- <c:forEach>
	<tr height="20">
		<td></td>
	</tr>
</c:forEach> --%>