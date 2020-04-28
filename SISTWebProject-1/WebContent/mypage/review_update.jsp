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
		</div>
	</div>
</div>
</section>
  <div class="container">
  	<h1 style="margin: 10px;"> 리뷰 수정 </h1>
    <div class="row">
      <form action="../mypage/mypage_review_update_ok.do" method="post">
      <table class="table table-hover">
      	<tr>
          <th width=20% class="danger text-right">분류</th>
          <td width=80%>
            <p>${ type }</p>
          </td>
        </tr>
        <tr>
          <th width=20% class="danger text-right">장소이름</th>
          <td width=80%>
             <p>${ mrvo.tname }</p>
          </td>
        </tr>
         <tr>
          <th width=20% class="danger text-right">ID</th>
          <td width=80%>
            <p>${ id }</p>
            <input type="hidden" name=id value="${id }">
            <input type="hidden" name=reviewno value="${mrvo.reviewno }">
          </td>
        </tr>
   		<tr>
          <th width=20% class="danger text-right">리뷰제목 </th>
          <td width=80%>
             <input type=text name=title size=100 class="input-sm" value="${mrvo.title }">
         </td>
        </tr>
        <tr>
          <th width=20% class="danger text-right">수정날짜</th>
          <td width=80%>
            <fmt:formatDate value="${now}" pattern="yyyy-MM-dd HH:mm:ss" var="today" />
            <c:out value="${today}"/>
            <input type="hidden" name=regdate value="${today}"/>
          </td>
        </tr>
        
        <tr>
          <th width=20% class="danger text-right">내용</th>
          <td width=80%>
            <textarea rows="8" cols="100" name=content required>${ mrvo.content }</textarea>
          </td>
        </tr>
        <tr>
          <td colspan="2" class="text-center">
            <input type=submit value="리뷰 수정" class="btn btn-sm btn-info"
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