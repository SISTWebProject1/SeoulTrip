package com.sist.home.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.main.dao.HashTagVO;
import com.sist.main.dao.HomeItemVO;
import com.sist.main.dao.LoginVO;
import com.sist.main.dao.MainDAO;
import com.sist.mypage.model.MemberVO_u;
import com.sist.mypage.model.MypageDAO;
import com.sist.mypage.model.ReviewVO_u;
import com.sist.mypage.model.WishListVO_u;

@Controller
public class HomeModel {
	
	@RequestMapping("home/home.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../home/home.jsp");
		request.setAttribute("banner_on", true);
		
		List<HomeItemVO> hiList = MainDAO.getHIListFromCookies(request);
		int hiSize = hiList.size();
		request.setAttribute("hiList", hiList);
		request.setAttribute("hiSize", hiSize);
		
		Date today = new Date();
		int curyear = 2020;
		int curmonth = today.getMonth()+1;
		int curdate = today.getDate();
		request.setAttribute("curmonth", curmonth);
		request.setAttribute("curdate", curdate);
		request.setAttribute("calendarvo", new CalendarVO(curyear, curmonth).getInstance());
		
		List<FestivalVO> flist = FestivalDAO.festivalAllList();
		request.setAttribute("flist", flist);

		List<HashTagVO> htlist = MainDAO.getHTListRegDESC();
		request.setAttribute("htlist", htlist);

		List<HashTagVO> phtlist = MainDAO.getPopularHTList();
		request.setAttribute("phtlist", phtlist);
		
		Map<HashTagVO,List<HomeItemVO>> lists = new HashMap<HashTagVO, List<HomeItemVO>>();
		lists = MainDAO.getHTItemsListsByCookie(request, response);
		request.setAttribute("lists", lists);
		
		//MainDAO.setWishlistRandomly();
		
		return "../main/index.jsp";
	}
	
	@RequestMapping("home/festivalList.do")
	public String home_festivalList(HttpServletRequest request, HttpServletResponse response) {
		String strDate = request.getParameter("date");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
		Date date = new Date();
		if(strDate==null) {
			Date today = new Date();
			strDate = (today.getYear()+1900)+"-"+(today.getMonth()+1)+"-"+today.getDate();
		}
		try {
			date = sdf.parse(strDate);
		} catch (ParseException e) {
			System.out.println("HomeModel:home_festivalList():");
			e.printStackTrace();
		}
		
		List<FestivalVO> flist = FestivalDAO.festivalDateList(date);
		try {
			LoginVO lvo = (LoginVO) request.getSession().getAttribute("ss_member");
			String id = lvo.getMemberId();
			
			List<WishListVO_u> wishlist = MainDAO.getWishListsByMemberId(id);
			for(FestivalVO tfvo : flist) {
				for(WishListVO_u wlvo : wishlist) {
					if(wlvo.getType()==3 && wlvo.getNo()==tfvo.getNo()) tfvo.setWish(true);
				}
			}
		} catch (Exception e) {}
		request.setAttribute("flist", flist);
		
		request.setAttribute("main_jsp", "../home/festivalList.jsp");
		request.setAttribute("banner_on", true);
		
		List<HomeItemVO> hiList = MainDAO.getHIListFromCookies(request);
		int hiSize = hiList.size();
		request.setAttribute("hiList", hiList);
		request.setAttribute("hiSize", hiSize);
		
		int curyear = 2020;
		int curmonth = date.getMonth()+1;
		int curdate = date.getDate();
		request.setAttribute("curmonth", curmonth);
		request.setAttribute("curdate", curdate);
		request.setAttribute("calendarvo", new CalendarVO(curyear, curmonth).getInstance());
		
		List<HashTagVO> phtlist = MainDAO.getPopularHTList();
		request.setAttribute("phtlist", phtlist);
		
		return "../main/index.jsp";
	}
	
	@RequestMapping("home/htitemlist.do")
	public String home_htitemlist(HttpServletRequest request, HttpServletResponse response) {
		String strPage = request.getParameter("page");
		if(strPage==null) strPage = "1";
		
		int curpage = Integer.parseInt(strPage);
		int tagcode = Integer.parseInt(request.getParameter("tagcode"));
		
		HashTagVO htvo = MainDAO.getHashTagData(tagcode);
		request.setAttribute("htvo", htvo);
		
		List<HomeItemVO> htitemlist = MainDAO.getHIListByTagcode_page(request, tagcode, curpage);
		request.setAttribute("htitemlist", htitemlist);
		
		request.setAttribute("main_jsp", "../home/htitemlist.jsp");
		request.setAttribute("banner_on", true);
		
		List<HomeItemVO> hiList = MainDAO.getHIListFromCookies(request);
		int hiSize = hiList.size();
		request.setAttribute("hiList", hiList);
		request.setAttribute("hiSize", hiSize);
		
		List<HashTagVO> phtlist = MainDAO.getPopularHTList();
		request.setAttribute("phtlist", phtlist);
		
		request.setAttribute("curpage", strPage);
		request.setAttribute("totalpage", MainDAO.getHTItemListTotalPage(tagcode));
		
		List<HashTagVO> htlist = MainDAO.getHTListRegDESC();
		request.setAttribute("htlist", htlist);
		
		return "../main/index.jsp";
	}
	
	@RequestMapping("home/morehtitemlist.do")
	public String home_morehtitemlist(HttpServletRequest request, HttpServletResponse response) {
		int curpage = Integer.parseInt(request.getParameter("page"));
		int tagcode = Integer.parseInt(request.getParameter("tagcode"));
		
		List<HomeItemVO> htitemlist = MainDAO.getHIListByTagcode_page(request, tagcode, curpage);
		request.setAttribute("htitemlist", htitemlist);
		
		return "morehtitemlist.jsp";
	}
	
	@RequestMapping("home/profile_data.do")
	public String main_profile(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		
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
		map.put("id", id);
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
		
		List<WishListVO_u> wish_list = MypageDAO.wishlistData(id);
		
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
		
		request.setAttribute("main_jsp", "../home/profile_data.jsp");
		return "../main/index.jsp";
	}

}























