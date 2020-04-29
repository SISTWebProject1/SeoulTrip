package com.sist.category.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.detail.dao.DetailDAO;
import com.sist.detail.dao.DetailReviewVO;
import com.sist.main.dao.HomeItemVO;
import com.sist.main.dao.LoginVO;
import com.sist.main.dao.MainDAO;
import com.sist.mypage.model.WishListVO_u;

import java.util.*;

@Controller
public class FoodModel {
	
	@RequestMapping("category/food.do")
	public String category_food(HttpServletRequest request, HttpServletResponse response) {
		try{
			 List<WishListVO_u> wishlist = new ArrayList<WishListVO_u>();
			 try {
				 wishlist = MainDAO.getWishListsByMemberId(((LoginVO)(request.getSession().getAttribute("ss_member"))).getMemberId());
			 } catch (Exception e) {}
			
		 String page=request.getParameter("page");
		   if(page==null)
			   page="1";
		   
		   String tagcode = request.getParameter("tagcode");
		   
		   int curpage=Integer.parseInt(page);
		   int rowSize=10;
		   int start=(rowSize*curpage)-(rowSize-1);

		   int end=rowSize*curpage;
		   int totalpage=FoodDAO.foodTotalPage();
		  
		   
		   // Map
		   Map map=new HashMap();
		   map.put("start", start);
		   map.put("end", end);
		   
		   List<FoodVO> list= FoodDAO.foodListData(map);
		   if(tagcode != null) {
			   map.put("tagcode", Integer.parseInt(tagcode));
			   list = FoodDAO.foodTagDetailData(map);
			   list = FoodDAO.foodData(map);
			   totalpage = FoodDAO.foodTagTotalPage();
			   
			   FoodTagVO tagvo = FoodDAO.getFoodTagVO(Integer.parseInt(tagcode));
			   request.setAttribute("tagvo", tagvo);
		   }
		  
		   for(FoodVO vo:list)
		   {
			   String rname=vo.getRname();
			   if(rname.length()>12)
			   {
				   rname=rname.substring(0,12).concat("...");
				   vo.setRname(rname);
			   }
			   HomeItemVO temp = new HomeItemVO();
			   temp.setType(2);
			   temp.setNo(vo.getNo());
			   
			   temp = MainDAO.getGradeReviewCntByTypeNo(temp);
			   vo.setGrade(temp.getGrade());
			   vo.setRank(temp.getReviewCnt());
			   
			   for(WishListVO_u wlvo : wishlist) {
				   if(vo.getNo()==wlvo.getNo() && wlvo.getType()==2) vo.setWish(true);
			   }
			   
			   DetailDAO dtdao = new DetailDAO();
			   
			   Map tmap = new HashMap();
			   tmap.put("type", 2);
			   tmap.put("no", vo.getNo());
			   
			   int min = dtdao.reviewMin(tmap);
			   int max = dtdao.reviewMax(tmap);
			   
			   tmap.put("numm", 1);
			   tmap.put("grade", max);
			   DetailReviewVO topRv = dtdao.getReviewTop(tmap);
			   tmap.put("grade", min);
			   DetailReviewVO worstRv = dtdao.getReviewWorst(tmap);
			   vo.setTopRv(topRv);
			   vo.setWorstRv(worstRv);
		   }
			
		   final int BLOCK=10;
		   int startPage=((curpage-1)/BLOCK*BLOCK)+1; 
		   int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
		   // 1~10  , 11~20  85  => endPage= 81~90
		   
		   int allPage=totalpage;
		   if(endPage>allPage)
			   endPage=allPage;
		   
		   
		   
		   // 체크박스에 테그리스트 넘기기
		   List<FoodTagVO> taglist=FoodDAO.foodTagListData(map);
		   
	   
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
		
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return "../main/index.jsp";
	}
	@RequestMapping("category/foodtag_content.do")
	public String category_foodtag(HttpServletRequest request, HttpServletResponse response){
			
		List<WishListVO_u> wishlist = new ArrayList<WishListVO_u>();
		 try {
			 wishlist = MainDAO.getWishListsByMemberId(((LoginVO)(request.getSession().getAttribute("ss_member"))).getMemberId());
		 } catch (Exception e) {}
				
		// 태그 페이지
		 String page=request.getParameter("page");
		   if(page == null || page.length() == 0)
			   page="1";
		   System.out.println(page);
		   int curpage=Integer.parseInt(page);
		   int rowSize=10;
		   int start=(rowSize*curpage)-(rowSize-1);

		   int end=rowSize*curpage;
		   
		   Map tmap=new HashMap();
		   tmap.put("start", start);
		   tmap.put("end", end);
		   
		   List<FoodVO> tlist = FoodDAO.foodListData(tmap);
		   int tagtotalpage=FoodDAO.foodTagTotalPage();
		   
		   String tagnames = request.getParameter("tagnames");
		   String foodtagcode = request.getParameter("foodtagcode");
		   if(foodtagcode.equals("data")){
			   request.setAttribute("title", "서울의 음식점");
		   } else{
			   tmap.put("tagcode", foodtagcode.substring(5));
			   request.setAttribute("title", tagnames.substring(7));
			   
			   FoodDAO.foodTagDetailData(tmap);
			   tlist = FoodDAO.foodData(tmap);
			   tagtotalpage = FoodDAO.foodTagTotalPage();
		   }	  
		   
		   for(FoodVO vo:tlist)
		   {
			   String rname=vo.getRname();
			   if(rname.length()>12)
			   {
				   rname=rname.substring(0,12).concat("...");
				   vo.setRname(rname);
			   }
			   HomeItemVO temp = new HomeItemVO();
			   temp.setType(2);
			   temp.setNo(vo.getNo());
			   
			   temp = MainDAO.getGradeReviewCntByTypeNo(temp);
			   vo.setGrade(temp.getGrade());
			   vo.setRank(temp.getReviewCnt());
			   
			   for(WishListVO_u wlvo : wishlist) {
				   if(vo.getNo()==wlvo.getNo() && wlvo.getType()==2) vo.setWish(true);
			   }
			
			   DetailDAO dtdao = new DetailDAO();
			   
			   tmap.clear();
			   tmap.put("type", 2);
			   tmap.put("no", vo.getNo());
			   
			   int min = dtdao.reviewMin(tmap);
			   int max = dtdao.reviewMax(tmap);
			   
			   tmap.put("numm", 1);
			   tmap.put("grade", max);
			   DetailReviewVO topRv = dtdao.getReviewTop(tmap);
			   tmap.put("grade", min);
			   DetailReviewVO worstRv = dtdao.getReviewWorst(tmap);
			   
			   vo.setTopRv(topRv);
			   vo.setWorstRv(worstRv);
			   
		   }
		   
		   
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
		   
		   
		request.setAttribute("tlist", tlist);   
		
		return "../category/foodtag_content_result.jsp";
	}
	
}