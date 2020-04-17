package com.sist.mypage.model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.main.dao.LoginVO;
import com.sist.main.dao.MainDAO;


@Controller
public class MypageModel {

	@RequestMapping("mypage/profile.do")
	public String main_profile(HttpServletRequest request, HttpServletResponse response) {
		
		LoginVO vo = (LoginVO)request.getSession().getAttribute("ss_member");
		System.out.println(vo.getMemberId());
		String id = vo.getMemberId().trim();
		MemberVO_u my_vo = MypageDAO.PassWord_check(id);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.applyPattern("yyyy-MM-dd");
		String birth = sdf.format(my_vo.getBirth());
		String regdate = sdf.format(my_vo.getRegdate());
		
		request.setAttribute("birth", birth);
		request.setAttribute("regdate", regdate);
		request.setAttribute("vo", my_vo);
		System.out.println(my_vo.getRegdate());
		
		
		// review 확인
		List<ReviewVO_u> list = new ArrayList<ReviewVO_u>();
		int count=0;
		list = MypageDAO.ReviewData(id);
		for(ReviewVO_u v1 : list){
			System.out.println(v1.getNo());
			System.out.println(v1.getTitle());
			System.out.println(v1.getLikecode());
			System.out.println(v1.getMemberId());
		}
		count = MypageDAO.ReviewCount(id);
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		
		// 페이지
		String page =request.getParameter("page");
		String type = request.getParameter("type");
		String no = request.getParameter("no");
		
		int totalpage = 0;
		
		if(page==null)
			page="1";
		int curpage = Integer.parseInt(page);
		int rowSize = 5;
		int start = (rowSize)* curpage-(rowSize-1);
		int end = rowSize*curpage;
		final int BLOCK = 10;
		int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		// 1~10 , 11~20
		
		int allPage = totalpage;
		if(endPage>allPage)
			endPage = allPage;
		
		Map map = new HashMap();
		map.put("no", no);
		map.put("type", type);
		map.put("start", start);
		map.put("end", end);
		
		// review 정보 확인
//		list = MypageDAO.getReviewData(map);
//		List<PhotoVO_u> imglist = dao.getImageForReview(Integer.parseInt(no));
		
		request.setAttribute("main_jsp", "../mypage/profile8.jsp");
		return "../main/index.jsp";
	}
	@RequestMapping("mypage/wishlist.do")
	public String wishlist(HttpServletRequest request, HttpServletResponse response){
		LoginVO vo = (LoginVO) request.getSession().getAttribute("ss_member");
		List<WishListVO_u> list = MypageDAO.wishlistData(vo.getMemberId());
		int count =0;
		count = list.size();
		request.setAttribute("list", list);
		request.setAttribute("count", count);
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
		String tel = request.getParameter("tel");
		String selfinfo = request.getParameter("selfinfo");
		
		MemberVO_u vo = new MemberVO_u();
		vo.setMemberId(id);
		vo.setName(name);
		vo.setAddr1(addr1);
		vo.setEmail(email);
		vo.setTel(tel);
		vo.setSelfInfo(selfinfo);
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
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		vo.setMemberId(vo_u.getMemberId());
		vo.setName(vo_u.getName());
		vo.setAddr1(vo_u.getAddr1());
		String brith = sdf.format(vo_u.getBirth());
		System.out.println(brith);
		Date birth = Date.valueOf(brith);
		System.out.println(birth);
		vo.setEmail(vo_u.getEmail());
		vo.setBirth(birth);
		vo.setTel(vo_u.getTel());
	
		Calendar cal =  Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		
		
		request.setAttribute("year", year);
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../mypage/update.jsp");
		
		return "../main/index.jsp";
	}

}