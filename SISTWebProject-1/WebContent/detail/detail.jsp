<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
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
});
/*  	$('#Review').click(function(){
		const type = $('#type').val();
		const no = $('#no').val();
		console.log("qns insert");
		console.log(type);
		console.log(no);
	
		 $.ajax({
			type:'post',
			url:'../detail/detail_review.do',
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
	$('#Review').click(); */

</script> 
</head>
<body>
 <jsp:include page="../detail/detail_info.jsp"></jsp:include>
 <jsp:include page="../detail/detail_board.jsp"/>
 <div id="result">
 </div>		
 <jsp:include page="../detail/detail_bottom.jsp"></jsp:include>

</body>
</html>