package com.sist.home.model;

import java.io.Reader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class FestivalDAO {
	
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			System.out.println("FestivalDAO:static block:");
			e.printStackTrace();
		}
	}
	
	public static List<FestivalVO> festivalAllList(){
		SqlSession ss = null;
		List<FestivalVO> list = new ArrayList<FestivalVO>();
		
		try {
			ss = ssf.openSession();
			list = ss.selectList("festivalAllList");
		} catch (Exception e) {
			System.out.println("FestivalDAO:festivalAllList():");
			e.printStackTrace();
		} finally {
			if(ss!=null) ss.close();
		}
		
		return list;
	}
	
	public static List<FestivalVO> festivalDateList(Date date) {
		SqlSession ss = null;
		List<FestivalVO> list = new ArrayList<>();
		
		try {
			ss = ssf.openSession();
			list = ss.selectList("festivalDateList", date);
		} catch (Exception e) {
			System.out.println("FestivalDAO:festivalDateList():");
			e.printStackTrace();
		} finally {
			if(ss!=null) ss.close();
		}
		
		return list;
	}

}






































