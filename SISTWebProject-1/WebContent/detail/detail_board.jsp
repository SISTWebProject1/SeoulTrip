<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="main-body mt--30">
	<div class="container box_1170">
		<div class="row">
			<div class="col-lg-6 col-md-6">
				<div class="single-post-item short">
					<div class="Review-search" id="Review_Search">
						<form class="example" action="#"
							style="margin: auto; max-width: 300px">
							<a href="board_review.do"><input type="button" style="font-size: 20px"
								placeholder="Search Posts" value="리뷰게시판" /></a>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="single-post-item short">
					<div class="QnA-search" id="QnA_Seach">
						<form class="example" action="#"
							style="margin: auto; max-width: 300px">
							<a href="board_qna.do"><input type="button" style="font-size: 20px"
								placeholder="Search Posts" value="질문게시판"  /></a>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- 검색바 까지  -->
		<!-- Modal 처리  -->
		<div class="row">
			<div class="col-lg-8">
				<div class="single-widget search-widget">
					<form class="example" action="#"
						style="margin: auto; max-width: 300px">
						<input type="text" placeholder="Search Posts" name="search2"id="keyword" />
						<button type="submit">
							<i class="fa fa-search"></i>
						</button>
					</form>
				</div>
			</div>
			<div class="col-lg-2">
				<button id="modalBtn" class="button"
					style="margin-top: 50px; background-color: #555555; color: white;"
					value="review">Review</button>
				<div id="simpleModal" class="modal">
					<div class="modal-content">
						<span id="closeBtn" class="closeBtn">&times;</span>
						<div class="col-lg-8">
							<form class="form-area " id="myForm" action="content.html"
								method="post">
								<div class="row">
									<div class="col-lg-6 form-group">
										<input name="name" placeholder="Enter your name"
											onfocus="this.placeholder = ''"
											onblur="this.placeholder = '제목을 적으세요'"
											class="common-input mb-20 form-control" required type="text">
										<input name="email" placeholder="Enter email address"
											pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$"
											onfocus="this.placeholder = ''"
											onblur="this.placeholder = '장소이름'"
											class="common-input mb-20 form-control" required=""
											type="email"> <input name="subject"
											placeholder="Enter your subject"
											onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'Enter your subject'"
											class="common-input mb-20 form-control" required type="text">
									</div>
									<div
										class="col-lg-12 d-flex justify-content-between flex-middle">
										<textarea class="common-textarea form-control" name="message"
											placeholder="Messege" onfocus="this.placeholder = ''"
											onblur="this.placeholder = 'Messege'" required></textarea>
									</div>
									<div class="col-lg-12 d-flex justify-content-between">
										<div class="alert-msg" style="text-align: left;"></div>
										<button class="genric-btn primary circle text-uppercase"
											style="float: right;">리뷰 작성</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- Modal 처리  -->
	<jsp:include page="${detail_board_jsp}"></jsp:include>
	