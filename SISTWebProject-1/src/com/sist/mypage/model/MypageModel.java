package com.sist.mypage.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;


@Controller
public class MypageModel {

	@RequestMapping("mypage/profile.do")
	public String main_profile(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../mypage/profile8.jsp");
//		request.setAttribute("banner_on", true);
		
		return "../main/index.jsp";
	}
	@RequestMapping("mypage/wishlist.do")
	public String wishlist(HttpServletRequest request, HttpServletResponse response){
		request.setAttribute("main_jsp", "../mypage/wishlist.jsp");
		
		return "../main/index.jsp";
	}

}
