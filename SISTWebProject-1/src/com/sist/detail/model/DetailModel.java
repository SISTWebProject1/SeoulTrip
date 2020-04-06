package com.sist.detail.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class DetailModel {
	@RequestMapping("detail/detail.do")
	public String main_detail(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../detail/detail.jsp");
		//request.setAttribute("banner_on", true);
		
		return "../main/index.jsp";
	}
}
