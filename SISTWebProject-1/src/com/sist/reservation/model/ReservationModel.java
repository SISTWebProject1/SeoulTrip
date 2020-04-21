package com.sist.reservation.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class ReservationModel {

	@RequestMapping("reservation/reservation.do")
	public static String reservation_detail(HttpServletRequest request,HttpServletResponse response)
	
	{
		String no=request.getParameter("no");
		System.out.println(no);
		RestaurantVO vo=new RestaurantVO();
		vo=ReservationDAO.reservationListData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../reservation/reservation.jsp");
		return "../main/index.jsp";
	}
	
	@RequestMapping("reservation/login.do")
	public String reservation_login(HttpServletRequest request,HttpServletResponse response)
	{
		return"reservation/login.jsp";
	}
	
	@RequestMapping("reservation/login_ok.do")
	public String movie_login_ok(HttpServletRequest request,HttpServletResponse response)
	{	
		String id=request.getParameter("id");
		String pwd=request.getParameter("pwd");
		
		return "reservation/login_ok.jsp";
	}
		
	
}	
	