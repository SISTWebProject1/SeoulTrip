package com.sist.detail.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.detail.dao.*;

import java.text.SimpleDateFormat;
import java.util.*;
import com.sist.main.dao.*;
import com.sist.mypage.model.WishListVO_u;

@Controller
public class DetailModel {
	@RequestMapping("detail/detail.do")
	public String main_detail(HttpServletRequest request, HttpServletResponse response) {
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		String page = request.getParameter("page");
		
		MainDAO.addHashTagCodeToCookie(request, response, Integer.parseInt(type), Integer.parseInt(no));
		
		DetailDAO dao = new DetailDAO();
		DetailTourplaceVO tvo = new DetailTourplaceVO();
		DetailRestaurantVO rvo = new DetailRestaurantVO();
		DetailFestivalVO fvo = new DetailFestivalVO();
		DetailRankingTourplaceVO rtvo = new DetailRankingTourplaceVO();
		DetailRankingRestaurantVO rrvo = new DetailRankingRestaurantVO();
		DetailRankingFestivalVO rfvo = new DetailRankingFestivalVO();

		
		double mapx = 0;	
		double mapy = 0;
		int totalpage = 0;
		int totalplace = 0;
		List<DetailReviewCountVO> rclist = new ArrayList<DetailReviewCountVO>();
		List<String> tourtaglist = new ArrayList<String>();
		List<String> restaglist = new ArrayList<String>();
		List<String> tourtagCodelist = new ArrayList<String>();
		List<String> restagCodelist = new ArrayList<String>();
		
		List<DetailTagMappingVO> tourplacetaglist = new ArrayList<DetailTagMappingVO>();
		List<DetailTagMappingVO> restauranttaglist = new ArrayList<DetailTagMappingVO>();
		String title = "";

		
		Map typo = new HashMap();
		if(Integer.parseInt(type)==1){
			tvo = dao.getTourplaceData(Integer.parseInt(no));
			rtvo = dao.detailRankTourData(Integer.parseInt(no));
			totalplace = dao.getTotalTourplace();
			
			LoginVO lvo = (LoginVO) request.getSession().getAttribute("ss_member");
			List<WishListVO_u> wishlist = new ArrayList<WishListVO_u>();
			try {
				wishlist = MainDAO.getWishListsByMemberId(lvo.getMemberId());
			} catch (Exception e1) {}
			for(WishListVO_u wlvo : wishlist) {
				if(tvo.getNo()==wlvo.getNo() && 1 ==wlvo.getType()) {
					tvo.setWish(true);
					break;
				}
			}
		
			
			mapx = tvo.getMapx();
			mapy = tvo.getMapy();
			typo.put("type", Integer.parseInt(type));
			typo.put("no", Integer.parseInt(no));
			totalpage = dao.getTotalReview(typo);
			rclist = dao.getReviewCount(typo);
//			tourtaglist = dao.getTourTag(Integer.parseInt(no));
			
/*			tourtagCodelist = dao.getResTagCode(Integer.parseInt(no));
			request.setAttribute("tagcodelist", tourtagCodelist);*/
			
			tourplacetaglist = dao.DetailTourtagmapper(Integer.parseInt(no));
			request.setAttribute("alltaglist", tourplacetaglist);
			
			
			Map test = new HashMap();
			int rownum=1;
			int max=dao.reviewMax(typo);
			int min=dao.reviewMin(typo);
			test.put("type", type);
			test.put("no", no);
			test.put("numm",rownum);
			test.put("grade", max);
			System.out.println("장소 데이터");
			DetailReviewVO top = new DetailReviewVO();
			top = dao.getReviewTop(test);
			request.setAttribute("top", top);
			
			DetailReviewVO worst = new DetailReviewVO();
			test.put("grade", min);
			worst = dao.getReviewWorst(test);
			request.setAttribute("worst", worst);
			
			List<Detail_Review_HashtagVO> hashlist = dao.DetailReviewHash(typo);
			request.setAttribute("hashlist", hashlist);
			List<Detail_Review_PhotoVO> imglist = dao.getImageForReview(Integer.parseInt(no));
			request.setAttribute("imglist", imglist);
			
			List<String> allimglist = dao.DetailAllImages(typo);
			request.setAttribute("allimglist", allimglist);
			
			request.setAttribute("rclist", rclist);
			request.setAttribute("taglist", tourtaglist);
			request.setAttribute("totalplace", totalplace);
			request.setAttribute("rank", rtvo);
			request.setAttribute("info", tvo);
			request.setAttribute("title", tvo.getTname());
			request.setAttribute("category", "명소");
			
		}else if(Integer.parseInt(type)==2){
			rvo = dao.getRestaurantData(Integer.parseInt(no));
			rrvo = dao.detailRankResData(Integer.parseInt(no));
			totalplace = dao.getTotalRestaurant();
			
			LoginVO lvo = (LoginVO) request.getSession().getAttribute("ss_member");
			List<WishListVO_u> wishlist = new ArrayList<WishListVO_u>();
			try {
				wishlist = MainDAO.getWishListsByMemberId(lvo.getMemberId());
			} catch (Exception e1) {}
			for(WishListVO_u wlvo : wishlist) {
				if(rvo.getNo()==wlvo.getNo() && 2 ==wlvo.getType()) {
					rvo.setWish(true);
					break;
				}
			}
			
			mapx = rvo.getMapx();
			mapy = rvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			totalpage = dao.getTotalReview(typo);
			rclist = dao.getReviewCount(typo);
			restaglist = dao.getResTag(Integer.parseInt(no));
			List<Detail_Review_HashtagVO> hashlist = dao.DetailReviewHash(typo);
			request.setAttribute("hashlist", hashlist);
			List<Detail_Review_PhotoVO> imglist = dao.getImageForReview(Integer.parseInt(no));
			request.setAttribute("imglist", imglist);
			List<String> allimglist = dao.DetailAllImages(typo);
			request.setAttribute("allimglist", allimglist);
			request.setAttribute("rclist", rclist);
			request.setAttribute("taglist", restaglist);
			request.setAttribute("totalplace", totalplace);
			request.setAttribute("rank", rrvo);
			System.out.println("음식 데이터");
			
			restauranttaglist = dao.DetailRestagmapper(Integer.parseInt(no));
			request.setAttribute("alltaglist", restauranttaglist);
			
			Map test = new HashMap();
			int rownum=1;
			int max=dao.reviewMax(typo);
			int min=dao.reviewMin(typo);
			test.put("type", type);
			test.put("no", no);
			test.put("numm",rownum);
			test.put("grade", max);
			DetailReviewVO top = new DetailReviewVO();
			top = dao.getReviewTop(test);
			request.setAttribute("top", top);
			
			DetailReviewVO worst = new DetailReviewVO();
			test.put("grade", min);
			worst = dao.getReviewWorst(test);
			request.setAttribute("worst", worst);
			request.setAttribute("info", rvo);
			request.setAttribute("title", rvo.getRname());
			request.setAttribute("category", "음식점");
		}else if(Integer.parseInt(type)==3){
			fvo = dao.getFestivalData(Integer.parseInt(no));
			rfvo = dao.detailRankFestivalData(Integer.parseInt(no));
			totalplace = dao.getTotalFestival();
			
			LoginVO lvo = (LoginVO) request.getSession().getAttribute("ss_member");
			List<WishListVO_u> wishlist = new ArrayList<WishListVO_u>();
			try {
				wishlist = MainDAO.getWishListsByMemberId(lvo.getMemberId());
			} catch (Exception e1) {}
			for(WishListVO_u wlvo : wishlist) {
				if(fvo.getNo()==wlvo.getNo() && 3 ==wlvo.getType()) {
					fvo.setWish(true);
					break;
				}
			}
			
			
			mapx = fvo.getMapx();
			mapy = fvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			totalpage = dao.getTotalReview(typo);
			rclist = dao.getReviewCount(typo);
			
			List<Detail_Review_HashtagVO> hashlist = dao.DetailReviewHash(typo);
			request.setAttribute("hashlist", hashlist);
			List<Detail_Review_PhotoVO> imglist = dao.getImageForReview(Integer.parseInt(no));
			request.setAttribute("imglist", imglist);
			
			List<String> allimglist = dao.DetailAllImages(typo);
			request.setAttribute("allimglist", allimglist);
			request.setAttribute("rclist", rclist);
			request.setAttribute("totalplace", totalplace);
			request.setAttribute("rank", rfvo);
			System.out.println("축제데이터");
			Map test = new HashMap();
			int rownum=1;
			int max=dao.reviewMax(typo);
			int min=dao.reviewMin(typo);
			test.put("type", type);
			test.put("no", no);
			test.put("numm",rownum);
			test.put("grade", max);
			DetailReviewVO top = new DetailReviewVO();
			top = dao.getReviewTop(test);
			request.setAttribute("top", top);
			
			DetailReviewVO worst = new DetailReviewVO();
			test.put("grade", min);
			worst = dao.getReviewWorst(test);
			request.setAttribute("worst", worst);
			request.setAttribute("info", fvo);
			request.setAttribute("title", fvo.getFname());
			request.setAttribute("category", "축제");
		}
	
		
		if(page==null)
			page="1";
		int curpage = Integer.parseInt(page);
		int rowSize = 5;
		int start = (rowSize)*curpage-(rowSize-1);
		int end = rowSize*curpage;
		final int BLOCK = 10;
		int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		// 1~10 , 11~20
		
		int allPage = totalpage;
		if(endPage>allPage)
			endPage = allPage;
		
		Map map = new HashMap();
		map.put("no", no);
		map.put("type", type);
		map.put("start", start);
		map.put("end", end);
		List<DetailReviewVO> list = dao.getReviewData(map);
		
		//X,Y 좌표 가져오기 
//		DetailTourplaceVO vo = dao.getXYcoordinate(Integer.parseInt(no));
		System.out.println(mapx);
		System.out.println(mapy);
		Map mapXY = new HashMap();
		mapXY.put("mapx", mapx);
		mapXY.put("mapy", mapy);
//		
		List<DetailTourplaceVO> nearT = dao.getNearTourplace(mapXY);
		List<DetailRestaurantVO> nearR = dao.getNearRestaurant(mapXY);
		List<DetailFestivalVO> nearF = dao.getNearFestival(mapXY);
		List<Detail_Review_PhotoVO> imglist = dao.getImageForReview(Integer.parseInt(no));
		request.setAttribute("imglist", imglist);
		request.setAttribute("type", type);
		request.setAttribute("mapx", mapx);
		request.setAttribute("mapy", mapy);
		request.setAttribute("no", no);
		request.setAttribute("nearT", nearT);
		request.setAttribute("nearR", nearR);
		request.setAttribute("nearF", nearF);

	
		request.setAttribute("list", list);
		
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("allPage", allPage);		
		request.setAttribute("page", page);
		request.setAttribute("main_jsp", "../detail/detail.jsp");
		request.setAttribute("detail_board_jsp","../detail/detail_board.jsp");

		//request.setAttribute("banner_on", true);
		//###############################################################
		String scroll = request.getParameter("review");
		System.out.println(scroll);
		if(scroll!=null){
			scroll="1400";
			request.setAttribute("scroll", scroll);
		}
			/*		if(scroll.equals("1")){
			scroll="1800";
			request.setAttribute("scroll", scroll);
		}*/
		//###############################################################
		
		MainDAO.addItemToCookies(request, response, Integer.parseInt(type), Integer.parseInt(no));
		//cookie에 넣기
		return "../main/index.jsp";
	}
	
	
	@RequestMapping("detail/detail_review.do")
	public String detail_switch_review(HttpServletRequest request, HttpServletResponse response){

		return  "../detail/detail_review_test.jsp";
	}
	
	// ########################################################################### QNA 보드 입출력 관리 ######################
}
	