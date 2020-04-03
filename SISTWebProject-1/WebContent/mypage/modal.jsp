<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <h2 class="text-center">프로필 수정</h2>
    <div class="row">
      <table class="table table-hover">
        <tr>
          <th width=15% class="danger text-right">ID</th>
          <td width=85%>
            <input type=text name=id size=15 class="input-sm" readonly>
            <input type="button" value="중복체크" class="btn btn-sm btn-danger" onclick="idcheck()">
          </td>
        </tr>
        <tr>
          <th width=15% class="danger text-right">비밀번호</th>
          <td width=85%>
            <input type=password name=pwd size=15 class="input-sm">&nbsp;
          </td>
        </tr>
        <tr>
          <th width=15% class="danger text-right">이름</th>
          <td width=85%>
            <input type=text name=name size=15 class="input-sm">
          </td>
        </tr>
        <tr>
          <th width=15% class="danger text-right">이메일</th>
          <td width=85%>
            <input type=text name=email size=50 class="input-sm">
          </td>
        </tr>
        </table>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
    
    </div>
  </div>
  
</div>


</body>
</html>