package com.sist.member.model;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import java.util.*;

@Controller
public class MemberModel {
	@RequestMapping("member/join.do")
	public String member_join(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("main_jsp", "../member/join.jsp");
		request.setAttribute("banner_on", true);
		
		return "../main/index.jsp";
	}
	@RequestMapping("member/postfind.do")
	public String member_postfind(HttpServletRequest request,HttpServletResponse response)
	{
		return "../member/postfind.jsp";
	}
	
	@RequestMapping("member/postfind_result.do")
	public String member_postfind_result(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
			
		}catch(Exception ex){}
		String dong=request.getParameter("dong");
		List<ZipcodeVO> list=MemberDAO_c.postfindData(dong);
		
		request.setAttribute("list", list);
		request.setAttribute("count", list.size());
		return "../member/postfind_result.jsp";
	}
	@RequestMapping("member/idcheck.do")
	public String member_idcheck(HttpServletRequest request,HttpServletResponse response)
	{
		return "../member/idcheck.jsp";
	}
	@RequestMapping("/member/idcheck_result.do")
	public String member_idcheck_result(HttpServletRequest request,HttpServletResponse response)
	{
		String memberid=request.getParameter("memberid");
		int count=MemberDAO_c.idcheckData(memberid);
		System.out.println(count);
		request.setAttribute("count", count);
		return "../member/idcheck_result.jsp";
	}
	@RequestMapping("member/join_ok.do")
	public String member_join_ok(HttpServletRequest request,HttpServletResponse response)
	{
		try
		{
			request.setCharacterEncoding("UTF-8");
			
		}catch(Exception ex){}
		
		String photo=request.getParameter("photo");
		System.out.println(photo);
		String memberid=request.getParameter("memberid");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String birth=request.getParameter("birth");
		String gender=request.getParameter("gender");
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		String tel1=request.getParameter("tel1");
		String tel2=request.getParameter("tel2");
		String tel3=request.getParameter("tel3");
		String selfinfo=request.getParameter("selfinfo");
		System.out.println(memberid);
		System.out.println(pwd);
		System.out.println(name);
		System.out.println(email);
		System.out.println(birth);
		System.out.println(gender);
		System.out.println(addr1);
		System.out.println(addr2);
		System.out.println(tel1);
		System.out.println(tel2);
		System.out.println(tel3);
		System.out.println(selfinfo);
		
		MemberVO_c vo=new MemberVO_c();
		vo.setPhoto(photo);
		vo.setMemberid(memberid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setEmail(email);
		vo.setBirth(birth);
		vo.setGender(gender);
		vo.setAddr1(addr1);
		vo.setAddr2(addr2);
		vo.setTel(tel1+"-"+tel2+"-"+tel3);
		vo.setSelfinfo(selfinfo);
		
		//insert
		MemberDAO_c.memberInsert(vo);
		return "redirect:../main/index.do";
	}
	
	@RequestMapping("member/login.do")
	public String member_login(HttpServletRequest request,HttpServletResponse response)
	{
		String memberid=request.getParameter("memberid"); //name값으로 읽어옴 name=id
		String pwd=request.getParameter("pwd");
		// DAO연결 하기
		MemberVO_c vo=MemberDAO_c.memberLogin(memberid,pwd);
		if(vo.getMsg().equals("OK")) // 둘다 맞았다면
		{
			HttpSession session=request.getSession();
			session.setAttribute("memberid", memberid);
			session.setAttribute("name", vo.getName());
//			session.setAttribute("admin", vo.getAdmin()); // 로그인 하면서 admin인지 아닌지 계속 확인해야함
		}
		// DAO연결해서 나온값을 밑의 ../main/login_ok.jsp에 보냄
		request.setAttribute("msg", vo.getMsg()); // msg 하나에 다 모아놨으니 msg
		return "../main/login.jsp";
	}
	@RequestMapping("member/logout.do")
	public String member_logout(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:../main/main.do";
	}
}
