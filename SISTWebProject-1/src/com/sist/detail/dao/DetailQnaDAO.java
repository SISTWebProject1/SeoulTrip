package com.sist.detail.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class DetailQnaDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf= new SqlSessionFactoryBuilder().build(reader);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	
	public static List<DetailQnaVO> DetailQnaListData(Map<?, ?> map){
		List<DetailQnaVO> list = new ArrayList<DetailQnaVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("DetailQnaListData",map);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static int DetailQnaTotalPage(Map map){
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("DetailQnaTotalPage",map);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return total;
	}

	public static DetailQnaVO DetailQnaDetailPage(Map map){
		DetailQnaVO vo = new DetailQnaVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			session.update("DetailQnaIncrement",map);
			session.commit();
			vo = session.selectOne("DetailQnaDetailPage",map);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	public static void DetailQnaInsert(DetailQnaVO vo){

		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.insert("DetailQnaInsert",vo);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
	}
	
	public static void DetailQnaUpdate(DetailQnaVO vo){
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			session.update("DetailQnaUpdate",vo);

		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
			session.close();
		}
	}
	
	
	
	public static DetailQnaVO DetailQnaBoardUpdate(Map map)
	{
		DetailQnaVO vo = new DetailQnaVO();
		SqlSession session = null;
		try {	
			session = ssf.openSession();
			vo = session.selectOne("DetailQnaDetailPage",map);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	// 비밀번호 가져오기
	public static String DetailQnaGetPassword(Map map){
		String pwd="";
		SqlSession session = null;
		try {
			session = ssf.openSession(true);
			pwd = session.selectOne("DetailQnaGetPassword",map);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
			session.close();
		}
		return pwd;
	}
		
	// 답변형 게시판 댓글 추가 , 4개의 SQL문을 실행하여 결과값을 가져온다.
	public static void DetailQnaReplyInsert(int pseq,int no, int type, Map map, DetailQnaVO vo){
		SqlSession session=null;
		
		try {
			session=ssf.openSession();
		
			DetailQnaVO pvo = session.selectOne("DetailQnaParentInfoData",map);
			pvo.setNo(no);
			pvo.setType(type);
			
			session.update("DetailQnaGroupStepIncrement",pvo);
						
			//replyReplyInsert , 들어온 PVO에서 읽어온 값에서 
			vo.setGroup_id(pvo.getGroup_id());
			vo.setGroup_step(pvo.getGroup_step()+1);
			vo.setGroup_tab(pvo.getGroup_tab()+1);
			vo.setRoot(pseq);
			
			
			session.insert("DetailQnaReplyInsert",vo);
			session.update("DetailQnaDepthIncrement",map);
			
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			session.rollback();
		}finally{
			if(session!=null)
				session.close();
		}
	}
	
	// 답글현 게시판 댓글 삭제, 비번 확인 부터 ==> 처리 
	public static boolean DetailQnaDelete(int seq,int no, int type,  Map map, String pwd){
		
		boolean bCheck=false;
		SqlSession session = null;
		
		try {
			session=ssf.openSession();
			String db_pwd = session.selectOne("DetailQnaGetPassword",map);
			if(db_pwd.equals(pwd)){
				bCheck=true;
				DetailQnaVO vo = session.selectOne("DetailQnaDeleteInfoData", map);
				if(vo.getDepth()==0){
					session.selectOne("DetailQnaDelete",map);
				}else{
					vo.setTitle("관리자가 삭제한 게시물 입니다");
					vo.setContent("관리자가 삭제한 게시물 입니다 ");
					vo.setSeq(seq); //해당 게시물 번호 (mybatix 세팅에서 vo를 받게 되어 있다)
					vo.setNo(no);
					vo.setType(type);
					session.selectOne("DetailQnaTitleUpdate",vo);
				}
				session.update("DetailQnaDepthDecrement",vo.getRoot());
			}else{
				bCheck=false;
			
			}
			session.commit();
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			session.rollback();
		}finally{
			if(session!=null)
				session.close();
		}
		
		return bCheck;
	}
}
