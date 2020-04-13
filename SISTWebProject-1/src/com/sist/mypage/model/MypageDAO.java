package com.sist.mypage.model;


import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MypageDAO {

	private static SqlSessionFactory ssf;
	static{
		try{
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		}catch(Exception ex){
			System.out.println("");
			ex.printStackTrace();
		}
		
	}

	
	public static String sss(){
		SqlSession session = null;
		try{
			session = ssf.openSession();
		}catch(Exception ex){
			ex.printStackTrace();
		}
		return "";
	}
}
