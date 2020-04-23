package com.sist.detail.model;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import com.sist.detail.dao.*;
import com.sist.main.dao.LoginVO;

import javafx.application.Application;

@Controller
public class DetailReviewModel {
	@RequestMapping("detail/detail_review_insert.do")
	public String detail_review_insert(HttpServletRequest request, HttpServletResponse response){

		LoginVO vo2 = (LoginVO) request.getSession().getAttribute("ss_member");
		String memberid = vo2.getMemberId();
		
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		DetailDAO dao = new DetailDAO();
		DetailReviewDAO rdao = new DetailReviewDAO();
		
		DetailTourplaceVO tvo = new DetailTourplaceVO();
		DetailRestaurantVO rvo = new DetailRestaurantVO();
		DetailFestivalVO fvo = new DetailFestivalVO();
		

		
		Map map = new HashMap<>();
		map.put("no", no);
		map.put("type",type);
		List<String> hashtaglist = rdao.DetailhashtagList(map);
		
		if(Integer.parseInt(type)==1){
			tvo = dao.getTourplaceData(Integer.parseInt(no));
			System.out.println("장소 데이터");
			request.setAttribute("info", tvo);
			request.setAttribute("title", tvo.getTname());
			request.setAttribute("category", "명소");
		}else if(Integer.parseInt(type)==2){
			rvo = dao.getRestaurantData(Integer.parseInt(no));
			System.out.println("음식 데이터");
			request.setAttribute("info", rvo);
			request.setAttribute("title", rvo.getRname());
			request.setAttribute("category", "음식점");
		}else if(Integer.parseInt(type)==3){
			fvo = dao.getFestivalData(Integer.parseInt(no));
			System.out.println("축제데이터");
			request.setAttribute("info", fvo);
			request.setAttribute("title", fvo.getFname());
			request.setAttribute("category", "축제");
		}
		
		request.setAttribute("type", type);
		request.setAttribute("no", no);
		request.setAttribute("hashtaglist", hashtaglist);
		request.setAttribute("memberid", memberid);
	
		request.setAttribute("main_jsp", "../detail/detail_review_insert.jsp");
		return "../main/index.jsp";
	}
	
	
	@RequestMapping("detail/detail_review_insert_ok.do")
	public String detail_review_insert_ok(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");  
		} catch (Exception e) {
			// TODO: handle exception
		}
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		String memberid = request.getParameter("memberid");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String hashtag = request.getParameter("hashtag");
		String regdate = request.getParameter("regdate");
		String expdate = request.getParameter("expdate");
		String grade = request.getParameter("grade");
		
		
		int size = 10*1024*1024;
		String filename1=request.getParameter("photo1");
		String filename2=request.getParameter("photo2");
	
		System.out.println("리뷰 작성");
		System.out.println(no);
		System.out.println(type);
		System.out.println(memberid);
		System.out.println(title);
		System.out.println(content);	
		System.out.println(hashtag);
		System.out.println(regdate);
		System.out.println(expdate);
		System.out.println(grade);
		System.out.println(filename1);
		System.out.println(filename2);
		
		String uploadPath=request.getSession().getServletContext().getRealPath("/");
		System.out.println(uploadPath);
		
		try{
		    MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());
		    Enumeration files = multi.getFileNames();
		    String file1 = (String)files.nextElement();
		    filename1 = multi.getFilesystemName(file1);
		    String file2 = (String)files.nextElement();
		    filename2=multi.getFilesystemName(file2);

		}catch(Exception e){
		    e.printStackTrace();
		}

		
		
		request.setAttribute("filename1",filename1 );
		request.setAttribute("filename2", filename2);
		request.setAttribute("uploadPath", uploadPath);
		request.setAttribute("memberid", memberid);
		request.setAttribute("title", title);
		
		request.setAttribute("main_jsp", "../detail/detail_review_check.jsp");
		return "../main/index.jsp";
	}
}
