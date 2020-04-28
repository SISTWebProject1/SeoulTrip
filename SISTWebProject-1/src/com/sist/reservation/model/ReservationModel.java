package com.sist.reservation.model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
		String today=new SimpleDateFormat("yyyy-MM-dd").format(new Date());

		RestaurantVO vo=ReservationDAO.restaurantData(Integer.parseInt(no));
		TagVO tvo=ReservationDAO.recommendTag(Integer.parseInt(no));
		try {
			int tagcode=tvo.getTagcode();
			System.out.println(tagcode);
			List<RestaurantVO> list=ReservationDAO.getrestInfoTag(tagcode);// 받아온 tagcode로 레스토랑 3개 출력
			request.setAttribute("list", list); 
		}catch(Exception e) {
			System.out.println(e.getMessage());
			System.out.println("태그없음");
		}

		

		request.setAttribute("today",today);
		request.setAttribute("vo", vo); // 레스토랑 값 읽어오는 용도
		request.setAttribute("tvo", tvo); // 추천해줄 레스토랑의 tagcode받아오는 용도
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
		vo.setEmail(email);
		vo.setInwon(Integer.parseInt(inwon));
		vo.setReservationdate(reservationdate);
		vo.setTel(tel);
		vo.setTime(time);
		
		ReservationDAO.bookingInfoInsert(vo);
		
		return "redirect: ../mypage/bookingList.do?id="+id;
	}
	
}	
	