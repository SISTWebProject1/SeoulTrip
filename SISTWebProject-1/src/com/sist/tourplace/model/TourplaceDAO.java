package com.sist.tourplace.model;

import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class TourplaceDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			System.out.println("FoodDAO:static block:");
			e.printStackTrace();
		}
	}
								
	public static List<TourplaceVO> tourplaceListData(Map map) {
		SqlSession session = null;
		List<TourplaceVO> list = new ArrayList<TourplaceVO>();
		try {
			session = ssf.openSession();
			list = session.selectList("tourplaceListData", map);
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
	
	public static List<TourplaceTagDetailVO> tourplaceTagDetailData(Map map){
		SqlSession session = null;
		List<TourplaceTagDetailVO> tlist = new ArrayList<TourplaceTagDetailVO>();
		try{
			session = ssf.openSession();
			tlist = session.selectList("tourplaceTagDetailData",map);
		}catch(Exception ex){
			
		}finally{
			if (session != null)
				session.close();
		}
		return tlist;
	}
	
	public static List<TourplaceTagDetailVO> tourplaceData(Map map){
		SqlSession session = null;
		List<TourplaceTagDetailVO> tlist = new ArrayList<TourplaceTagDetailVO>();
		try{
			session = ssf.openSession();
			tlist = session.selectList("tourplaceData",map);
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
}
	
