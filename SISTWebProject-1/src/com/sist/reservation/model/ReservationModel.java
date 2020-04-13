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
		//rvo.setMemberid(memberid); 								-- from session isLogin
		//rvo.setBookingnumber(bookingnumber);						-- unused variables / TO_DATE(insert)
		
		rvo.setTime(time);
		rvo.setInwon(Integer.parseInt(person));
		rvo.setReservationdate(date);
		return "redirect:../reservation/reservation_ok.do";
	}
}	
	