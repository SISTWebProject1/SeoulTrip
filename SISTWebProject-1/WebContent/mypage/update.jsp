<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#pwd2').keyup(function(){
		var k=$(this).val();
		console.log(k)
		var id=$('#id').val();
		$.ajax({
			type:'POST',
			url:'../mypage/passwordCheck.do',
			data:{"pwd":k,"id":id},
			success:function(res){
				var no=res.trim();
				console.log(no)
				if(no==1)
				{
					$('#result').html("<font color=blue>비밀번호가 맞습니다.수정할 수 있습니다</font>")
					$('#updateBtn').attr('disabled', false)
					
				}
				else
				{
					$('#result').html("<font color=red>비밀번호가 틀립니다</font>")
					$('#updateBtn').attr('disabled', true)

				}
			}
		})
	});
});
</script>
</head>
<body>
<div class="wrapper row2">
  <div id="services" class="clear"> 
    <div class="row text-center">
     <img src="reply.png">
    </div>
  <div class="row">
      <form method=post action="../mypage/update_ok.do" id="reply_frm">
      <table class="table table-hover">
        <tr>
          <th width=20% id=name class="text-right success">이름 ${vo.memberId }</th>
          <td width=80%>
           <input type=text name=name size=15 value="${vo.name }" id=name>
           <input type=hidden name=id id=id value="${vo.memberId}">
           
          </td>
        </tr>
        
        <tr>
          <th width=20% class="text-right success">생일</th>
          <td width=80%>
           <input type=text id=birth name=birth size=50 value="${vo.birth }">
          </td>
        </tr>
        
        <tr>
          <th width=20% class="text-right success">주소${vo.addr1 }</th>
          <td width=80%>
          	<input type=text name=addr1 id=addr1 size=50 value="${vo.addr1 }">
          </td>
        </tr>
        
        <tr>
          <th width=20% class="text-right success">E-mail</th>
          <td width=80%>
          	<input type=text name=email id=email size=50 value="${vo.email }">
          </td>
        </tr>
        
        <tr>
          <th width=20% class="text-right success">자기소개</th>
          <td width=80%>
           <textarea rows="8" cols="55" name=content id=selfinfo>${vo.selfInfo }</textarea>
          </td>
        </tr>
        
         <tr>
          <th width=20% class="text-right success">비밀번호</th>
          <td width=80%>
           <input type="password" name=pwd size=10 id=pwd2>
           <div id="result"></div>
          </td>
        </tr>
        
        <tr>
          <td class="text-center" colspan="2">
           <input type="submit" value="수정" class="btn btn-sm btn-primary"
             id="updateBtn" disabled
           >
           <input type="button" value="취소" class="btn btn-sm btn-danger"
            onclick="javascript:history.back()"
           >
          </td>
        </tr>
          
      </table>
      </form>
     </div>
     </div>
    </div>
</body>
</html>