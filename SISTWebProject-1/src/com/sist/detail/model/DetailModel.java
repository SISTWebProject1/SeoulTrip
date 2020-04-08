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
		request.setAttribute("detail_board_jsp","../detail/detail_qna.jsp");
		return "../main/index.jsp";
	}
	@RequestMapping("detail/board_review.do")
	public String detail_switch_review(HttpServletRequest request, HttpServletResponse response){
		request.setAttribute("main_jsp", "../detail/detail.jsp");

		request.setAttribute("detail_board_jsp", "../detail/detail_review.jsp");
		return  "../main/index.jsp";
	}
	@RequestMapping("detail/board_qna.do")
	public String detail_switch_qna(HttpServletRequest request, HttpServletResponse response){
		request.setAttribute("main_jsp", "../detail/detail.jsp");

		request.setAttribute("detail_board_jsp", "../detail/detail_qna.jsp");
		return  "../main/index.jsp";
	}
}
