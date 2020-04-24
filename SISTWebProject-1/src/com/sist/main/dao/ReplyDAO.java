package com.sist.main.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class ReplyDAO {
	
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			System.out.println("MainDAO:static block:");
			e.printStackTrace();
		}
	}
	
	public static void replyDelete(int replyNo) {
		SqlSession ss = null;
		
		try {
			ss = ssf.openSession();
			Map map = new HashMap();
			map.put("pNo", replyNo);
			ss.update("reviewReplyDelete", map);
			
		} catch (Exception e) {
			System.out.println("ReplyDAO:replyDelete():");
			e.printStackTrace();
		} finally {
			if(ss!=null) ss.close();
		}
	}
	
	public static void replyInsert(int reviewNo, String memberId, String replyMsg) {
		SqlSession ss = null;
		
		try {
			ss = ssf.openSession();
			Map map = new HashMap();
			map.put("pRvno", reviewNo);
			map.put("pId", memberId);
			map.put("pMsg", replyMsg);
			ss.update("reviewReplyInsert", map);
			
		} catch (Exception e) {
			System.out.println("ReplyDAO:replyInsert():");
			e.printStackTrace();
		} finally {
			if(ss!=null) ss.close();
		}
	}
	
	public static List<ReviewReplyVO> replyListData(int reviewNo, int page) {
		SqlSession ss = null;
		List<ReviewReplyVO> list = new ArrayList<ReviewReplyVO>();
		
		int pEnd = page * 5;
		int pStart = pEnd - 4;
		
		try {
			ss = ssf.openSession();
			Map map = new HashMap();
			map.put("pStart", pStart);
			map.put("pEnd", pEnd);
			map.put("pRvno", reviewNo);
			ss.update("reviewReplyListData", map);
			list = (ArrayList<ReviewReplyVO>) map.get("pResult");
			
		} catch (Exception e) {
			System.out.println("ReplyDAO:#():");
			e.printStackTrace();
		} finally {
			if(ss!=null) ss.close();
		}
		
		return list;
	}
	
	public static void replyReplyInsert(int reviewNo, int parentReplyNo, String memberId, String replyMsg) {
		SqlSession ss = null;
		
		try {
			ss = ssf.openSession();
			Map map = new HashMap();
			map.put("pRvno", reviewNo);
			map.put("pPno", parentReplyNo);
			map.put("pId", memberId);
			map.put("pMsg", replyMsg);
			ss.update("reviewReplyReplyInsert", map);
			
		} catch (Exception e) {
			System.out.println("ReplyDAO:reviewReplyReplyInsert():");
			e.printStackTrace();
		} finally {
			if(ss!=null) ss.close();
		}
	}
	
	public static int replyTotalPage(int reviewNo) {
		SqlSession ss = null;
		int total = 0;
		
		try {
			ss = ssf.openSession();
			Map map = new HashMap();
			map.put("pRvno", reviewNo);
			ss.update("reviewReplyTotalPage", map);
			total = (int) map.get("pTotal");
			
		} catch (Exception e) {
			System.out.println("ReplyDAO:replyTotalPage():");
			e.printStackTrace();
		} finally {
			if(ss!=null) ss.close();
		}
		
		return total;
	}
	
	public static void form(int pNo) {
		SqlSession ss = null;
		
		try {
			ss = ssf.openSession();
			Map map = new HashMap();
			
			ss.update("#", map);
			
		} catch (Exception e) {
			System.out.println("ReplyDAO:#():");
			e.printStackTrace();
		} finally {
			if(ss!=null) ss.close();
		}
	}

}
