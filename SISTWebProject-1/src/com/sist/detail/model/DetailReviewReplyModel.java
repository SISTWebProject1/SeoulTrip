package com.sist.detail.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
}
