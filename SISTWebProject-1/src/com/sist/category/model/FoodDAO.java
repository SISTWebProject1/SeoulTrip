package com.sist.category.model;

import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class FoodDAO {
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
								
	public static List<FoodVO> foodListData(Map map) {
		SqlSession session = null;
		List<FoodVO> list = new ArrayList<FoodVO>();
		try {
			session = ssf.openSession();
			list = session.selectList("foodListData", map);
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return list;
	}

	public static int foodTotalPage() {
		SqlSession session = null;
		int total = 0;
		try {
			session = ssf.openSession();
			total = session.selectOne("foodTotalPage");
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return total;
	}
	
	public static List<FoodTagVO> foodTagListData(Map map){
		SqlSession session = null;
		List<FoodTagVO> taglist = new ArrayList<FoodTagVO>();
		try{
			session = ssf.openSession();
			taglist = session.selectList("foodTagListData",map);
		}catch(Exception ex){
			
		}finally{
			if (session != null)
				session.close();
		}
		return taglist;
	}
	
	public static List<FoodTagDetailVO> foodTagDetailData(Map map){
		SqlSession session = null;
		List<FoodTagDetailVO> tlist = new ArrayList<FoodTagDetailVO>();
		try{
			session = ssf.openSession();
			tlist = session.selectList("foodTagDetailData",map);
		}catch(Exception ex){
			
		}finally{
			if (session != null)
				session.close();
		}
		return tlist;
	}
	
	public static List<FoodTagDetailVO> foodData(Map map){
		SqlSession session = null;
		List<FoodTagDetailVO> tlist = new ArrayList<FoodTagDetailVO>();
		try{
			session = ssf.openSession();
			tlist = session.selectList("foodData",map);
		}catch(Exception ex){
			
		}finally{
			if (session != null)
				session.close();
		}
		return tlist;
	}
	/*int foodtagcode*/
	public static int foodTagTotalPage() { 
		SqlSession session = null;
		int foodtagtotal = 0;
		
		try {
			session = ssf.openSession();
			foodtagtotal = session.selectOne("foodTagTotalPage"); /*,foodtagtotalcode*/
		} catch (Exception ex) {
			System.out.println(ex.getMessage());
		} finally {
			if (session != null)
				session.close();
		}
		return foodtagtotal;                                                                                                                                                                                                                                                                                                                            
	}
}
	
