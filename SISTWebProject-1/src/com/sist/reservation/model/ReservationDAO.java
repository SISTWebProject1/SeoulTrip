package com.sist.reservation.model;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import java.util.*;

public class ReservationDAO {

	private static SqlSessionFactory ssf;
	static
	{
		try{
			//XML
			Reader reader=Resources.getResourceAsReader("Config.xml");
			ssf=new SqlSessionFactoryBuilder().build(reader);
			
		}catch (Exception ex) {
			System.out.println(ex.getMessage());
		}
	}


	public static RestaurantVO restaurantData(int no)
	{
		RestaurantVO vo=new RestaurantVO();
		SqlSession session=null;
		try{
			session=ssf.openSession();
			vo=session.selectOne("restaurantData",no);
		
		} catch(Exception e)
		{
			System.out.println(e.getMessage()); 
		}finally	
		{
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	

	
	public static void bookingInfoInsert(ReservationVO vo)
	{

		SqlSession session=null;
		try
		{						
			session=ssf.openSession(true);
			session.insert("bookingInfoInsert",vo);
		}catch (Exception ex)
		{
			System.out.println(ex.getMessage());			
		}finally
		{
			if(session!=null)
				session.close();
		}		
	
	}
	
	public static TagVO	recommendTag(int no)
	{
		TagVO tvo=new TagVO();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			tvo=session.selectOne("recommendTag",no);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			if(session!=null)
				session.close();
		}
		return tvo;
	}
	
	public static List<RestaurantVO> getrestInfoTag(int tagcode)
	{
		List<RestaurantVO> list=new ArrayList<RestaurantVO>();
		SqlSession session=null;
		try {
			session=ssf.openSession();
			list=session.selectList("getrestInfoTag",tagcode);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(session!=null)
				session.close();
		}
		return list;
	}

}

