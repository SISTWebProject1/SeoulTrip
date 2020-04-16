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

	
	public static RestaurantVO reservationListData(int no)
	{
		RestaurantVO vo=new RestaurantVO();
		SqlSession session=null;
		try{
			session=ssf.openSession();
			vo=session.selectOne("reservationListData",no);
		
		} catch(Exception e)
		{
			System.out.println("reservation: "+e.getMessage());
		}finally
		{
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	public static String getPhoto(int reviewno)
	{
		String filepath="";
		SqlSession session=null;
		try{
			session=ssf.openSession();
			filepath=session.selectOne("getPhoto",reviewno);
		
		} catch(Exception e)
		{
			System.out.println(e.getMessage());
		}finally
		{
			if(session!=null)
				session.close();
		}
		return filepath;
	}
	
	public static void bookingInsert(ReservationVO vo)
	{

		SqlSession session=null;
		try
		{							// insert 여기 autocommit안되니까 t
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

