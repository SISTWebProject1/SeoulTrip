package com.sist.mypage.model;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;


@Controller
public class MypageModel {

	@RequestMapping("mypage/profile.do")
	public String main_profile(HttpServletRequest request, HttpServletResponse response) {
		request.setAttribute("main_jsp", "../mypage/profile8.jsp");
		
		
		return "../main/index.jsp";
	}
	@RequestMapping("mypage/wishlist.do")
	public String wishlist(HttpServletRequest request, HttpServletResponse response){
		request.setAttribute("main_jsp", "../mypage/wishlist.jsp");
		
		return "../main/index.jsp";
	}
	
	
	@RequestMapping("mypage/passwordCheck.do")
	public String passwordCheck(HttpServletRequest request,HttpServletResponse response){

		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		request.setAttribute("id", id);
		request.setAttribute("pwd", pwd);
		
		MemberVO_u vo =MypageDAO.PassWord_check(id);
		int res=0;
		if(vo.getPwd().equals(pwd)){
			res=1;
			System.out.println("성공!");
		}
		else{
			res=0;
			System.out.println("불일치");
		}
		request.setAttribute("result", res);
		return "../mypage/passowrd_check.jsp";
	}
	@RequestMapping("mypage/update_ok.do")
	public String password_ok(HttpServletRequest request,HttpServletResponse response){
		try{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex){
			ex.printStackTrace();
		}
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String addr1 = request.getParameter("addr1");
		String email = request.getParameter("email");
		MemberVO_u vo = new MemberVO_u();
		vo.setMemberId(id);
		vo.setName(name);
		vo.setAddr1(addr1);
		vo.setEmail(email);
		System.out.println(vo.getEmail());
		
		MypageDAO.Update_ok(vo);
		
		return "redirect:../mypage/profile.do";
		
	}
	
	@RequestMapping("mypage/profile_Update.do")
	public String profile_Update(HttpServletRequest request, HttpServletResponse response){
		try{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex){
			ex.printStackTrace();	
		}
		MemberVO_u vo = new MemberVO_u();
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		MemberVO_u vo_u = MypageDAO.PassWord_check(id);
		
		vo.setMemberId(vo_u.getMemberId());
		vo.setName(vo_u.getName());
		vo.setAddr1(vo_u.getAddr1());
		vo.setAddr2(vo_u.getAddr2());
		
		vo.setBirth(vo_u.getBirth());
		vo.setEmail(vo_u.getEmail());
		
		request.setAttribute("vo", vo_u);
		request.setAttribute("main_jsp", "../mypage/update.jsp");
		
		return "../main/index.jsp";
	}

}