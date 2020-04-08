package com.sist.mypage.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;


@Controller
public class MypageModel {

	@RequestMapping("mypage/profile.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../mypage/profile8.jsp");
//		request.setAttribute("banner_on", true);
		
		return "../main/index.jsp";
	}

}
