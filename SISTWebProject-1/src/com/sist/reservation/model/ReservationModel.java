package com.sist.reservation.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

@Controller
public class ReservationModel {

	@RequestMapping("reservation/reservation.do")
	public String reservation_detail(HttpServletRequest request,HttpServletResponse response)
	{
		String no=request.getParameter("no");
		System.out.println(no);
		RestaurantVO vo=ReservationDAO.restaurantData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../reservation/reservation.jsp");
		return "../main/index.jsp";
	}
	
	@RequestMapping("reservation/reserve_ok.do")
	public String reservation_reserve_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		ReservationVO vo=new ReservationVO();
		
	
		String id=request.getParameter("id").trim();
		String no=request.getParameter("no");
		String reservationdate=request.getParameter("date2").trim();
		String time=request.getParameter("time2").trim();
		String inwon=request.getParameter("person2").trim();
		String name=request.getParameter("name2").trim();
		String email=request.getParameter("email2").trim();
		String tel=request.getParameter("tel2").trim();
		
		System.out.println(id);
		System.out.println(no);
		System.out.println(reservationdate);
		System.out.println(time);
		System.out.println(inwon);
		System.out.println(name);
		System.out.println(email);
		System.out.println(tel);
		
		vo.setNo(Integer.parseInt(no));
		vo.setMemberid(id);
		vo.setName(name);
		vo.setEmail("qwerty@sist.co.kr");
		vo.setInwon(Integer.parseInt(inwon));
		vo.setReservationdate(reservationdate);
		vo.setTel(tel);
		vo.setTime(time);
		
		ReservationDAO.bookingInfoInsert(vo);
		
		return "redirect: ../detail/detail.do?type=2&no=273";
	}
	
}	
	