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
		// Login 정보 --> id,birth,regdate 값을 받음
		LoginVO vo = (LoginVO)request.getSession().getAttribute("ss_member");
		System.out.println(vo.getMemberId());
		String id = vo.getMemberId().trim();
		
		MemberVO_u my_vo = MypageDAO.PassWord_check(id);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		sdf.applyPattern("yyyy-MM-dd");
		String birth = sdf.format(my_vo.getBirth());
		String regdate = sdf.format(my_vo.getRegdate());
		
		System.out.println("11111111"+my_vo.getCoverPhoto()+"1111111");
		
		
		request.setAttribute("birth", birth);
		request.setAttribute("regdate", regdate);
		request.setAttribute("my_vo", my_vo);
		
		
		// _> Login 정보 End
	
		// review 확인 -> review_image, content,regdate, 등 memberId에 일치하는  review데이터를 수집
		List<ReviewVO_u> list = new ArrayList<ReviewVO_u>();
		int count=0;
		list = MypageDAO.ReviewData(id);
		// 사진을 모으기 위해 reviewNO를 배열에 저장
		int reviewNo[] = new int[list.size()];

		int i =0;
		for(ReviewVO_u v1 : list){
			System.out.println(i+" "+v1.getReviewno());
			reviewNo[i] = v1.getReviewno();
			i++;
		}
		
		list = MypageDAO.getImageForReview(list, reviewNo);
		
		count = list.size();
		request.setAttribute("list", list);
		request.setAttribute("count", count);
		// _> review 정보 End
		
		
		// 페이지
		String page =request.getParameter("page");
		String type = request.getParameter("type");
//		String no = request.getParameter("no");
		
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
		//map.put("no", no);
		map.put("type", type);
		map.put("start", start);
		map.put("end", end);
		// review 정보 확인
		
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
		
		String year = request.getParameter("year");
		System.out.println("확인 : "+year);
		String month = request.getParameter("month");
		System.out.println("확인 "+month);
		String day = request.getParameter("day");
		System.out.println("확인 : "+ day);
		String birth =year+"-"+month+"-"+day;
		
		
		System.out.println(birth);
		
		MemberVO_u my_vo = new MemberVO_u();
		my_vo.setBirth(Date.valueOf((birth)));
		my_vo.setMemberId(id);
		my_vo.setName(name);
		my_vo.setAddr1(addr1);
		my_vo.setEmail(email);
		my_vo.setTel(tel);
		my_vo.setSelfInfo(selfinfo);
		System.out.println(my_vo.getEmail());
		
		MypageDAO.Update_ok(my_vo);
		
		return "redirect:../mypage/profile.do";
		
	}
	
	@RequestMapping("mypage/profile_Update.do")
	public String profile_Update(HttpServletRequest request, HttpServletResponse response){
		try{
			request.setCharacterEncoding("UTF-8");
		}catch(Exception ex){
			ex.printStackTrace();	
		}
		
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		System.out.println(id);
		System.out.println("null??");
		MemberVO_u vo_u = MypageDAO.PassWord_check(id);
		System.out.println("null??");
		System.out.println(vo_u.getBirth());
		System.out.println("null??");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String birth_tmp = sdf.format(vo_u.getBirth());
		System.out.println(birth_tmp);
		Date birth = Date.valueOf(birth_tmp);
		System.out.println(birth);
		vo_u.setBirth(birth);
		
		StringTokenizer st = new StringTokenizer(birth_tmp,"-");
		String year = st.nextToken();
		String month = st.nextToken();
		String day = st.nextToken();
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);
		
		
		request.setAttribute("my_vo", vo_u);
		request.setAttribute("main_jsp", "../mypage/update.jsp");
		
		return "../main/index.jsp";
	}

}