<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="single-widget food_left">
		<div class="food_type">
			<div class="food_type_name">
				<h5 style="display: inline-block;">음식점 태그</h5>
				<a href="food.do" style="float: right; position: relative; top: 8px;"><font color="gray">초기화</font></a>
			</div>
		<span id="multiPrint"></span><br />
			<c:forEach var="vo" items="${taglist }">
			<div class="food_type_detail">
				<div>
					<input type="checkbox" name="foodtaglist" class="check" value="${vo.tagcode}" 
						<c:if test="${ vo.tagcode eq tagvo.tagcode }">checked</c:if>
					>${vo.tagname}
				</div>
				<br>
			</div>
			</c:forEach>
			<input type="checkbox" class="check" id="targetpage" style="display: none;" checked/>
		</div>
	</div>