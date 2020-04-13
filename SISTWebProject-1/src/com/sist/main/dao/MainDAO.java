package com.sist.main.dao;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MainDAO {
	
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			System.out.println("MainDAO:static block:");
			e.printStackTrace();
		}
	}
	
	public static LoginVO getLoginInfo(String memberId, String pwd) {
		LoginVO vo = new LoginVO();
		try {
			SqlSession session = ssf.openSession();
			vo = session.selectOne("getLoginInfo", memberId);
			session.close();
			if(vo.getPwd().equals(pwd)) {
				vo.setState("SUCCESS");
				return vo;
			} else {
				vo.setState("NOPWD");
				return vo;
			}
		} catch (Exception e) {
			LoginVO lvo = new LoginVO();
			lvo.setState("NOID");
			return lvo;
		}
	}

}
