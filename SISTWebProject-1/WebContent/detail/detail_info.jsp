<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<section class="banner-area relative">
<div class="overlay overlay-bg"></div>
<div class="container box_1170">
	<div class="row d-flex align-items-center justify-content-center">
		<div class="about-content col-lg-12">
			<h1 class="text-white">상세 페이지 (${title})</h1>
			<p class="text-white link-nav">
				<a href="index.html">Home </a> <span class="lnr lnr-arrow-right"></span>
				<a href="archive.html"> Archive</a>
			</p>
		</div>
	</div>
</div>
</section>
<!-- End banner Area -->
<hr>
<!-- Start main body Area -->
<div class="main-body">
	<div class="container box_1480">
		<div>
			<div class="category_sum" style="font-size:20px; font-weight:bold;">
				<a href=#>메인 </a> 
				<c:if test="${category=='축제'}">
					<a href="../home/festivalList.do">/${category}</a> 
				</c:if>
				<c:if test="${category ne'축제'}">
					<a href=#>/${category}</a> 
				</c:if>
				
				<a href=#>/${title} </a>

			</div>
	
				<hr>
			<div class="container-alter container-summary">
				<ul>
					<li style="font-size:25px; font-weight:bolder;"><a href="#">${title}</a></li>
					<li><a href="#">${rank.ranking }위 /${totalplace }개의 명소중</a></li>
					<li>
						<div class="tag_button" style="display:inline;">
<%-- 							<c:forEach var="tag" items="${taglist}">
								<span style="border:outset 1px; font-size:20px; ">${tag}</span>
								<input type="button" value="${tag }">
							</c:forEach> --%>
							<c:if test="${type==1}">
							<c:forEach var="tag" items="${alltaglist }">
								<a href="../category/tourplace.do?tagcode=${tag.tagcode}">
								<span style="border:outset 1px; font-size:18px; ">${tag.tagname}</span>
								</a>
							</c:forEach>
							</c:if>
							<c:if test="${type==2}">
								<c:forEach var="tag" items="${alltaglist }">
								<a href="../category/food.do?tagcode=${tag.tagcode}">
								<span style="border:outset 1px; font-size:18px; ">${tag.tagname}</span>
								</a>
							</c:forEach>
							</c:if>
						</div>
					</li>
					<c:if test="${type==2 }">
						<c:if test="${ss_member.memberId != null }">
							<a href="../reservation/reservation.do?no=${no}" class="btn btn-sm btn-danger">&nbsp;예약</a>
						</c:if>				
					</c:if>
				</ul>
			</div>
			<hr>
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="single-post-item short">
					 <div class="heart">
							<button class="heart_button 
								<c:choose>
									<c:when test="${ info.wish eq true }">heart_on</c:when>
									<c:otherwise>heart_off</c:otherwise>
								</c:choose>
							 " type="button" data-type="${type}" data-no="${no }">
								<i class="fas fa-heart"></i>
							</button>
						</div>					
							<div class="content_summary">
							<ul>
								<c:if test="${totalpage!=0}">
									<li>
										<h5>TOP REVIEW</h5>
									</li>
									<li>
										<h3>${top.title}</h3>
									</li>
									<li>
										<p>${top.content}</p>
									</li>
									<li><a href="#">${top.memberid}</a>
									 	<span>좋아요 숫자 ${top.likecount }</span>
									 	<span>등록일 ${top.regdate }</span>
									 </li>
								 <br><br><br>
								 	<li>
										<h5>WORST REVIEW</h5>
									</li>
									<li>
										<h3>${worst.title}</h3>
									</li>
									<li>
										<p>${worst.content}</p>
									</li>
									<li><a href="#">${worst.memberid}</a>
									 	<span>좋아요 숫자 ${worst.likecount }</span>
									 	<span>등록일 ${worst.regdate }</span>
									 </li>
								 </c:if>
								<c:if test="${totalpage==0}">
								<ul>
										<li>
											<h4>리뷰하이라이트1</h4>
										</li>
										<li>
											<h3>리뷰 대표명1</h3>
										</li>
										<li>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incididunt ut labore et dolore
												magna aliqua.</p> <a href="#">더보기(scroll)</a>
										</li>
										<li><a href="#">리뷰 작성 ID</a> <span>리뷰 평점 (그리기
												javascript)</span></li>
									</ul>
		
									<ul>
										<li>
											<h4>리뷰하이라이트2</h4>
										</li>
										<li>
											<h3>리뷰 대표명2</h3>
										</li>
										<li>
											<p>Lorem ipsum dolor sit amet, consectetur adipisicing
												elit, sed do eiusmod tempor incididunt ut labore et dolore
												magna aliqua.</p> <a href="#">더보기(scroll)</a>
										</li>
										<li><a href="#">리뷰 작성 ID</a> <span>리뷰 평점 (그리기
												javascript)</span></li>
									<ul>
							</c:if>
							</ul>
						</div>
					</div>
				
				</div>

				<div class="col-lg-6 col-md-6">
						<div class="single-post-item short">
						<div class="main-image">
							<c:if test="${type==1}">
								<img src="${info.tphoto}" alt="image1" id="current" />
							</c:if>
							<c:if test="${type==2}">
								<img src="${info.rphoto}" alt="image1" id="current" />
							</c:if>
							<c:if test="${type==3}">
								<img src="${info.fphoto}" alt="image1" id="current" />
							</c:if>
						</div>
							<br>
						<div class="imgs">
<%-- 						<c:forEach var="i" begin="0" end="7">
							<c:if test="${imglist[i].filepath ne NULL }">
								<img src="${imglist[i].filepath}"/>
							</c:if>
							<c:if test="${imglist[i].filepath eq NULL }">
								<img src="../mypage/default_reviews_image.jpg">
							</c:if>
						</c:forEach> --%>
		 				<c:forEach var="i" begin="0" end="7">
							<c:if test="${allimglist[i] ne NULL }">
								<img src="${allimglist[i]}"/>
							</c:if>
							<c:if test="${allimglist[i] eq NULL }">
								<img src="../mypage/default_reviews_image.jpg">
							</c:if>
						</c:forEach> 
						</div>
					</div>
				</div>
				<!-- <div class="container-alter">
                <form class="js-ReviewForm">
                  <input type="text" placeholder="Review Comment" />
                  <span class="review-content"></sapn>
                </form>
            </div> -->
				<hr>
				<hr>
				<div class="col-lg-2 col-md-2">
					<div class="single-post-item short">
						<div class="rating_statistics">
							<ul>
								<c:forEach var="vo" items="${rclist}">
									<div class="grade">
										<p class="grade2" style="WIDTH: ${vo.grade*20 }%;"></p>
									</div>
									<li><span>${vo.count }</span></li>	
								</c:forEach>
								<li><input type="hidden" name=mapx id=mapx value="${mapx}"/></li>
								<li><input type="hidden" name=mapy id=mapy value="${mapy}"/></li>
								<c:forEach var="xy" items="${nearT}">
									<li><input type="hidden" name="tname${xy.num}" id="tname${xy.num}" value="${xy.tname}"/></li>
									<li><input type="hidden" name="mapx${xy.num}" id="mapx${xy.num}" value="${xy.mapx}"/></li>
									<li><input type="hidden" name="mapy${xy.num}" id="mapy${xy.num}" value="${xy.mapy}"/></li>
								</c:forEach>
								<c:forEach var="xy2" items="${nearR}">
									<li><input type="hidden" name="rname${xy2.num}" id="rname${xy2.num}" value="${xy2.rname}"/></li>
									<li><input type="hidden" name="rmapx${xy2.num}" id="rmapx${xy2.num}" value="${xy2.mapx}"/></li>
									<li><input type="hidden" name="rmapy${xy2.num}" id="rmapy${xy2.num}" value="${xy2.mapy}"/></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-3">
					<div class="single-post-item short">
						<div class="content_specifit">
							<ul>
								<li>위치</li>
								<li>서울종로구 사직구 161</li>
								<li>웹사이트</li>
								<li>전화번호</li>
								<li>교통편</li>
								<li>안내정보</li>
								<p>상세안내</p>
							</ul>
						</div>
					</div>
				</div>
				<div class="col-lg-5 col-md-5">
					<div class="single-post-item short">
						<div id="map" style="width: 500px; height: 300px;"></div>
						<script type="text/javascript"
							src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68cba5ac8135df1b2685073fb0fd9f93"></script>
						<script>
						var mapx = document.getElementById('mapx').value;
						console.log(mapx);
						var mapy = document.getElementById('mapy').value;
						console.log(mapy);
						var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
					    mapOption = { 
					        center: new kakao.maps.LatLng(mapx, mapy), // 지도의 중심좌표
					        level: 6 // 지도의 확대 레벨
					    };

						var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
 	 					var tname2 = document.getElementById('tname2').value;
						var mapx2 = document.getElementById('mapx2').value;
						var mapy2 = document.getElementById('mapy2').value;
	 					var tname3 = document.getElementById('tname3').value;
						var mapx3 = document.getElementById('mapx3').value;
						var mapy3 = document.getElementById('mapy3').value;
	 					var tname4 = document.getElementById('tname4').value;
						var mapx4 = document.getElementById('mapx4').value;
						var mapy4 = document.getElementById('mapy5').value;
	 					var tname5 = document.getElementById('tname5').value;
						var mapx5 = document.getElementById('mapx5').value;
						var mapy5 = document.getElementById('mapy5').value;
						var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";
	
						// 마커를 표시할 위치와 title 객체 배열입니다 
						var positions = [
						    {
						        title: tname2, 
						        latlng: new kakao.maps.LatLng(mapx2, mapy2)
						    },
						    {
						        title: tname3, 
						        latlng: new kakao.maps.LatLng(mapx3, mapy3)
						    },
						    {
						        title: tname4, 
						        latlng: new kakao.maps.LatLng(mapx4, mapy4)
						    },
						    {
						        title: tname5,
						        latlng: new kakao.maps.LatLng(mapx5, mapy5)
						    }
						];
						
 
		 				var rname2 = document.getElementById('rname2').value;
						var rmapx2 = document.getElementById('rmapx2').value;
						var rmapy2 = document.getElementById('rmapy2').value;
	 					var rname3 = document.getElementById('rname3').value;
						var rmapx3 = document.getElementById('rmapx3').value;
						var rmapy3 = document.getElementById('rmapy3').value;
	 					var rname4 = document.getElementById('rname4').value;
						var rmapx4 = document.getElementById('rmapx4').value;
						var rmapy4 = document.getElementById('rmapy4').value;
	 					var rname5 = document.getElementById('rname5').value;
						var rmapx5 = document.getElementById('rmapx5').value;
						var rmapy5 = document.getElementById('rmapy5').value;
						var positions2 = [
						    {
						        title: rname2, 
						        latlng: new kakao.maps.LatLng(rmapx2, rmapy2)
						    },
						    {
						        title: rname3, 
						        latlng: new kakao.maps.LatLng(rmapx3, rmapy3)
						    },
						    {
						        title: rname4, 
						        latlng: new kakao.maps.LatLng(rmapx4, rmapy4)
						    },
						    {
						        title: rname5,
						        latlng: new kakao.maps.LatLng(rmapx5, rmapy5)
						    }
						];
	
						// 마커 이미지의 이미지 주소입니다
		 
						var imageSrc2 = "https://i1.daumcdn.net/dmaps/apis/n_local_blit_04.png";
						for (var i = 0; i < positions.length; i ++) {
						    
						    // 마커 이미지의 이미지 크기 입니다
						    var imageSize = new kakao.maps.Size(24, 35); 
						    
						    // 마커 이미지를 생성합니다    
						    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
						    var markerImage2 = new kakao.maps.MarkerImage(imageSrc2, imageSize); 
						    // 마커를 생성합니다
						    var marker = new kakao.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions[i].latlng, // 마커를 표시할 위치
						        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						        image : markerImage // 마커 이미지 
						    });
						    var marker2 = new kakao.maps.Marker({
						        map: map, // 마커를 표시할 지도
						        position: positions2[i].latlng, // 마커를 표시할 위치
						        title : positions2[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
						        image : markerImage2 // 마커 이미지 
						    });
						}
						</script> 
					</div>
				</div>
			</div>
		</div>
	</div>
</div>