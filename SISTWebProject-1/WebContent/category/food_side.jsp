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
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script type="text/javascript">
		
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
	
/* 	    var foodtagcode = [];
	    $('.check:checked').each(function(){
	    	foodtagcode.push($(this).val());
	    }); */
	    
/* 	    $(document).ready(function() {
		    var foodtagcode = [];
		    $('.check:checked').each(function(){
		    	foodtagcode.push($(this).val());
		    	
		    });
		}); */
		
	/* 	var foodtagcode = $("input[name='foodtaglist']:checked").val(); */
	    
/* 	    $(function () {
	    	$('.check:checked').each(function(){
	    		var foodtagcode = [];
		    	foodtagcode.push($(this).val());
				$.ajax({
					type:"POST",
					url:"foodtag_content.do",
					data:{"foodtagcode":foodtagcode},
					success:function(res)
					{
						$('#foodtag').html(res);
					}
				})
		     });
		}); */
	    

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
					<input type="checkbox" name="foodtaglist" class="check" value="${vo.tagcode}">${vo.tagname}
				</div>
				<br>
			</div>
			</c:forEach>
		</div>
	</div>