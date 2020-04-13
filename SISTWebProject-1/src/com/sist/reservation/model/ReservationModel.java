package com.sist.reservation.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class ReservationModel {

	@RequestMapping("reservation/reservation.do")
	public String reservation(HttpServletRequest request,HttpServletResponse response)
	{
		request.setAttribute("main_jsp", "../reservation/reservation.jsp");
		return "../main/index.jsp";
	}
	
	@RequestMapping("reservation/reservation_ok.do")
	public String reservation_ok(HttpServletRequest request, HttpServletResponse response)
	{
		String no=request.getParameter("no");
		ReservationVO vo=ReservationDAO.reservationListData(Integer.parseInt(no));
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp","???");
		return "????"; //어디로 갈지 생각해보기.....
	}
}	
	