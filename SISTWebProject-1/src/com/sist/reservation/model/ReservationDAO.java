package com.sist.reservation.model;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


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
	
	public static void bookingInsert(ReservationVO vo)
	{

		SqlSession session=null;
		try
		{						
			session=ssf.openSession(true);
			session.insert("bookingInsert",vo);
		}catch (Exception ex)
		{
			System.out.println(ex.getMessage());			
		}finally
		{
			if(session!=null)
				session.close();
		}		
	
	}
	

}

