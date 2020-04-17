<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<style type="text/css">
.img_wrap{
	width:300px;
	margin-top:50px;
}
.img_wrap img{
	max-width:100%;
}
.row{
   margin: 0px auto;
   width: 1000px;
}
input,select{
  display: inline-block;
}
.table,td {
    background-color: white;
 }
</style>
<script type="text/javascript">
var sel_file;
$(document).ready(function() {
	$("#input_img").on("change",handleImgFileSelect);
});

function handleImgFileSelect(e) {
	var files = e.target.files;
	var filesArr = Array.prototype.slice.call(files);
	
	filesArr.forEach(function(f) {
		if(!f.type.match("image.*")){
			alert("이미지 파일만 가능합니다.");
			return;
		}
		
		sel_file = f;
		
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#img").attr("src",e.target.result);
		}
		reader.readAsDataURL(f);
	});
}



Shadowbox.init({
	players:['iframe']
});
var i = 0;
var p = 0;
$(function() {
	$('#postBtn').click(function(){
		Shadowbox.open({
			content:'../member/postfind.do',
			title:'우편번호 검색',
			player:'iframe',
			width:530,
			height:400
		})
		p=1;
	});
	$('#idcheckBtn').click(function(){
		Shadowbox.open({
			content:'../member/idcheck.do',
			title:'아이디 중복체크',
			player:'iframe',
			width:390,
			height:200
		})
		i=1;
	})
	
	$('#sendBtn').click(function(){
		if(i==0)
		{
			alert("아이디 중복체크를 하세요");
		}
		else
		{
			if($('#pwd').val()!=$('#pwd1').val())
			{
				alert("비밀번호가 틀립니다!!")
			}
			else if(p==0)
			{
			    alert("우편번호를 입력하세요");	
			}
		}
	})
})
</script>
<style type="text/css">
.row {
   margin: 0px auto;
   width:700px;
}
</style>
</head>
<body>
  <div class="container">
    <h1 class="text-center">회원가입</h1>
    <div class="row">
      <form name="frm" action="../member/join_ok.do" method="post" id="frm">
      <table class="table table-hover">
        <tr>
       	   <th width=20% class="danger text-right">프로필사진</th>
           <td width=80%>
            	<div class="img_wrap"> <img id="img"> </div>
            <input type="file" name=photo size=15 class="input-sm" required>
          </td>
        </tr>
        <tr>
          <th width=20% class="danger text-right">ID</th>
          <td width=80%>
            <input type=text name=id size=15 class="input-sm" readonly id="memberid">
            <input type="button" value="중복체크" class="btn btn-sm btn-danger" id="idcheckBtn">
          </td>
        </tr>
        <tr>
          <th width=20% class="danger text-right">비밀번호</th>
          <td width=80%>
            <input type=password name=pwd size=15 class="input-sm" id="pwd" required>&nbsp;
                        재입력:<input type=password name=pwd1 size=15 class="input-sm" id="pwd1" required>
          </td>
        </tr>
        <tr>
          <th width=20% class="danger text-right">이름</th>
          <td width=80%>
            <input type=text name=name size=15 class="input-sm" required>
          </td>
        </tr>
        <tr>
          <th width=20% class="danger text-right">이메일</th>
          <td width=80%>
            <input type=text name=email size=50 class="input-sm">
          </td>
        </tr>
        <tr>
          <th width=20% class="danger text-right">성별</th>
          <td width=80%>
            <input type="radio" name=gender value="남자" checked>남자
            <input type="radio" name=gender value="여자">여자
          </td>
        </tr>
        <tr>
          <th width=20% class="danger text-right">생일</th>
          <td width=80%>
            <input type=date name=birth size=50 class="input-sm" required>
          </td>
        </tr>
        
        <tr>
          <th width=20% class="danger text-right">우편번호</th>
          <td width=80%>
            <input type=text name=post1 size=5 class="input-sm" readonly required> -
            <input type=text name=post2 size=5 class="input-sm" readonly required>
            <input type=button class="btn btn-sm btn-primary" value="우편번호검색" id="postBtn">
          </td>
        </tr>
        
        <tr>
          <th width=20% class="danger text-right">주소</th>
          <td width=80%>
            <input type=text name=addr1 size=50 class="input-sm" readonly required>
          </td>
        </tr>
        
        <tr>
          <th width=20% class="danger text-right">상세주소</th>
          <td width=80%>
            <input type=text name=addr2 size=50 class="input-sm">
          </td>
        </tr>
        
        <tr>
          <th width=20% class="danger text-right">전화</th>
          <td width=80%>
            <select class="input-sm" name="tel1">
              <option>010</option>
              <option>011</option>
              <option>017</option>
            </select>
            <input type=text name=tel2 size=5 class="input-sm"> - 
            <input type=text name=tel3 size=7 class="input-sm">
          </td>
        </tr>
        
        <tr>
          <th width=20% class="danger text-right">소개</th>
          <td width=80%>
            <textarea rows="8" cols="60" name="selfInfo"></textarea>
          </td>
        </tr>
        
        <tr>
          <td colspan="2" class="text-center">
            <input type=submit value="회원가입" class="btn btn-sm btn-info"
            id="sendBtn">
            <input type=button value="취소" class="btn btn-sm btn-success"
              onclick="javascript:history.back()"
            >
          </td>
        </tr>
        
      </table>
      </form>
    </div>
   </div>
</body>
</html>










