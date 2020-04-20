package com.sist.reservation.model;

import java.io.Reader;
import java.util.*;

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


	public static RestaurantVO_r reservationListData(int no)
	{
		RestaurantVO_r vo=new RestaurantVO_r();
		SqlSession session=null;
		try{
			session=ssf.openSession();
			vo=session.selectOne("reservationListData",no);
		
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

