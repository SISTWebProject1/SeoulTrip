package com.sist.home.model;

import java.util.List;

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
		request.setAttribute("calendarvo", new CalendarVO(2020, 4).getInstance());
		
		List<FestivalVO> flist = FestivalDAO.festivalAllList();
		for(FestivalVO vo : flist) {
			System.out.println(vo.getFmtStart()+" - "+vo.getFmtEnd());
		}
		request.setAttribute("flist", flist);
		
		return "../main/index.jsp";
	}

}