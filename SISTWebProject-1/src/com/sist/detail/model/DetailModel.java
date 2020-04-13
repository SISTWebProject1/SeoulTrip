package com.sist.detail.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.detail.dao.*;
import java.util.*;

@Controller
public class DetailModel {
	@RequestMapping("detail/detail.do")
	public String main_detail(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../detail/detail.jsp");
		//request.setAttribute("banner_on", true);
		
		//cookie에 넣기
		request.setAttribute("detail_board_jsp","../detail/detail_qna.jsp");
		return "../main/index.jsp";
	}
	@RequestMapping("detail/board_review.do")
	public String detail_switch_review(HttpServletRequest request, HttpServletResponse response){
		request.setAttribute("main_jsp", "../detail/detail.jsp");

		request.setAttribute("detail_board_jsp", "../detail/detail_review.jsp");
		return  "../main/index.jsp";
	}
	@RequestMapping("detail/board_qna.do")
	public String detail_switch_qna(HttpServletRequest request, HttpServletResponse response){
		request.setAttribute("main_jsp", "../detail/detail.jsp");

		request.setAttribute("detail_board_jsp", "../detail/detail_qna.jsp");
		return  "../main/index.jsp";
	}
	@RequestMapping("detail/detail_review.do")
	public String detail_review(HttpServletRequest request, HttpServletResponse response){
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		String page = request.getParameter("page");
		if(page==null)
			page="1";
		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (rowSize)*curpage-(rowSize-1);
		int end = rowSize*curpage;
		
		DetailDAO dao = new DetailDAO();
		int totalpage = dao.getTotalReview();
		
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
		DetailTourplaceVO vo = dao.getXYcoordinate(Integer.parseInt(no));
		double mapx = vo.getMapx();
		double mapy = vo.getMapy();
		Map mapXY = new HashMap();
		mapXY.put("mapx", mapx);
		mapXY.put("mapy", mapy);
		
		List<DetailTourplaceVO> nearlist = dao.getNeayByDistance(mapXY);
			
		request.setAttribute("nearlist", nearlist);
		request.setAttribute("imglist", imglist);
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("allPage", allPage);				
		request.setAttribute("main_jsp", "../detail/detail.jsp");
		request.setAttribute("detail_board_jsp","../detail/detail_review.jsp");

		return "../main/index.jsp";
	}
}
