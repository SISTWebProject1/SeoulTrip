<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert the table</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function (){
	$('#pwd2').keyup(function(){
		var k=$(this).val();
		var seq=$('#seq').val();
		var no=$('#no').val();
		var type=$('#type').val();
		$.ajax({
			type:'POST',
			url:'../detail/password_check.do',
			data:{"pwd":k, "seq":seq, 'type':type, 'no':no},
			success:function(res){
				var no=res.trim();
				if(no==1)
					{
						$('#result').html("<font color=blue>비밀번호가 맞습니다. 수정할 수 있습니다 </font>")
						$('#updateBtn').attr('disabled',false)
					}
				else
					{
						$('#result').html("<font color=red>비밀번호가 틀립니다 </font>")
						$('#updateBtn').attr('disabled',true)
					
					}
			}
		})
	})	
})
</script>
</head>
<body>
	<div class="wrapper row2">
		<div id="services" class="clear">
			<div class="text-center">
				<img src="../img/detail/qna_Board.jpg"
					style="width: 700px; height: 150px" />
			</div>
		<div class="row justify-content-md-center">
			<div class="text-center">
		<form method=post action="../detail/detail_qna_update_ok.do">
			<table class="table table-hover">
				<tr>
					<th width=20% class="text-right success">이름</th>
					<td width=80%><input type="text" name=memberid size=15
						value="${vo.memberid}" required /> <input type="hidden" name="seq" id="seq"
						value="${vo.seq}" />
						<input type="hidden" name="type" id="type"
						value="${vo.type}" />
						<input type="hidden" name="no" id="no"
						value="${vo.no}" /></td>
				</tr>

				<tr>
					<th width=20% class="text-right success">제목</th>
					<td width=80%><input type="text" name=title	 size=50
						value="${vo.title }" required /></td>
				</tr>

				<tr>
					<th width=20% class="text-right success">내용</th>
					<td width=80%><textarea rows="8" cols="55" name=content
							required>${vo.content }</textarea></td>
				</tr>
				<tr>
					<th width=20% class="text-right success">비밀번호</th>
					<td width=80%><input type="password" name=pwd size=10 id=pwd2
						value="${vo.pwd }" required />
						<div id="result"></div>
					</td>
				</tr>

				<tr>
					<td class="text-center" colspan="2"><input type="submit"
						value="수정" class="btn btn-sm btn-primary" id="updateBtn" disabled />
						<!-- 비밀번호 맞을때 까지 수정하기 버튼을 비활성화 --> <input type="button" value="취소"
						class="btn btn-sm btn-danger" onclick="javascript:history.back()" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
</div>
</div>
</body>
</html>