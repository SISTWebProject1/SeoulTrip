package com.sist.tourplace.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.main.dao.HomeItemVO;
import com.sist.main.dao.MainDAO;

import java.util.*;

@Controller
public class TourplaceModel {

	@RequestMapping("category/tourplace.do")
	public String category_food(HttpServletRequest request, HttpServletResponse response) {
		 try {			 
			 String page=request.getParameter("page");
			   if(page==null)
				   page="1";
			   
			   String tagcode = request.getParameter("tagcode");
			   
			   int curpage=Integer.parseInt(page);
			   int rowSize=10;
			   int start=(rowSize*curpage)-(rowSize-1);

			   int end=rowSize*curpage;
			   int totalpage=TourplaceDAO.tourplaceTotalPage();
			  
			   
			   // Map
			   Map map=new HashMap();
			   map.put("start", start);
			   map.put("end", end);
			   
			   List<TourplaceVO> list = TourplaceDAO.tourplaceListData(map);
			   if(tagcode != null) {
				   map.put("tagcode", Integer.parseInt(tagcode));
				   list = TourplaceDAO.tourplaceTagDetailData(map);
				   list = TourplaceDAO.tourplaceData(map);
				   totalpage = TourplaceDAO.tourplaceTagTotalPage();
				   
				   TourplaceTagVO tagvo = TourplaceDAO.getTourtagVO(Integer.parseInt(tagcode));
				   request.setAttribute("tagvo", tagvo);
			   }
			  
			   for(TourplaceVO vo:list)
			   {
				   String tname=vo.getTname();
				   if(tname.length()>12)
				   {
					   tname=tname.substring(0,12).concat("...");
					   vo.setTname(tname);
				   }
				   
				   HomeItemVO temp = new HomeItemVO();
				   temp.setType(1);
				   temp.setNo(vo.getNo());
				   
				   temp = MainDAO.getGradeReviewCntByTypeNo(temp);
				   vo.setGrade(temp.getGrade());
				   vo.setRank(temp.getReviewCnt());
			   }
			   
			   final int BLOCK=10;
			   int startPage=((curpage-1)/BLOCK*BLOCK)+1; 
			   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
			   // 1~10  , 11~20  85  => endPage= 81~90
			   
			   int allPage=totalpage;
			   if(endPage>allPage)
				   endPage=allPage;
			   
			   
			   
			   // 체크박스에 테그리스트 넘기기
			   List<TourplaceTagVO> taglist=TourplaceDAO.tourplaceTagListData(map);
			   
   
			   request.setAttribute("taglist", taglist);
			   request.setAttribute("list", list);
			   request.setAttribute("curpage", curpage);
			   request.setAttribute("totalpage", totalpage);
			   request.setAttribute("BLOCK", BLOCK);
			   request.setAttribute("startPage", startPage);
			   request.setAttribute("endPage", endPage);
			   request.setAttribute("allPage", allPage);			  
			
			request.setAttribute("main_jsp", "../category/tourplace.jsp");
			request.setAttribute("banner_on", true);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return "../main/index.jsp";
	}

	@RequestMapping("category/tourplacetag_content.do")
	public String category_foodtag(HttpServletRequest request, HttpServletResponse response) {
		// 태그 페이지
		String page = request.getParameter("page");
		if (page == null || page.length() == 0)
			page = "1";
		int curpage = Integer.parseInt(page);
		int rowSize = 10;
		int start = (rowSize * curpage) - (rowSize - 1);

		int end = rowSize * curpage;

		Map tmap = new HashMap();
		tmap.put("start", start);
		tmap.put("end", end);

		List<TourplaceVO> tlist = TourplaceDAO.tourplaceListData(tmap);
		int tagtotalpage = TourplaceDAO.tourplaceTotalPage();

		String tagnames = request.getParameter("tagnames");
		String tourplacetagcode = request.getParameter("tourplacetagcode");
		if (tourplacetagcode.equals("data")) {
			request.setAttribute("title", "서울의 명소");
		} else {
			tmap.put("tagcode", tourplacetagcode.substring(5));
			request.setAttribute("title", tagnames.substring(7));

			TourplaceDAO.tourplaceTagDetailData(tmap);
			tlist = TourplaceDAO.tourplaceData(tmap);
			tagtotalpage = TourplaceDAO.tourplaceTagTotalPage();
		}

		for (TourplaceVO vo : tlist) {
			String tname = vo.getTname();
			if (tname.length() > 12) {
				tname = tname.substring(0, 12).concat("...");
				vo.setTname(tname);
			}

			HomeItemVO temp = new HomeItemVO();
			temp.setType(1);
			temp.setNo(vo.getNo());

			temp = MainDAO.getGradeReviewCntByTypeNo(temp);
			vo.setGrade(temp.getGrade());
			vo.setRank(temp.getReviewCnt());
		}

		final int BLOCK = 10;
		int startPage = ((curpage - 1) / BLOCK * BLOCK) + 1;
		int endPage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
		// 1~10 , 11~20 85 => endPage= 81~90

		int allPage = tagtotalpage;
		if (endPage > allPage)
			endPage = allPage;

		request.setAttribute("curpage", curpage);
		request.setAttribute("tagtotalpage", tagtotalpage);
		request.setAttribute("BLOCK", BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("allPage", allPage);

		request.setAttribute("tlist", tlist);

		return "../category/tourplacetag_content_result.jsp";
	}

}