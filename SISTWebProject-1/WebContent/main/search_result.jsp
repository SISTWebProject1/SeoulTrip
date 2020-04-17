<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<tr>
	<th class="bg-light">명소 검색 결과</th>
</tr>
<tr>
	<td>
		<c:forEach var="tp" items="${ tpList }">
			<a href="../detail/detail.do?type=1&no=${ tp.no }">${ tp.name }</a>,&nbsp;
		</c:forEach>
		<c:choose>
			<c:when test="${ fn:length(tpList) eq 0 }">
				검색 결과가 없습니다.
			</c:when>
			<c:otherwise>
				<a href="#">더보기...</a>
			</c:otherwise>
		</c:choose>
	</td>
</tr>
<tr>
	<th class="bg-light">음식점 검색 결과</th>
</tr>
<tr>
	<td>
		<c:forEach var="rs" items="${ rsList }">
			<a href="../detail/detail.do?type=2&no=${ rs.no }">${ rs.name }</a>,&nbsp;
		</c:forEach>
		<c:choose>
			<c:when test="${ fn:length(rsList) eq 0 }">
				검색 결과가 없습니다.
			</c:when>
			<c:otherwise>
				<a href="#">더보기...</a>
			</c:otherwise>
		</c:choose>
	</td>
</tr>
<tr>
	<th class="bg-light">축제 검색 결과</th>
</tr>
<tr>
	<td>
		<c:forEach var="fs" items="${ fsList }">
			<a href="../detail/detail.do?type=3&no=${ fs.no }">${ fs.name }</a>,&nbsp;
		</c:forEach>
		<c:choose>
			<c:when test="${ fn:length(fsList) eq 0 }">
				검색 결과가 없습니다.
			</c:when>
			<c:otherwise>
				<a href="#">더보기...</a>
			</c:otherwise>
		</c:choose>
	</td>
</tr>
<tr>
	<th class="bg-light">태그 검색 결과</th>
</tr>
<tr>
	<td>
		<c:forEach var="ht" items="${ htList }">
			<a href="../detail/detail.do?type=${ ht.type }&no=${ ht.no }">${ ht.name }</a>,&nbsp;
		</c:forEach>
		<c:choose>
			<c:when test="${ fn:length(htList) eq 0 }">
				검색 결과가 없습니다.
			</c:when>
			<c:otherwise>
				<a href="#">더보기...</a>
			</c:otherwise>
		</c:choose>
	</td>
</tr>