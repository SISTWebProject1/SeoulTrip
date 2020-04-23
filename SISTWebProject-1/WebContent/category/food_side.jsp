<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div class="single-widget search-widget">
		<form class="map_map" action="#">
			<img src="https://static.tacdn.com/img2/maps/img_map.png" alt="" class="map_img">
			<div class="map_top">
				<button class="map_button" type="button" onclick="">지도 보기</button>
			</div>
		</form>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
	
	
/* 		$(document).ready(function() {
			// .check 클래스 중 어떤 원소가 체크되었을 때 발생하는 이벤트
			$(".check").click(function() { // 여기서 .click은 체크박스의 체크를 뜻한다.
				var str = ""; // 여러개가 눌렸을 때 전부 출력이 될 수 있게 하나의 객체에 담는다.
				$(".check").each(function() { // .each()는 forEach를 뜻한다.
					if ($(this).is(":checked")) // ":checked"를 이용하여 체크가 되어있는지 아닌지 확인한다.
						str += $(this).val() + ""; // 체크된 객체를 str에 저장한다.
				});
				$("#multiPrint").text(str); // #multiPrint에 체크된 원소를 출력한다.
			});

		
/* 		$(function(){
			  $('input[type="checkbox"]').click(function(){
			   var output = '';
			   $('input[type="checkbox"]:checked').each(function(index,item){
			    if(index!=0){
			     output += ',';
			    }
			    output += $(this).val();
			   });
			   alert(output);
			  });
			 }); */
		
/* 		var output = [];
		$("input[type="checkbox"]:checked").each(function(i){
			output.push($(this).val());
			alert(output());
		}); */
	
	    var taglist = [];
	    $('.check:checked').each(function(){
	    	taglist.push($(this).val());
	    });

	</script>


	<div class="single-widget food_left">
		<div class="food_type">
			<div class="food_type_name">
				<h5>음식점 태그</h5>
			</div>
		<span id="multiPrint"></span><br />
			<c:forEach var="vo" items="${taglist }">
			<div class="food_type_detail">
				<div>
					<input type="checkbox" class="check" value="${vo.tagcode}">${vo.tagname}
				</div>
				<br>
			</div>
			</c:forEach>
		</div>
	</div>