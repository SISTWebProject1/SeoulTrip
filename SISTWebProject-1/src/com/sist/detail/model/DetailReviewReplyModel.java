package com.sist.detail.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.main.dao.LoginVO;
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
		request.setAttribute("type", type);
		request.setAttribute("rvno", reviewno);
		request.setAttribute("list",list);
		request.setAttribute("totalpage", totalpage);
		return "../detail/detail_review_reply.jsp";
	}
	
	@RequestMapping("detail/detail_review_reply_insert.do")
	public String detail_review__reply_insert(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("댓글형 게시판 입력");
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		String rvno = request.getParameter("rvno");
		String replymsg = request.getParameter("msg");
		//HttpSession session=request.getSession();	//request => Session, Cookie 활용
		//String id=(String)session.getAttribute("id");
		//String name = (String)session.getAttribute("name");
		LoginVO lvo = (LoginVO) request.getSession().getAttribute("ss_member");

		String memberid = lvo.getMemberId();
		System.out.println(memberid);
		ReplyDAO.replyInsert(Integer.parseInt(rvno), memberid, replymsg);
		
		return "redirect:../detail/detail.do?type="+type+"&no="+no;
	}
	
	@RequestMapping("detail/detail__review_reply_update.do")
	public String detail_review__reply_update(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		String rrno=request.getParameter("rrno");
		String replyMsg=request.getParameter("msg");
		
		ReplyDAO.replyUpdate(Integer.parseInt(rrno),replyMsg);
		
		return "redirect:../detail/detail.do?type="+type+"&no="+no;
	}
	
	@RequestMapping("detail/detail__review_reply_reply_insert.do")
	public String detail_review_reply_reply_insert(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		System.out.println("대댓글");
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		System.out.println(no);
		System.out.println(type);
		String rvno=request.getParameter("rvno");
		String pno=request.getParameter("pno");
		String replymsg=request.getParameter("msg");
		LoginVO lvo = (LoginVO) request.getSession().getAttribute("ss_member");
		String memberid = lvo.getMemberId();
		//DAO
		ReplyDAO.replyReplyInsert(Integer.parseInt(rvno),Integer.parseInt(pno),memberid,replymsg);
		
		return "redirect:../detail/detail.do?type="+type+"&no="+no;
	}
	
	@RequestMapping("detail/detail_review_reply_delete.do")
	public String freeboard_reply_delte(HttpServletRequest request, HttpServletResponse response){
		
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		String replyNo = request.getParameter("rrno");
		
		ReplyDAO.replyDelete(Integer.parseInt(replyNo));
		
		return "redirect:../detail/detail.do?type="+type+"&no="+no;
	}
}
