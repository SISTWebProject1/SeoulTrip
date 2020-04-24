package com.sist.mypage.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.main.dao.LoginVO;
import com.sist.main.dao.MainDAO;
import com.sist.reservation.model.RestaurantVO;


@Controller
public class MypageModel {

	@RequestMapping("mypage/profile.do")
	public String main_profile(HttpServletRequest request, HttpServletResponse response) {
		// Login 정보 --> id,birth,regdate 값을 받음
		LoginVO vo = (LoginVO)request.getSession().getAttribute("ss_member");
		String id = vo.getMemberId().trim();
		
		MemberVO_u my_vo = MypageDAO.PassWord_check(id);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.applyPattern("yyyy-MM-dd");
		String birth = sdf.format(my_vo.getBirth());
		String regdate = sdf.format(my_vo.getRegdate());
		
		request.setAttribute("birth", birth);
		request.setAttribute("regdate", regdate);
		request.setAttribute("my_vo", my_vo);
		// _> Login 정보 End
		
		// review 확인 -> review_image, content,regdate, 등 memberId에 일치하는  review데이터를 수집
		// 리뷰 페이지
		String page =request.getParameter("page");
		String type = request.getParameter("type");
		int totalpage = 0;
		if(page==null)
			page="1";
		int curpage = Integer.parseInt(page);
		int rowSize = 5;
		int start = (rowSize)* curpage-(rowSize-1);
		int end = rowSize*curpage;
		final int BLOCK = 10;
		int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		// 1~10 , 11~20
		
		Map map = new HashMap();
		map.put("id", vo.getMemberId());
		map.put("start", start);
		map.put("end", end);
		
		
		List<ReviewVO_u> review_list = new ArrayList<ReviewVO_u>();
		int review_count=0;
		review_list = MypageDAO.ReviewData(map);
		// 사진을 모으기 위해 reviewNO를 배열에 저장
		int reviewNo[] = new int[review_list.size()];
		int i =0;
		for(ReviewVO_u v1 : review_list){
			reviewNo[i] = v1.getReviewno();
			i++;
		}
		review_list = MypageDAO.getImageForReview(review_list, reviewNo);
		review_count = review_list.size();
		
		int allPage = review_count;
		if(endPage>allPage)
			endPage = allPage;
		// _> review 정보 End

		
		// review 정보 확인
		//wishlist data 값
		
		List<WishListVO_u> wish_list = MypageDAO.wishlistData(vo.getMemberId());
		
		// wishlist 존재 여부 확인
		int wish_count =0;
		wish_count = wish_list.size();
		
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("curpage", curpage);
		request.setAttribute("allPage", allPage);
		request.setAttribute("mypage_review_list", review_list);
		request.setAttribute("review_count", review_count);
		request.setAttribute("wish_list", wish_list);
		request.setAttribute("wish_count", wish_count);
		
		
		request.setAttribute("main_jsp", "../mypage/profile8.jsp");
		return "../main/index.jsp";
	}
	@RequestMapping("mypage/wishlist.do")
	public String wishlist(HttpServletRequest request, HttpServletResponse response){
		LoginVO vo = (LoginVO) request.getSession().getAttribute("ss_member");
		List<WishListVO_u> wish_list = MypageDAO.wishlistData(vo.getMemberId());
		int count =0;
		count = wish_list.size();
		System.out.println("count : "+count);
		request.setAttribute("list", wish_list);
		request.setAttribute("count", count);
		request.setAttribute("main_jsp", "../mypage/wishlist.jsp");
		return "../main/index.jsp";
	}
	
	
	@RequestMapping("mypage/passwordCheck.do")
	public String passwordCheck(HttpServletRequest request,HttpServletResponse response){

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		request.setAttribute("id", id);
		request.setAttribute("pwd", pwd);
		
		MemberVO_u vo =MypageDAO.PassWord_check(id);
		int res=0;
		if(vo.getPwd().equals(pwd)){
			res=1;
			System.out.println("성공!");
		}
		else{
			res=0;
			System.out.println("불일치");
		}
		request.setAttribute("result", res);
		return "../mypage/passowrd_check.jsp";
	}
	@RequestMapping("mypage/update_ok.do")
	public String password_ok(HttpServletRequest request,HttpServletResponse response){
		try{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String addr1 = request.getParameter("addr1");
		String email = request.getParameter("email");
		String tel = request.getParameter("tel");
		String selfinfo = request.getParameter("selfinfo");
		
		String year = request.getParameter("year");
		System.out.println("확인 : "+year);
		String month = request.getParameter("month");
		System.out.println("확인 "+month);
		String day = request.getParameter("day");
		System.out.println("확인 : "+ day);
		String birth =year+"-"+month+"-"+day;
		
		
		System.out.println(birth);
		
		MemberVO_u my_vo = new MemberVO_u();
		my_vo.setBirth(Date.valueOf((birth)));
		my_vo.setMemberId(id);
		my_vo.setName(name);
		my_vo.setAddr1(addr1);
		my_vo.setEmail(email);
		my_vo.setTel(tel);
		my_vo.setSelfInfo(selfinfo);
		System.out.println(my_vo.getEmail());
		
		MypageDAO.Update_ok(my_vo);
		
		return "redirect:../mypage/profile.do";
		
	}
	
	@RequestMapping("mypage/profile_Update.do")
	public String profile_Update(HttpServletRequest request, HttpServletResponse response){
		try{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex){
			ex.printStackTrace();	
		}
		try{
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		System.out.println("id :"+id);
		MemberVO_u vo_u = MypageDAO.PassWord_check(id);
		System.out.println(vo_u.getBirth());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String birth_tmp = sdf.format(vo_u.getBirth());
		System.out.println(birth_tmp);
		Date birth = Date.valueOf(birth_tmp);
		System.out.println(birth);
		vo_u.setBirth(birth);
		
		StringTokenizer st = new StringTokenizer(birth_tmp,"-");
		String year = st.nextToken();
		String month = st.nextToken();
		String day = st.nextToken();
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		
		
		request.setAttribute("my_vo", vo_u);
		}catch(Exception ex){
			ex.printStackTrace();
		}
		request.setAttribute("banner_on", true);
		request.setAttribute("main_jsp", "../mypage/update.jsp");
		
		return "../main/index.jsp";
	}
	
	@RequestMapping("mypage/bookingList.do")
	public String bookingList(HttpServletRequest request, HttpServletResponse response){
		String id = request.getParameter("id");
		
		List<BookingRestaurantVO_u> Booking_list = new ArrayList<BookingRestaurantVO_u>();		
		Booking_list = MypageDAO.BookingListData(id);
		request.setAttribute("banner_on", true);
		request.setAttribute("Booking_list", Booking_list);
		request.setAttribute("main_jsp", "../mypage/booking_table.jsp");
		return "../main/index.jsp";
	}

}