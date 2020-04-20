<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row {
   margin: 0px auto;
   width: 350px
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#memberid').focus();
	$('#checkBtn').click(function(){
		let memberid=$('#memberid').val();
		if(memberid.trim()=="")
		{
			$('#memberid').focus();
			return;
		}
		$.ajax({
			type:'POST',
			url:'../member/idcheck_result.do',
			data:{"memberid":memberid},
			success:function(result){
				let count=result.trim();
				if(count==0)
				{
					let msg='<font color=blue><b>'+memberid+'는(은) 사용가능합니다</b></font>';
					$('#result').html(msg);
					$('#ok').html(
					   '<input type=button value=확인 class="btn btn-sm btn-success" onclick=ok()>'
					);
				}
				else
				{
					let msg='<font color=red><b>'+memberid+'는(은) 이미 사용중입니다</b></font>';
					$('#result').html(msg);
					
				}
			},
			error:function(e){
				alert(e);
			}
		})
		// 결과값을 읽어서 처리 
	})
});
function ok()
{
	let memberid=$('#memberid').val();
	parent.frm.memberid.value=memberid;
	parent.Shadowbox.close();
}
</script>
</head>
<body>
   <div class="container">
     
     <div class="row">
       <table class="table">
         <tr>
           <td>
                      입력:<input type=text id=memberid class="input-sm" size=15>
               <input type=button value="아이디체크" class="btn btn-sm btn-primary" id="checkBtn">
           </td>
         </tr>
         <tr>
           <td class="text-center">
             <span id="result"></span>
           </td>
         </tr>
         <tr>
            <td class="text-center" id="ok">
            </td>
         </tr>
       </table>
     </div>
   </div>
</body>
</html>












