package com.sist.main.model;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.main.dao.HashTagVO;
import com.sist.main.dao.HomeItemVO;
import com.sist.main.dao.LoginVO;
import com.sist.main.dao.MainDAO;
import com.sist.mypage.model.WishListVO_u;

@Controller
public class MainModel {
	
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		//request.setAttribute("main_jsp", "main_content.jsp");
		//request.setAttribute("banner_on", true);
		
		return "index.jsp";
	}
	
	@RequestMapping("login_ok.do")
	public String login_ok(HttpServletRequest request, HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("email").trim();
		String pwd = request.getParameter("password").trim();
		
		LoginVO lvo = MainDAO.getLoginInfo(id, pwd);
		try {
			switch (lvo.getState()) {
				case "NOID" : {
					request.setAttribute("login_ok_msg", "NOID");
					break;
				}
				case "NOPWD" : {
					request.setAttribute("login_ok_msg", "NOPWD");
					break;
				}
				case "SUCCESS" : {
					request.setAttribute("login_ok_msg", "SUCCESS|"+lvo.getPhoto()+"|"+lvo.getName());
					request.getSession().setAttribute("ss_member", lvo);
					break;
				}
			}
		} catch (Exception e) {
			System.out.println("MainModel:login_ok():");
			e.printStackTrace();
		}
		
		return "main/login_ok.jsp";
	}
	
	@RequestMapping("logout_ok.do")
	public String logout_ok(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().removeAttribute("ss_member");
		
		return "redirect:home/home.do";
	}
	
	@RequestMapping("main/search.do")
	public String main_search(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {}
		
		String keyword = request.getParameter("keyword");
		List<HomeItemVO> tpList = MainDAO.getSearchData(1, keyword);
		request.setAttribute("tpList", tpList);
		List<HomeItemVO> rsList = MainDAO.getSearchData(2, keyword);
		request.setAttribute("rsList", rsList);
		List<HomeItemVO> fsList = MainDAO.getSearchData(3, keyword);
		request.setAttribute("fsList", fsList);
		List<HomeItemVO> htList = MainDAO.getHashTagSearchData(keyword);
		request.setAttribute("htList", htList);
		
		return "../main/search_result.jsp";
	}
	
	@RequestMapping("main/insertintowishlist.do")
	public String main_insertintowishlist(HttpServletRequest request, HttpServletResponse response) {
		String type = request.getParameter("type");
		String no = request.getParameter("no");
		
		String id;
		try {
			LoginVO lvo = (LoginVO) request.getSession().getAttribute("ss_member");
			id = lvo.getMemberId();
		} catch (Exception e) {
			request.setAttribute("msg", "fail");
			return "task_result.jsp";
		}
		
		MainDAO.insertIntoWishlist(id, type, no);
		
		request.setAttribute("msg", "success");
		return "task_result.jsp";
	}
	
	@RequestMapping("main/deleteFromWishlist.do")
	public String main_deleteFromWishlist(HttpServletRequest request, HttpServletResponse response) {
		String type = request.getParameter("type");
		String no = request.getParameter("no");
		
		String id;
		try {
			LoginVO lvo = (LoginVO) request.getSession().getAttribute("ss_member");
			id = lvo.getMemberId();
		} catch (Exception e) {
			request.setAttribute("msg", "fail");
			return "task_result.jsp";
		}
		
		MainDAO.deleteFromWishlist(id, type, no);
		
		request.setAttribute("msg", "success");
		return "task_result.jsp";
	}
	
	@RequestMapping("main/getwishlistbyid.do")
	public String main_getwishlistbyid(HttpServletRequest request, HttpServletResponse response) {
		LoginVO lvo = (LoginVO) request.getSession().getAttribute("ss_member");
		String id = lvo.getMemberId();
		
		List<WishListVO_u> list = MainDAO.getWishListsByMemberId(id);
		String msg = "";
		for(WishListVO_u vo : list) {
			msg += ","+vo.getType()+"_"+vo.getNo();
		}
		
		request.setAttribute("msg", msg.substring(1));
		return "task_result.jsp";
	}

}


































