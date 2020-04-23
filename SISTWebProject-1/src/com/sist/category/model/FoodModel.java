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
		
		request.setAttribute("main_jsp", "../category/food.jsp");
		request.setAttribute("banner_on", true);
		
		return "../main/index.jsp";
	}
	@RequestMapping("category/foodtag_content.do")
	public String category_foodtag(HttpServletRequest request, HttpServletResponse response){
		  Map map=new HashMap();
		   // 체크박스에 테그리스트 넘기기
		   List<FoodTagVO> taglist=FoodDAO.foodTagListData(map);
		   System.out.println(taglist.size());
		
		 // 태그 페이지
		 String tpage=request.getParameter("tpage");
		   if(tpage==null)
			   tpage="1";
		   int tcurpage=Integer.parseInt(tpage);
		   int trowSize=6;
		   int tstart=(trowSize*tcurpage)-(trowSize-1);

		   int tend=trowSize*tcurpage;
		   
		   Map tmap=new HashMap();
		   tmap.put("tstart", tstart);
		   tmap.put("tend", tend);
		   
		   
		   
		 List<FoodTagDetailVO> tlist= FoodDAO.foodTagDetailData(tmap);
		 request.setAttribute("tlist", tlist);
		 request.setAttribute("taglist", taglist);
		   
		request.setAttribute("main_jsp", "../category/foodtag_content.jsp");
		request.setAttribute("banner_on", true);
		return "../main/index.jsp";
	}
	
}