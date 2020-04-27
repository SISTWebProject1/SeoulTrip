package com.sist.tourplace.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;

@Controller
public class TourplaceModel {
	
	@RequestMapping("category/tourplace.do")
	public String category_food(HttpServletRequest request, HttpServletResponse response) {
		 try {
			String page=request.getParameter("page");
			   if(page==null)
				   page="1";
			   int curpage=Integer.parseInt(page);
			   int rowSize=4;
			   int start=(rowSize*curpage)-(rowSize-1);

			   int end=rowSize*curpage;
			  
			   
			   // Map
			   Map map=new HashMap();
			   map.put("start", start);
			   map.put("end", end);
			   
			   List<TourplaceVO> list= TourplaceDAO.tourplaceListData(map);
			  
			   for(TourplaceVO vo:list)
			   {
				   String tname=vo.getTname();
				   if(tname.length()>12)
				   {
					   tname=tname.substring(0,12).concat("...");
					   vo.setTname(tname);
				   }
			   }
			   int totalpage=TourplaceDAO.tourplaceTotalPage();
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
	public String category_foodtag(HttpServletRequest request, HttpServletResponse response){
		  Map map=new HashMap();
		   // 체크박스에 테그리스트 넘기기
		   List<TourplaceTagVO> taglist=TourplaceDAO.tourplaceTagListData(map);
		
		 // 태그 페이지
		 String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   int curpage=Integer.parseInt(page);
		   int rowSize=6;
		   int start=(rowSize*curpage)-(rowSize-1);

		   int end=rowSize*curpage;
		   
		   /*int foodtagcode = Integer.parseInt(request.getParameter("foodtagcode"));*/
		   
		   
		   Map tmap=new HashMap();
		   tmap.put("start", start);
		   tmap.put("end", end);
		   /*tmap.put("foodtagcode", foodtagcode);*/
		   
		   TourplaceDAO.tourplaceTagDetailData(tmap);
		   List<TourplaceTagDetailVO> tlist= TourplaceDAO.tourplaceData(tmap);
		   System.out.println(tlist);
		   
		   
		   for(TourplaceTagDetailVO vo:tlist)
		   {
			   String tname=vo.getTname();
			   if(tname.length()>12)
			   {
				   tname=tname.substring(0,12).concat("...");
				   vo.setTname(tname);
			   }
		   }
		   
		   /*int tagtotal=FoodDAO.foodTagTotalPage(foodtagcode);*/
		   
		   int tagtotalpage=TourplaceDAO.tourplaceTagTotalPage();
		   
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1; 
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   // 1~10  , 11~20  85  => endPage= 81~90
		   
		   int allPage=tagtotalpage;
		   if(endPage>allPage)
			   endPage=allPage;
		   
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("tagtotalpage", tagtotalpage);
		   request.setAttribute("BLOCK", BLOCK);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   request.setAttribute("allPage", allPage);
		   
		   
		   
		   System.out.println(tagtotalpage);

		   
		   
		 request.setAttribute("tlist", tlist);
		 request.setAttribute("taglist", taglist);
		   
		request.setAttribute("main_jsp", "../category/tourplacetag_content.jsp");
		request.setAttribute("banner_on", true);
		return "../main/index.jsp";
	}
	
}