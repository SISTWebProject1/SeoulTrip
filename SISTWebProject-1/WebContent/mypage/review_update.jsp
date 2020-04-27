<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<html>
<head>
<meta charset="UTF-8">
<title>review Update</title>
</head>
<body>
<section class="banner-area relative">
<div class="overlay overlay-bg"></div>
<div class="container box_1170">
	<div class="row d-flex align-items-center justify-content-center">
		<div class="about-content col-lg-12">
			<h1 class="text-white">리뷰 수정페이지</h1>
			<p class="text-white link-nav">
				<a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span>
				<a href="archive.html"> Archive</a>
			</p>
		</div>
	</div>
</div>
</section>
  <div class="container">
    <h1 class="text-center">리뷰작성</h1>
    <div class="row">
      <form action="../detail/detail_review_insert_ok.do" method="post" enctype="multipart/form-data">
      <table class="table table-hover">
      	<tr>
          <th width=20% class="danger text-right">분류</th>
          <td width=80%>
            <p> TYPE</p>
          </td>
        </tr>
        <tr>
          <th width=20% class="danger text-right">장소이름</th>
          <td width=80%>
             <p>제목</p>
          </td>
        </tr>
         <tr>
          <th width=20% class="danger text-right">이름</th>
          <td width=80%>
            <p>이름</p>
            <input type="hidden" name=no value=""/>
			<input type="hidden" name=type value=""/>
			<input type="hidden" name=memberid value=""/>
          </td>
        </tr>
   		<tr>
          <th width=20% class="danger text-right">리뷰제목 </th>
          <td width=80%>
             <input type=text name=title size=100 class="input-sm" required>
         </td>
        </tr>
        <tr>
          <th width=20% class="danger text-right">작성날짜</th>
          <td width=80%>
            <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
            <c:out value="${today}"/>
            <input type="hidden" name=regdate value="${today}"/>
          </td>
        </tr>
        <tr>
          <th width=20% class="danger text-right">점수</th>
          <td width=80%>
            <select class="input-sm" name="grade" required>
              <option>5</option>
              <option>4</option>
              <option>3</option>
              <option>2</option>
              <option>1</option>
            </select>
          </td>
        </tr>
        
        <tr>
          <th width=20% class="danger text-right">내용</th>
          <td width=80%>
            <textarea rows="8" cols="100" name=content required></textarea>
          </td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
            <input type=submit value="리뷰작성" class="btn btn-sm btn-info"
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