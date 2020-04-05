package com.sist.main.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.main.dao.LoginVO;
import com.sist.main.dao.MainDAO;

@Controller
public class MainModel {
	
	@RequestMapping("main/main.do")
	public String main_main(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "main_content.jsp");
		//request.setAttribute("banner_on", true);
		
		return "index.jsp";
	}
	
	@RequestMapping("login_ok.do")
	public String login_ok(HttpServletRequest request, HttpServletResponse response) {
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

}
