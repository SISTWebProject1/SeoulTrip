package com.sist.detail.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.detail.dao.*;
import com.sist.detail.dao.DetailQnaDAO;
import com.sist.detail.dao.DetailQnaVO;
import com.sist.main.dao.LoginVO;

@Controller
public class DetailQnaModel {
	@RequestMapping("detail/detail_qna.do")
	public String detailQna_list(HttpServletRequest request, HttpServletResponse response){
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		String page=request.getParameter("page");
		
		if(page==null)
			page="1";
		
		int curpage = Integer.parseInt(page);
		int rowSize = 5;
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", start);
		map.put("end",end);
		map.put("no", Integer.parseInt(no));
		map.put("type", Integer.parseInt(type));
		// => DAO 처리
		List<DetailQnaVO> list = DetailQnaDAO.DetailQnaListData(map);
		int totalpage= DetailQnaDAO.DetailQnaTotalPage(map);
		
		request.setAttribute("list", list);
		request.setAttribute("curpage", curpage);
		request.setAttribute("totalpage", totalpage);
		request.setAttribute("type", type);
		request.setAttribute("no", no);
		return  "../detail/detail_qna.jsp";
	}
	
	@RequestMapping("detail/detail_qna_detail.do")
	public String detail_detail(HttpServletRequest request, HttpServletResponse response){
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		LoginVO vo2 = (LoginVO) request.getSession().getAttribute("ss_member");
		String memberid = vo2.getMemberId();
		
		DetailDAO dao = new DetailDAO();
		DetailTourplaceVO tvo = new DetailTourplaceVO();
		DetailRestaurantVO rvo = new DetailRestaurantVO();
		DetailFestivalVO fvo = new DetailFestivalVO();

		double mapx = 0;	
		double mapy = 0;

		String title = "";
		Map typo = new HashMap();
		
		if(Integer.parseInt(type)==1){
			tvo = dao.getTourplaceData(Integer.parseInt(no));
			mapx = tvo.getMapx();
			mapy = tvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			System.out.println("장소 데이터");
			request.setAttribute("info", tvo);
			request.setAttribute("title", tvo.getTname());
			request.setAttribute("category", "명소");
		}else if(Integer.parseInt(type)==2){
			rvo = dao.getRestaurantData(Integer.parseInt(no));
			mapx = rvo.getMapx();
			mapy = rvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			System.out.println("음식 데이터");
			request.setAttribute("info", rvo);
			request.setAttribute("title", rvo.getRname());
			request.setAttribute("category", "음식점");
		}else if(Integer.parseInt(type)==3){
			fvo = dao.getFestivalData(Integer.parseInt(no));
			mapx = fvo.getMapx();
			mapy = fvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			System.out.println("축제데이터");
			request.setAttribute("info", fvo);
			request.setAttribute("title", fvo.getFname());
			request.setAttribute("category", "축제");
		}
	
		System.out.println("질문게시판 작성");
		
		Map map = new HashMap();
		map.put("no", no);
		map.put("type", type);
		
		Map mapXY = new HashMap();
		mapXY.put("mapx", mapx);
		mapXY.put("mapy", mapy);
//		
		List<DetailTourplaceVO> nearT = dao.getNearTourplace(mapXY);
		List<DetailRestaurantVO> nearR = dao.getNearRestaurant(mapXY);
		List<DetailFestivalVO> nearF = dao.getNearFestival(mapXY);
		List<Detail_Review_PhotoVO> imglist = dao.getImageForReview(Integer.parseInt(no));

		request.setAttribute("imglist", imglist);
		request.setAttribute("type", type);
		request.setAttribute("mapx", mapx);
		request.setAttribute("mapy", mapy);
		request.setAttribute("no", no);
		request.setAttribute("nearT", nearT);
		request.setAttribute("nearR", nearR);
		request.setAttribute("nearF", nearF);
		request.setAttribute("memberid", memberid);
		
		
		String seq = request.getParameter("seq");
		Map mapo = new HashMap<>();
		mapo.put("no",no);
		mapo.put("type",type);
		mapo.put("seq", seq);
		
		
		DetailQnaVO vo = DetailQnaDAO.DetailQnaDetailPage(mapo);

		request.setAttribute("vo", vo);
		request.setAttribute("detail_board_jsp","../detail/detail_qna_detail.jsp");
		request.setAttribute("main_jsp", "../detail/detail.jsp");
		return "../main/index.jsp";
	}
	
	@RequestMapping("detail/detail_qna_insert.do")
	public String reply_insert(HttpServletRequest request, HttpServletResponse response){
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		LoginVO vo2 = (LoginVO) request.getSession().getAttribute("ss_member");
		String memberid = vo2.getMemberId();
		
		DetailDAO dao = new DetailDAO();
		DetailTourplaceVO tvo = new DetailTourplaceVO();
		DetailRestaurantVO rvo = new DetailRestaurantVO();
		DetailFestivalVO fvo = new DetailFestivalVO();

		double mapx = 0;	
		double mapy = 0;

		String title = "";
		Map typo = new HashMap();
		
		if(Integer.parseInt(type)==1){
			tvo = dao.getTourplaceData(Integer.parseInt(no));
			mapx = tvo.getMapx();
			mapy = tvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			System.out.println("장소 데이터");
			request.setAttribute("info", tvo);
			request.setAttribute("title", tvo.getTname());
			request.setAttribute("category", "명소");
		}else if(Integer.parseInt(type)==2){
			rvo = dao.getRestaurantData(Integer.parseInt(no));
			mapx = rvo.getMapx();
			mapy = rvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			System.out.println("음식 데이터");
			request.setAttribute("info", rvo);
			request.setAttribute("title", rvo.getRname());
			request.setAttribute("category", "음식점");
		}else if(Integer.parseInt(type)==3){
			fvo = dao.getFestivalData(Integer.parseInt(no));
			mapx = fvo.getMapx();
			mapy = fvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			System.out.println("축제데이터");
			request.setAttribute("info", fvo);
			request.setAttribute("title", fvo.getFname());
			request.setAttribute("category", "축제");
		}
	
		System.out.println("질문게시판 작성");
		
		Map map = new HashMap();
		map.put("no", no);
		map.put("type", type);
		
		Map mapXY = new HashMap();
		mapXY.put("mapx", mapx);
		mapXY.put("mapy", mapy);
//		
		List<DetailTourplaceVO> nearT = dao.getNearTourplace(mapXY);
		List<DetailRestaurantVO> nearR = dao.getNearRestaurant(mapXY);
		List<DetailFestivalVO> nearF = dao.getNearFestival(mapXY);
		List<Detail_Review_PhotoVO> imglist = dao.getImageForReview(Integer.parseInt(no));

		request.setAttribute("imglist", imglist);
		request.setAttribute("type", type);
		request.setAttribute("mapx", mapx);
		request.setAttribute("mapy", mapy);
		request.setAttribute("no", no);
		request.setAttribute("nearT", nearT);
		request.setAttribute("nearR", nearR);
		request.setAttribute("nearF", nearF);
		request.setAttribute("memberid", memberid);
		request.setAttribute("detail_board_jsp","../detail/detail_qna_insert.jsp");
		request.setAttribute("main_jsp", "../detail/detail.jsp");
		return "../main/index.jsp";
	}
	
	@RequestMapping("detail/detail_qna_insert_ok.do")
	public String reply_inser_ok(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");  
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		LoginVO vo2 = (LoginVO) request.getSession().getAttribute("ss_member");
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		String memberid = vo2.getMemberId();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		System.out.println(memberid);
		System.out.println("이 작업 번호는 " + no);
		
		
		DetailQnaVO vo = new DetailQnaVO();
		vo.setMemberid(memberid);
		vo.setTitle(title);
		vo.setContent(content);
		vo.setPwd(Integer.parseInt(pwd));
		vo.setNo(Integer.parseInt(no));
		vo.setType(Integer.parseInt(type));
		
		// DAO로 전송 => DAO에서 오라클로 보내준다.
//		DetailQnaDAO dao = new DetailQnaDAO();
		//insert 요청
		DetailQnaDAO.DetailQnaInsert(vo);
		
		return "redirect:../detail/detail.do?type="+type+"&no="+no;
	}
	

	@RequestMapping("detail/detail_qna_update.do")
	public String detail_update(HttpServletRequest request, HttpServletResponse response){
		String no = request.getParameter("no");
		String type = request.getParameter("type");
		String seq = request.getParameter("seq");
		
		LoginVO vo2 = (LoginVO) request.getSession().getAttribute("ss_member");
		String memberid = vo2.getMemberId();
		
		DetailDAO dao = new DetailDAO();
		DetailTourplaceVO tvo = new DetailTourplaceVO();
		DetailRestaurantVO rvo = new DetailRestaurantVO();
		DetailFestivalVO fvo = new DetailFestivalVO();

		double mapx = 0;	
		double mapy = 0;

		String title = "";
		Map typo = new HashMap();
		
		if(Integer.parseInt(type)==1){
			tvo = dao.getTourplaceData(Integer.parseInt(no));
			mapx = tvo.getMapx();
			mapy = tvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			System.out.println("장소 데이터");
			request.setAttribute("info", tvo);
			request.setAttribute("title", tvo.getTname());
			request.setAttribute("category", "명소");
		}else if(Integer.parseInt(type)==2){
			rvo = dao.getRestaurantData(Integer.parseInt(no));
			mapx = rvo.getMapx();
			mapy = rvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			System.out.println("음식 데이터");
			request.setAttribute("info", rvo);
			request.setAttribute("title", rvo.getRname());
			request.setAttribute("category", "음식점");
		}else if(Integer.parseInt(type)==3){
			fvo = dao.getFestivalData(Integer.parseInt(no));
			mapx = fvo.getMapx();
			mapy = fvo.getMapy();
			typo.put("type", type);
			typo.put("no", no);
			System.out.println("축제데이터");
			request.setAttribute("info", fvo);
			request.setAttribute("title", fvo.getFname());
			request.setAttribute("category", "축제");
		}
	
		System.out.println("질문게시판 작성");
		
		Map map = new HashMap();
		map.put("no", no);
		map.put("type", type);
		
		Map mapXY = new HashMap();
		mapXY.put("mapx", mapx);
		mapXY.put("mapy", mapy);
//		
		List<DetailTourplaceVO> nearT = dao.getNearTourplace(mapXY);
		List<DetailRestaurantVO> nearR = dao.getNearRestaurant(mapXY);
		List<DetailFestivalVO> nearF = dao.getNearFestival(mapXY);
		List<Detail_Review_PhotoVO> imglist = dao.getImageForReview(Integer.parseInt(no));

		request.setAttribute("imglist", imglist);
		request.setAttribute("type", type);
		request.setAttribute("mapx", mapx);
		request.setAttribute("mapy", mapy);
		request.setAttribute("no", no);
		request.setAttribute("nearT", nearT);
		request.setAttribute("nearR", nearR);
		request.setAttribute("nearF", nearF);
		request.setAttribute("memberid", memberid);
		
		
		Map mapo =new HashMap<>();
		mapo.put("no", no);
		mapo.put("type",type);
		mapo.put("seq", seq);
		
		DetailQnaVO vo = DetailQnaDAO.DetailQnaDetailPage(mapo);
		
		request.setAttribute("vo", vo);
		request.setAttribute("detail_board_jsp","../detail/detail_qna_update.jsp");
		request.setAttribute("main_jsp", "../detail/detail.jsp");
		return "../main/index.jsp";
	}
	/*
	@RequestMapping("reply/update_ok.do")
	public String reply_update_ok(HttpServletRequest request, HttpServletResponse response){
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		String no = request.getParameter("no");
		
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
			
		BoardVO vo= ReplyBoardDAO.replyBoardUpdate(Integer.parseInt(no));
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		ReplyBoardDAO.replyUpdate(vo);
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../reply/detail.jsp?"+"no="+no);
		return "../main/main.jsp";
	}*/
/*	
	@RequestMapping("reply/password_check.do")
	public String reply_password_check(HttpServletRequest request,HttpServletResponse response){
		String no =request.getParameter("no");
		String pwd = request.getParameter("pwd");
		System.out.println(no);
		System.out.println(pwd);
		String db_pwd=ReplyBoardDAO.replyGetPassword(Integer.parseInt(no));
		int res=0;
		if(db_pwd.equals(pwd)){
			res=1;
		}else{
			res=0;
		}
		request.setAttribute("result", res);

		return "../reply/password_check.jsp";
	}
	
	@RequestMapping("reply/reply.do")
	public String reply_reply(HttpServletRequest request, HttpServletResponse response){
		String pno = request.getParameter("no");
		request.setAttribute("pno", pno); //답변을 달 상위 글의 번호  (Parent no)
		request.setAttribute("main_jsp", "../reply/reply.jsp");
		return "../main/main.jsp";
	}
// 댓글 등록 #######################################################################################	
	@RequestMapping("reply/reply_ok.do")
	public String reply_reply_ok(HttpServletRequest request, HttpServletResponse response){
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		String name=request.getParameter("name");
		String subject=request.getParameter("subject");
		String content=request.getParameter("content");
		String pwd=request.getParameter("pwd");
		String pno=request.getParameter("pno");
		
		BoardVO vo=new BoardVO();
		vo.setName(name);
		vo.setSubject(subject);
		vo.setContent(content);
		vo.setPwd(pwd);
		
		//DAO 연결
		//DB 연동 pno를 가져오고 DB에 서 데이터한 처리를 하고 vo에 입력된 데이터를 실어준다. 
		ReplyBoardDAO.replyReplyInsert(Integer.parseInt(pno), vo);
// 		reply_list() => 재호출		
		return "redirect:../reply/list.do"; //메소드를 다시 호출 
	}
	
	
//댓글형 게시판 삭제 ###############################################################################	
	@RequestMapping("reply/delete.do")
	public String reply_delete(HttpServletRequest request, HttpServletResponse response){
		String no = request.getParameter("no");
		
		request.setAttribute("no", no);
		request.setAttribute("main_jsp", "../reply/delete.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("reply/delete_ok.do")
	public String reply_delete_ok(HttpServletRequest request, HttpServletResponse response){
		String no = request.getParameter("no");
		String pwd = request.getParameter("pwd");
		
		//DAO 연결
		boolean bCheck = ReplyBoardDAO.replyDelete(Integer.parseInt(no), pwd);
		request.setAttribute("bCheck", bCheck);
		
		//id 와 패스워드에 대한 데이터를 보낸다. 
		return "../reply/delete_ok.jsp";
	}*/
}
