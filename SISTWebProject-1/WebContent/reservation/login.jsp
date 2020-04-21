<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>


<div class="container">
 <div class="row" style="margin:0px auto;width:250px;">
  <form method="post" action="reservation/login_ok.do">
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
      <input id="id" type="text" class="form-control" size="10" name="id" placeholder="아이디" required>
    </div>
    <div class="input-group">
      <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
      <input id="password" type="password" class="form-control" size="10" name="password" placeholder="비밀번호" required>
    </div>
    <div colspan=2 class="text-center">
  	  <input type="submit" value="login" class="btn btn-sm btn-success">
    </div>
  </form>
 </div>
</div>

</body>
</html>