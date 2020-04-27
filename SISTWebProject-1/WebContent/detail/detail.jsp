<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript">
 $(function() {
	$('#QNA').click(function(){
		const type = $('#type').val();
		const no = $('#no').val();
		console.log("QNA");
		 $.ajax({
			type:'post',
			url:'../detail/detail_qna.do',
			data:{'type': type, 'no':no},
			success:function(data){
				$('#result').html(data);
				console.log(data);	
			},
			error : function(e){
				console.log("error");
			}
			
		}); 
	});
	var location = document.querySelector('#ReviewPosition').offsetTop;
	(function(e){
 		window.scrollTo({top:location, behavior:'smooth'});
	})();
	var check = 0;
	$('.btnclick').click(function(){
		const type=$('#type').val();
		const no = $('#no').val();
		const reviewno = $(this).attr('data-no');
		console.log(reviewno);
		console.log(type);
		console.log(no);
		$.ajax({
			type:'post',
			url:'../detail/detail_review_list.do',
			data:{'type':type, 'no':no, 'reviewno':reviewno},
			success:function(res){
					console.log(res);
					$('#replyresult'+reviewno).html(res);
			},
			error : function(e){
				alert("error");
			}
		});
		
		
	})

}); 
</script> 
</head>
<body>
 <jsp:include page="../detail/detail_info.jsp"></jsp:include>
<%--  <jsp:include page="../detail/detail_board.jsp"/> --%>
 <jsp:include page="${detail_board_jsp}" />
 <jsp:include page="../detail/detail_bottom.jsp"></jsp:include>

</body>
</html>