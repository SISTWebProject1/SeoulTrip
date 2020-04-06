package com.sist.home.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class HomeModel {
	
	@RequestMapping("home/home.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../home/home.jsp");
		request.setAttribute("banner_on", true);
		
		return "../main/index.jsp";
	}

}