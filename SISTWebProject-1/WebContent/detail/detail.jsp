<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#keyword').keyup(function(){
		console.log("ppp")
		let k=$(this).val();
		console.log(k);
		$('#user-table > tbody > tr').hide();
		let temp=$('#user-table > tbody > tr > td:nth-child(4n+3):contains("'+k+'")');
		
		$(temp).parent().show();
		//		========
		// 	Node 구성상 화면을그릴  tr은 td에서 상위 에 있다. 
		/*
			td중에 겁색어를 적용 시킬 td의 요소에 접근하기 위해 (곡명) child를 특정지어 준다. 
		*/
		
		/*	
			====================================================
					1		2		3		4		
			====================================================
					5		6		7		8
			====================================================
					9		10		11		12				
			====================================================
		*/
	});
});
</script> -->
</head>
<body>
 <jsp:include page="../detail/detail_info.jsp"></jsp:include>
 <jsp:include page="../detail/detail_board.jsp"/>
 <jsp:include page="../detail/detail_bottom.jsp"></jsp:include>
</body>
</html>