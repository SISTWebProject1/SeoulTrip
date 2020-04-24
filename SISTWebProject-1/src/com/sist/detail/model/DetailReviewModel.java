package com.sist.detail.model;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import com.sist.detail.dao.*;
import com.sist.main.dao.LoginVO;
import com.sist.main.dao.MainDAO;

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
		String no = "";
		String type="";
		DateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");

		int size = 10*1024*1024;

		System.out.println("리뷰 작성");

		String uploadPath=request.getSession().getServletContext().getRealPath("/uploadCheck");
		System.out.println(uploadPath);
		String path = "../uploadCheck/";
		try{
		    MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());
		    Enumeration files = multi.getFileNames();
		    no = multi.getParameter("no");
		    type= multi.getParameter("type");
		    String memberid= multi.getParameter("memberid");
		    String title = multi.getParameter("title");
		    String content = multi.getParameter("content");
		    String hashtag = multi.getParameter("hashtag");
		    String regdate = multi.getParameter("regdate");
		    String expdate = multi.getParameter("expdate");
		    
		    String grade = multi.getParameter("grade");
		   
		    String file1 = (String)files.nextElement();
		    String filename1 = multi.getFilesystemName(file1);
		    String file2 = (String)files.nextElement();
		    String filename2=multi.getFilesystemName(file2);
		     
		    String filepath1 = path.concat(filename1);
		    String filepath2 = path.concat(filename2);
			
		    int depth=0;
			
		    DetailReviewVO vo = new DetailReviewVO();
			vo.setNo(Integer.parseInt(no));
			vo.setType(Integer.parseInt(type));
			vo.setMemberid(memberid);
			vo.setTitle(title);
			vo.setContent(content);
			Date regdateParse = sdFormat.parse(regdate);
			vo.setRegdate(regdateParse);
			Date expdateParse = sdFormat.parse(expdate);
			vo.setExpdate(expdateParse);
			vo.setGrade(Integer.parseInt(grade));
			vo.setDepth(depth);
			DetailDAO.detailReviewInsert(vo);
			int reviewNumber = DetailDAO.getReviewNumber();
			
			
			Map map = new HashMap<>();
			map.put("reviewno", reviewNumber);
			map.put("filepath", filepath1);
			DetailDAO.insertPhoto(map);
			
			MainDAO.setReviewnoHashtagnames(reviewNumber, hashtag);
			System.out.println(reviewNumber);
			request.setAttribute("filepath1", filepath1);
			request.setAttribute("filepath2", filepath2);
			request.setAttribute("no", no);
			request.setAttribute("type", type);

		}catch(Exception e){
		    e.printStackTrace();
		}
		request.setAttribute("uploadPath", uploadPath);
/*		request.setAttribute("main_jsp", "../detail/detail.jsp");
		request.setAttribute("detail_board_jsp","../detail/detail_board.jsp");*/
		
		return "redirect:../detail/detail.do?type="+type+"&no="+no;
	}
}
