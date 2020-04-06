<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

          <div class="main-body section-gap mt--30">
            <div class="container box_1170">
              <div class="row">

                <div class="col-lg-6 col-md-6">
                  <div class="single-post-item short">
                    <div class="Review-search" id="Review_Search">
                      <form
                        class="example"
                        action="#"
                        style="margin:auto;max-width:300px">
                        <input type="button" style="font-size: 30px" placeholder="Search Posts" value="Review" />
                      </form>
                    </div>
                  </div>
                </div>


                <div class="col-lg-6 col-md-6">
                  <div class="single-post-item short">
                    <div class="QnA-search" id="QnA_Seach">
                      <form
                        class="example"
                        action="#"
                        style="margin:auto;max-width:300px">
                        <input type="button" style="font-size: 30px" placeholder="Search Posts" value="QnA" />
                      </form>
                    </div>
                  </div>
                </div>

            
            </div>

              <div class="row">
                <div class="col-lg-8">
                  <div class="single-widget search-widget">
                    <form
                      class="example"
                      action="#"
                      style="margin:auto;max-width:300px">
                      <input type="text" placeholder="Search Posts" name="search2" />
                      <button type="submit"><i class="fa fa-search"></i></button>
                    </form>
                  </div>
                </div>
                <div class="col-lg-2">
                  <button id="modalBtn" class="button" style="margin-top: 50px; background-color: #555555; color:white;"value="review">Review</button>
                  
                  <div id="simpleModal" class="modal">
                    <div class="modal-content">
                      <span id="closeBtn" class="closeBtn">&times;</span>
                        <div class="col-lg-8">
                          <form class="form-area " id="myForm" action="content.html" method="post">
                            <div class="row">
                              <div class="col-lg-6 form-group">
                                <input name="name" placeholder="Enter your name" onfocus="this.placeholder = ''" onblur="this.placeholder = '제목을 적으세요'"
                                class="common-input mb-20 form-control" required="" type="text">
                
                                <input name="email" placeholder="Enter email address" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{1,63}$"
                                onfocus="this.placeholder = ''" onblur="this.placeholder = '장소이름'" class="common-input mb-20 form-control"
                                required="" type="email">
                
                                <input name="subject" placeholder="Enter your subject" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter your subject'"
                                class="common-input mb-20 form-control" required="" type="text">
                              </div>

                              <div class="col-lg-12 d-flex justify-content-between flex-middle">
                                <textarea class="common-textarea form-control" name="message" placeholder="Messege" onfocus="this.placeholder = ''"
                                onblur="this.placeholder = 'Messege'" required=""></textarea>
                              </div>

                              <div class="col-lg-12 d-flex justify-content-between">
                                <div class="alert-msg" style="text-align: left;"></div>
                                <button class="genric-btn primary circle text-uppercase" style="float: right;">리뷰 작성</button>
                              </div>

                            </div>
                          </form>
                        </div>
                    </div>
                  </div>
                </div>
              </div>



                <div class="col-lg-10 post-list" id="Content-List">
                  <!-- Start Post Area -->
                  <section class="post-area">
                    <div class="single-post-item">
                      <h3>      <a href="blog-details.html"
                          >It's Hurricane Season But We Are Visiting Hilton Island</a>
                      </h3>
                      <p>
                        orem ipsum dolor sit amet, consectetur adipisicing elit, sed
                        do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                        Ut enim ad minim veniam, quis nostrud exercitation ullamco
                        laboris nisi ut aliquip.
                      </p>
                      <a
                        href="blog-details.html"
                        class="primary-btn text-uppercase mt-15"
                        >continue Reading</a
                      >
                      <div class="post-box">
                        <div class="d-flex">
                          <div>
                            <a href="#">
                              <img src="img/author/a1.png" alt="" />
                            </a>
                          </div>
                          <div class="post-meta">
                            <div class="meta-head">
                              <a href="#">회원명</a>
                            </div>
                            <div class="meta-details">
                              <ul>
                                <li>
                                  <a href="#">
                                    <span class="lnr lnr-calendar-full"></span>
                                    13th Oct, 2018 (리뷰작성일)
                                  </a>
                                </li>
                                <li>
                                  <a href="#">
                                    <span class="lnr lnr-picture"></span>
                                    Image Post
                                  </a>
                                </li>
                                <li>
                                  <a href="#">
                                    <span class="lnr lnr-coffee-cup"></span>
                                    Food & Travel
                                  </a>
                                </li>
                                <li>
                                  <a href="#">
                                    <span class="lnr lnr-bubble"></span>
                                    03 Comments
                                  </a>
                                </li>
                              </ul>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
      



                    <div class="col-lg-10 post-list" id="QnA-List">
                      <!-- Start Post Area -->
                      <section class="post-area">
                        <div class="single-post-item">
                          <h3>
                            <a href="blog-details.html"
                              >질문 내용은 다음과 같습니다.</a>
                          </h3>
                          <p>
                            질문 내용은 다음과 같습니다./질문 내용은 다음과 같습니다./질문 내용은 다음과 같습니다.
                            /질문 내용은 다음과 같습니다./질문 내용은 다음과 같습니다./질문 내용은 다음과 같습니다.
                            /질문 내용은 다음과 같습니다./질문 내용은 다음과 같습니다./질문 내용은 다음과 같습니다.
                          </p>
                          <a
                            href="blog-details.html"
                            class="primary-btn text-uppercase mt-15"
                            >더보기</a
                          >
                          <div class="post-box">
                            <div class="d-flex">
                              <div>
                                <a href="#">
                                  <img src="img/author/a1.png" alt="" />
                                </a>
                              </div>
                              <div class="post-meta">
                                <div class="meta-head">
                                  <a href="#">회원명</a>
                                </div>
                                <div class="meta-details">
                                  <ul>
                                    <li>
                                      <a href="#">
                                        <span class="lnr lnr-calendar-full"></span>
                                        13th Oct, 2018 (리뷰작성일)
                                      </a>
                                    </li>
                                    <li>
                                      <a href="#">
                                        <span class="lnr lnr-picture"></span>
                                        Image Post
                                      </a>
                                    </li>
                                    <li>
                                      <a href="#">
                                        <span class="lnr lnr-coffee-cup"></span>
                                        Food & Travel
                                      </a>
                                    </li>
                                    <li>
                                      <a href="#">
                                        <span class="lnr lnr-bubble"></span>
                                        03 Comments
                                      </a>
                                    </li>
                                  </ul>
                                </div>
                              </div>
                            </div>
                          </div>
                        </div>
                    
      
                    <nav class="blog-pagination justify-content-center d-flex">
                      <ul class="pagination">
                        <li class="page-item">
                          <a href="#" class="page-link" aria-label="Previous">
                            <span aria-hidden="true">
                              <span class="lnr lnr-arrow-left"></span>
                            </span>
                          </a>
                        </li>
                        <li class="page-item">
                          <a href="#" class="page-link">01</a>
                        </li>
                        <li class="page-item active">
                          <a href="#" class="page-link">02</a>
                        </li>
                        <li class="page-item">
                          <a href="#" class="page-link">03</a>
                        </li>
                        <li class="page-item">
                          <a href="#" class="page-link">04</a>
                        </li>
                        <li class="page-item">
                          <a href="#" class="page-link">09</a>
                        </li>
                        <li class="page-item">
                          <a href="#" class="page-link" aria-label="Next">
                            <span aria-hidden="true">
                              <span class="lnr lnr-arrow-right"></span>
                            </span>
                          </a>
                        </li>
                      </ul>
                    </nav>
                  </section>
                  <!-- Start Post Area -->
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>