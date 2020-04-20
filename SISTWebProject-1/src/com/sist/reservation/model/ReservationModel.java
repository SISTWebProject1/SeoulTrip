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
		RestaurantVO_r vo=new RestaurantVO_r();
		vo=ReservationDAO.reservationListData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../reservation/reservation.jsp");
		return "../main/index.jsp";
	}
	
		
	
	@RequestMapping("reservation/reservation_ok.do")
	public static String reservation_ok(HttpServletRequest request, HttpServletResponse response)
	{
		try
		{	
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex){}
		String name=request.getParameter("name");	
		String email=request.getParameter("email");
		String date=request.getParameter("date");
		String time=request.getParameter("time");
		String person=request.getParameter("person");
		String tel=request.getParameter("tel");
		
		ReservationVO rvo=new ReservationVO();
		rvo.setTime(time);
		rvo.setInwon(Integer.parseInt(person));
		rvo.setReservationdate(date);
		
		ReservationDAO.bookingInsert(rvo);
		return "../reservation/reservation_ok.jsp";
	}
}	
	