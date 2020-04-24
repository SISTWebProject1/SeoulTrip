package com.sist.home.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.main.dao.HashTagVO;
import com.sist.main.dao.HomeItemVO;
import com.sist.main.dao.MainDAO;

@Controller
public class HomeModel {
	
	@RequestMapping("home/home.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		
		request.setAttribute("main_jsp", "../home/home.jsp");
		request.setAttribute("banner_on", true);
		
		List<HomeItemVO> hiList = MainDAO.getHIListFromCookies(request);
		int hiSize = hiList.size();
		request.setAttribute("hiList", hiList);
		request.setAttribute("hiSize", hiSize);
		
		Date today = new Date();
		int curyear = 2020;
		int curmonth = today.getMonth()+1;
		int curdate = today.getDate();
		request.setAttribute("curmonth", curmonth);
		request.setAttribute("curdate", curdate);
		request.setAttribute("calendarvo", new CalendarVO(curyear, curmonth).getInstance());
		
		List<FestivalVO> flist = FestivalDAO.festivalAllList();
		request.setAttribute("flist", flist);

		List<HashTagVO> htlist = MainDAO.getHTListRegDESC();
		request.setAttribute("htlist", htlist);

		List<HashTagVO> phtlist = MainDAO.getPopularHTList();
		request.setAttribute("phtlist", phtlist);
		
		Map<HashTagVO,List<HomeItemVO>> lists = new HashMap<HashTagVO, List<HomeItemVO>>();
		lists = MainDAO.getHTItemsListsByCookie(request, response);
		request.setAttribute("lists", lists);
		
		return "../main/index.jsp";
	}
	
	@RequestMapping("home/festivalList.do")
	public String home_festivalList(HttpServletRequest request, HttpServletResponse response) {
		String strDate = request.getParameter("date");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-M-d");
		Date date = new Date();
		try {
			date = sdf.parse(strDate);
		} catch (ParseException e) {
			System.out.println("HomeModel:home_festivalList():");
			e.printStackTrace();
		}
		
		List<FestivalVO> flist = FestivalDAO.festivalDateList(date);
		request.setAttribute("flist", flist);
		
		request.setAttribute("main_jsp", "../home/festivalList.jsp");
		request.setAttribute("banner_on", true);
		
		List<HomeItemVO> hiList = MainDAO.getHIListFromCookies(request);
		int hiSize = hiList.size();
		request.setAttribute("hiList", hiList);
		request.setAttribute("hiSize", hiSize);
		
		int curyear = 2020;
		int curmonth = date.getMonth()+1;
		int curdate = date.getDate();
		request.setAttribute("curmonth", curmonth);
		request.setAttribute("curdate", curdate);
		request.setAttribute("calendarvo", new CalendarVO(curyear, curmonth).getInstance());
		
		return "../main/index.jsp";
	}
	
	@RequestMapping("home/htitemlist.do")
	public String home_htitemlist(HttpServletRequest request, HttpServletResponse response) {
		String strPage = request.getParameter("page");
		if(strPage==null) strPage = "1";
		
		int curpage = Integer.parseInt(strPage);
		int tagcode = Integer.parseInt(request.getParameter("tagcode"));
		
		HashTagVO htvo = MainDAO.getHashTagData(tagcode);
		request.setAttribute("htvo", htvo);
		
		List<HomeItemVO> htitemlist = MainDAO.getHIListByTagcode_page(tagcode, curpage);
		request.setAttribute("htitemlist", htitemlist);
		
		request.setAttribute("main_jsp", "../home/htitemlist.jsp");
		request.setAttribute("banner_on", true);
		
		List<HomeItemVO> hiList = MainDAO.getHIListFromCookies(request);
		int hiSize = hiList.size();
		request.setAttribute("hiList", hiList);
		request.setAttribute("hiSize", hiSize);
		
		List<HashTagVO> phtlist = MainDAO.getPopularHTList();
		request.setAttribute("phtlist", phtlist);
		
		request.setAttribute("curpage", strPage);
		request.setAttribute("totalpage", MainDAO.getHTItemListTotalPage(tagcode));
		
		List<HashTagVO> htlist = MainDAO.getHTListRegDESC();
		request.setAttribute("htlist", htlist);
		
		return "../main/index.jsp";
	}

}























