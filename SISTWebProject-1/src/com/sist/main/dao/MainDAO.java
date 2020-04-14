package com.sist.main.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
	
	public static void addItemToCookies(HttpServletRequest request, HttpServletResponse response, int type, int no) {
		List<String> slowdownCookies = new ArrayList<String>();
		
		Cookie[] cookies = request.getCookies();
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().startsWith("slowdown")) {
				slowdownCookies.add(cookies[i].getName());
			}
		}
		
		if(slowdownCookies.size()==0) {
			String cookie = "slowdown"+"0"+"#"+type+"_"+no;
			Cookie addCookie = new Cookie(cookie, "");
			addCookie.setMaxAge(60*60*24);
			response.addCookie(addCookie);
		} else {
			Collections.sort(slowdownCookies);
			String lastCookie = slowdownCookies.get(slowdownCookies.size()-1);
			int lastIdx = Integer.parseInt(lastCookie.substring(8, lastCookie.indexOf("#")));
			
			String cookie = "slowdown"+lastIdx+"#"+type+"_"+no;
			Cookie addCookie = new Cookie(cookie, "");
			addCookie.setMaxAge(60*60*24);
			response.addCookie(addCookie);
		}		
	}
	
	public static List<HomeItemVO> getHIListFromCookies(HttpServletRequest request) {
		List<HomeItemVO> list = new ArrayList<HomeItemVO>();
		
		List<String> slowdownCookies = new ArrayList<String>();
		Cookie[] cookies = request.getCookies();
		if(cookies==null) return list;
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().startsWith("slowdown")) {
				slowdownCookies.add(cookies[i].getName());
			}
		}
		Collections.sort(slowdownCookies);
		
		for(int i=0; i<Math.min(slowdownCookies.size(), 4); i++) {
			String cookie = slowdownCookies.remove(slowdownCookies.size()-1);
			String[] type_no = cookie.substring(cookie.indexOf("#")+1).split("_");
			String type = type_no[0];
			String no = type_no[1];
			
			String table;
			String name;
			String photo;
			switch (type) {
				case "1" : {
					table = "tourplace";
					name = "tname";
					photo = "tphoto";
					break;
				}
				case "2" : {
					table = "restaurant";
					name = "rname";
					photo = "rphoto";
					break;
				}
				default : {
					table = "festival";
					name = "fname";
					photo = "fphoto";
					break;
				}
			}
			
			Map map = new HashMap();
			map.put("table", table);
			map.put("no", no);
			map.put("name", name);
			map.put("photo", photo);
			
			try {
				SqlSession session = ssf.openSession();
				HomeItemVO hivo = session.selectOne("getHomeItemFromCookie", map);
				hivo.setType(Integer.parseInt(type));
				list.add(hivo);
				session.close();
			} catch (Exception e) {
				System.out.println("MainDAO:getHIListFromCookies():");
				e.printStackTrace();
			}
		}
		
		return list;
	}
	
	public static List<HomeItemVO> getSearchData(int type, String keyword) {
		List<HomeItemVO> list = new ArrayList<HomeItemVO>();
		
		String table;
		String name;
		String photo;
		switch (type) {
			case 1 : {
				table = "tourplace";
				name = "tname";
				photo = "tphoto";
				break;
			}
			case 2 : {
				table = "restaurant";
				name = "rname";
				photo = "rphoto";
				break;
			}
			default : {
				table = "festival";
				name = "fname";
				photo = "fphoto";
				break;
			}
		}
		
		Map map = new HashMap();
		map.put("table", table);
		map.put("name", name);
		map.put("photo", photo);
		map.put("keyword", keyword);
		
		try {
			SqlSession session = ssf.openSession();
			list = session.selectList("getSearchData", map);
			session.close();
		} catch (Exception e) {
			System.out.println("MainDAO:getSearchData():");
			e.printStackTrace();
		}
		
		return list;
	}

}





































