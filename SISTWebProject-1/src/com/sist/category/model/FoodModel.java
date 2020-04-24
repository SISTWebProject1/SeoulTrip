package com.sist.category.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.util.*;

@Controller
public class FoodModel {
	
	@RequestMapping("category/food.do")
	public String category_food(HttpServletRequest request, HttpServletResponse response) {
		
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
		   
		   List<FoodVO> list= FoodDAO.foodListData(map);
		  
		   for(FoodVO vo:list)
		   {
			   String rname=vo.getRname();
			   if(rname.length()>12)
			   {
				   rname=rname.substring(0,12).concat("...");
				   vo.setRname(rname);
			   }
		   }
		   int totalpage=FoodDAO.foodTotalPage();
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1; 
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   // 1~10  , 11~20  85  => endPage= 81~90
		   
		   int allPage=totalpage;
		   if(endPage>allPage)
			   endPage=allPage;
		   
		   
		   
		   // 체크박스에 테그리스트 넘기기
		   List<FoodTagVO> taglist=FoodDAO.foodTagListData(map);
		   System.out.println(taglist.size());
		   
	   
		   request.setAttribute("taglist", taglist);
		   request.setAttribute("list", list);
		   request.setAttribute("curpage", curpage);
		   request.setAttribute("totalpage", totalpage);
		   request.setAttribute("BLOCK", BLOCK);
		   request.setAttribute("startPage", startPage);
		   request.setAttribute("endPage", endPage);
		   request.setAttribute("allPage", allPage);
		   
		   System.out.println(totalpage);
		  
		
		request.setAttribute("main_jsp", "../category/food.jsp");
		request.setAttribute("banner_on", true);
		
		return "../main/index.jsp";
	}
	@RequestMapping("category/foodtag_content.do")
	public String category_foodtag(HttpServletRequest request, HttpServletResponse response){
		  Map map=new HashMap();
		   // 체크박스에 테그리스트 넘기기
		   List<FoodTagVO> taglist=FoodDAO.foodTagListData(map);
		
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
		   
		   FoodDAO.foodTagDetailData(tmap);
		   List<FoodTagDetailVO> tlist= FoodDAO.foodData(tmap);
		   System.out.println(tlist);
		   
		   
		   for(FoodTagDetailVO vo:tlist)
		   {
			   String rname=vo.getRname();
			   if(rname.length()>12)
			   {
				   rname=rname.substring(0,12).concat("...");
				   vo.setRname(rname);
			   }
		   }
		   
		   /*int tagtotal=FoodDAO.foodTagTotalPage(foodtagcode);*/
		   
		   int tagtotalpage=FoodDAO.foodTagTotalPage();
		   
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
		   
		request.setAttribute("main_jsp", "../category/foodtag_content.jsp");
		request.setAttribute("banner_on", true);
		return "../main/index.jsp";
	}
	
}