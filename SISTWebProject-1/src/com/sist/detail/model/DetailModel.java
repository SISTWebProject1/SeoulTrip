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
		String title = "";

		Map typo = new HashMap();
		
		if(Integer.parseInt(type)==1){
			tvo = dao.getTourplaceData(Integer.parseInt(no));
			rtvo = dao.detailRankTourData(Integer.parseInt(no));
			totalplace = dao.getTotalTourplace();
			mapx = tvo.getMapx();
			mapy = tvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			totalpage = dao.getTotalReview(typo);
			rclist = dao.getReviewCount(typo);
			tourtaglist = dao.getTourTag(Integer.parseInt(no));
			
			System.out.println("장소 데이터");
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
			mapx = rvo.getMapx();
			mapy = rvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			totalpage = dao.getTotalReview(typo);
			rclist = dao.getReviewCount(typo);
			restaglist = dao.getResTag(Integer.parseInt(no));
			
			request.setAttribute("rclist", rclist);
			request.setAttribute("taglist", restaglist);
			request.setAttribute("totalplace", totalplace);
			request.setAttribute("rank", rrvo);
			System.out.println("음식 데이터");
			request.setAttribute("info", rvo);
			request.setAttribute("title", rvo.getRname());
			request.setAttribute("category", "음식점");
		}else if(Integer.parseInt(type)==3){
			fvo = dao.getFestivalData(Integer.parseInt(no));
			rfvo = dao.detailRankFestivalData(Integer.parseInt(no));
			totalplace = dao.getTotalFestival();
			mapx = fvo.getMapx();
			mapy = fvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			totalpage = dao.getTotalReview(typo);
			rclist = dao.getReviewCount(typo);
			request.setAttribute("rclist", rclist);
			request.setAttribute("totalplace", totalplace);
			request.setAttribute("rank", rfvo);
			System.out.println("축제데이터");
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
		List<Detail_Review_PhotoVO> imglist = dao.getImageForReview(Integer.parseInt(no));

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
	
		
		request.setAttribute("type", type);
		request.setAttribute("mapx", mapx);
		request.setAttribute("mapy", mapy);
		request.setAttribute("no", no);
		request.setAttribute("nearT", nearT);
		request.setAttribute("nearR", nearR);
		request.setAttribute("nearF", nearF);

		request.setAttribute("imglist", imglist);
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

		MainDAO.addItemToCookies(request, response, Integer.parseInt(type), Integer.parseInt(no));
		//cookie에 넣기
		return "../main/index.jsp";
	}
	
	
	@RequestMapping("detail/detail_review.do")
	public String detail_switch_review(HttpServletRequest request, HttpServletResponse response){

		return  "../detail/detail_review_test.jsp";
	}
	
	// ########################################################################### QNA 보드 입출력 관리 ######################
	
/*	@RequestMapping("detail/detail_qna_insert.do")
	public String detail_qna_insert(HttpServletRequest request,HttpServletResponse response){
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		
		DetailDAO dao = new DetailDAO();
		DetailTourplaceVO tvo = new DetailTourplaceVO();
		DetailRestaurantVO rvo = new DetailRestaurantVO();
		DetailFestivalVO fvo = new DetailFestivalVO();
		double mapx = 0;	
		double mapy = 0;

		String title = "";

		Map typo = new HashMap();
		
		if(Integer.parseInt(type)==1){
			tvo = dao.getTourplaceData(Integer.parseInt(no));
			mapx = tvo.getMapx();
			mapy = tvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			System.out.println("장소 데이터");
			request.setAttribute("info", tvo);
			request.setAttribute("title", tvo.getTname());
			request.setAttribute("category", "명소");
		}else if(Integer.parseInt(type)==2){
			rvo = dao.getRestaurantData(Integer.parseInt(no));
			mapx = rvo.getMapx();
			mapy = rvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			System.out.println("음식 데이터");
			request.setAttribute("info", rvo);
			request.setAttribute("title", rvo.getRname());
			request.setAttribute("category", "음식점");
		}else if(Integer.parseInt(type)==3){
			fvo = dao.getFestivalData(Integer.parseInt(no));
			mapx = fvo.getMapx();
			mapy = fvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			System.out.println("축제데이터");
			request.setAttribute("info", fvo);
			request.setAttribute("title", fvo.getFname());
			request.setAttribute("category", "축제");
		}
	
		System.out.println("질문게시판 작성");
		
		Map map = new HashMap();
		map.put("no", no);
		map.put("type", type);
		
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
		//################################################################################## info data 출력
		
		
		request.setAttribute("detail_board_jsp","../detail/detail_qna_insert.jsp");
		request.setAttribute("main_jsp", "../detail/detail.jsp");
		return "../main/index.jsp";
	}
	
	@RequestMapping("detail/detail_qna_insert_ok.do")
	public String detail_qna_insert_ok(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");  
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		LoginVO vo2 = (LoginVO) request.getSession().getAttribute("ss_member");
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		String memberid = vo2.getMemberId();
		String name = request.getParameter("name");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		System.out.println(memberid);
		System.out.println("이 작업 번호는 " + no);
		
		
		DetailQnaVO vo = new DetailQnaVO();
		vo.setMemberid(memberid);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setPwd(Integer.parseInt(pwd));
		vo.setNo(Integer.parseInt(no));
		vo.setType(Integer.parseInt(type));
		
		// DAO로 전송 => DAO에서 오라클로 보내준다.
		DetailDAO dao = new DetailDAO();
		//insert 요청
		dao.DetailQnaInsert(vo);
	
	return "redirect:../detail/detail.do?type="+type+"&no="+no;
	}*/
}
	