package com.sist.main.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class MainModel {
	
	@RequestMapping("main.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "home/home.jsp");
		
		return "index.jsp";
	}

}
