package com.sist.detail.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import com.sist.main.dao.ReplyDAO;
import com.sist.main.dao.ReviewReplyVO;


@Controller
public class DetailReviewReplyModel {
	@RequestMapping("detail/detail_review_list.do")
	public String detail_review_reply(HttpServletRequest request, HttpServletResponse response){
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		String reviewno = request.getParameter("reviewno");
		System.out.println(type);
		System.out.println(no);
		System.out.println(reviewno);
		String page = request.getParameter("page");
		if(page==null)
			page="1";
	
		List<ReviewReplyVO> list = ReplyDAO.replyListData(Integer.parseInt(reviewno), Integer.parseInt(page));
		
		int totalpage = ReplyDAO.replyTotalPage(Integer.parseInt(reviewno));
		request.setAttribute("no", no);
		request.setAttribute("list",list);
		request.setAttribute("totalpage", totalpage);
		return "../detail/detail_review_reply.jsp";
	}
	
/*	@RequestMapping("freeboard/reply_insert.do")
	public String freeboard_reply_insert(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("댓글형 게시판 작동");
		String bno = request.getParameter("bno");
		String msg = request.getParameter("msg");
		HttpSession session=request.getSession();	//request => Session, Cookie 활용
		String id=(String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		
		//DAO => Map에묶어서 처리 
		Map map = new HashMap();
		map.put("pBno", Integer.parseInt(bno));
		map.put("pId", id);
		map.put("pName",name);
		map.put("pMsg", msg);
		
		//INSERT 처리
		FreeBoardReplyDAO.replyInsert(map);
		
		return "redirect:../freeboard/detail.do?no="+bno;
	}
	
	@RequestMapping("freeboard/reply_update.do")
	public String freeboard_reply_update(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		String bno=request.getParameter("bno");
		String no=request.getParameter("no");
		String msg=request.getParameter("msg");
		Map map = new HashMap<>();
		map.put("pNo", Integer.parseInt(no));
		map.put("pMsg", msg);
		
		FreeBoardReplyDAO.replyUpdate(map);
		
		return "redirect:../freeboard/detail.do?no="+bno;
	}
	
	@RequestMapping("freeboard/reply_reply_insert.do")
	public String freeboard_reply_reply_insert(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String bno=request.getParameter("bno");
		String pno=request.getParameter("pno");
		String msg=request.getParameter("msg");
		HttpSession session=request.getSession();
		String id = (String)session.getAttribute("id");
		String name = (String)session.getAttribute("name");
		
		Map map = new HashMap();
		map.put("pBno", Integer.parseInt(bno));
		map.put("pPno", Integer.parseInt(pno));
		map.put("pId", id);
		map.put("pName", name);
		map.put("pMsg",msg);
		
		//DAO
		FreeBoardReplyDAO.replyReplyInsert(map);
		
		return "redirect:../freeboard/detail.do?no="+bno;
	}
	
	@RequestMapping("freeboard/reply_delete.do")
	public String freeboard_reply_delte(HttpServletRequest request, HttpServletResponse response){
		
		String no = request.getParameter("no");
		String bno = request.getParameter("bno");
		Map map = new HashMap();
		map.put("pNo", Integer.parseInt(no));
		
		FreeBoardReplyDAO.replyDelete(map);
		
		return "redirect:../freeboard/detail.do?no="+bno;
	}*/
}
