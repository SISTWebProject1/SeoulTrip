package com.sist.tourplace.model;

import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.main.dao.HashTagVO;
import com.sist.main.dao.HomeItemVO;


public class TourplaceDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			System.out.println("TourplaceDAO:static block:");
			e.printStackTrace();
		}
	}
								
	public static List<TourplaceVO> tourplaceListData(Map map) {
		SqlSession session = null;
		List<TourplaceVO> list = new ArrayList<TourplaceVO>();
		try {
			session = ssf.openSession();
			list = session.selectList("tourplaceListData", map);
			
			for(TourplaceVO tpvo : list) {
				HomeItemVO vo = new HomeItemVO();
				vo.setType(1);
				vo.setNo(tpvo.getNo());
				List<HashTagVO> htlist = session.selectList("getHTListByTypeNo", vo);
				tpvo.setHashtags(htlist.subList(0, 5));
			}
			
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static int tourplaceTotalPage() {
		SqlSession session = null;
		int total = 0;
		try {
			session = ssf.openSession();
			total = session.selectOne("tourplaceTotalPage");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}
	
	public static List<TourplaceTagVO> tourplaceTagListData(Map map){
		SqlSession session = null;
		List<TourplaceTagVO> taglist = new ArrayList<TourplaceTagVO>();
		try{
			session = ssf.openSession();
			taglist = session.selectList("tourplaceTagListData",map);
		}catch(Exception ex){
			
		}finally{
			if (session != null)
				session.close();
		}
		return taglist;
	}
	
	public static List<TourplaceVO> tourplaceTagDetailData(Map map){
		SqlSession session = null;
		List<TourplaceVO> tlist = new ArrayList<TourplaceVO>();
		try{
			session = ssf.openSession();
			tlist = session.selectList("tourplaceTagDetailData",map);
			
			for(TourplaceVO tpvo : tlist) {
				HomeItemVO vo = new HomeItemVO();
				vo.setType(1);
				vo.setNo(tpvo.getNo());
				List<HashTagVO> htlist = session.selectList("getHTListByTypeNo", vo);
				tpvo.setHashtags(htlist.subList(0, 5));
			}
		}catch(Exception ex){
			
		}finally{
			if (session != null)
				session.close();
		}
		return tlist;
	}
	
	public static List<TourplaceVO> tourplaceData(Map map){
		SqlSession session = null;
		List<TourplaceVO> tlist = new ArrayList<TourplaceVO>();
		try{
			session = ssf.openSession();
			tlist = session.selectList("tourplaceData",map);
			
			for(TourplaceVO tpvo : tlist) {
				HomeItemVO vo = new HomeItemVO();
				vo.setType(1);
				vo.setNo(tpvo.getNo());
				List<HashTagVO> htlist = session.selectList("getHTListByTypeNo", vo);
				tpvo.setHashtags(htlist.subList(0, 5));
			}
		}catch(Exception ex){
			
		}finally{
			if (session != null)
				session.close();
		}
		return tlist;
	}
	/*int foodtagcode*/
	public static int tourplaceTagTotalPage() { 
		SqlSession session = null;
		int foodtagtotal = 0;
		
		try {
			session = ssf.openSession();
			foodtagtotal = session.selectOne("tourplaceTagTotalPage"); /*,foodtagtotalcode*/
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return foodtagtotal;                                                                                                                                                                                                                                                                                                                            
	}
	
	public static TourplaceTagVO getTourtagVO(int tagcode) {
		SqlSession ss = null;
		TourplaceTagVO vo = new TourplaceTagVO();
		
		try {
			ss = ssf.openSession();
			vo = ss.selectOne("getTourtagVO", tagcode);
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(ss!=null) ss.close();
		}
		
		return vo;
	}
	
}
	
