package com.sist.member.model;
import java.io.Reader;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MemberDAO_c {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf = new SqlSessionFactoryBuilder().build(reader);
		} catch (Exception e) {
			System.out.println("MemberDAO_c:static block:");
			e.printStackTrace();
		}
	}
	
   public static List<ZipcodeVO> postfindData(String dong)
   {
	   List<ZipcodeVO> list=new ArrayList<ZipcodeVO>();
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   list=session.selectList("postfindData",dong);
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
	   return list;
   }
   
   public static int idcheckData(String memberid)
   {
	   int count=0;
	   SqlSession session=null;
	   try
	   {
		   // session생성 => Connection객체  memberid
		   session=ssf.openSession();
		   count=session.selectOne("idcheckData", memberid);
		   System.out.println("count="+count);
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
	   return count;
   }
   
   public static void memberInsert(MemberVO_c vo)
   {
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession(true);
		   session.insert("memberInsert", vo);
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
   }
   
   public static MemberVO_c memberLogin(String id,String pwd)
   {
	   MemberVO_c vo=new MemberVO_c();
	   SqlSession session=null;
	   try
	   {
		   session=ssf.openSession();
		   int count=session.selectOne("idCount", id);
		   if(count==0)
		   {
			   vo.setMsg("NOID");
		   }
		   else
		   {
			   MemberVO_c mvo=session.selectOne("getPwd", id);
			   if(pwd.equals(mvo.getPwd()))
			   {
				   vo.setMsg("OK");
				   vo.setName(mvo.getName());
			   }
			   else
			   {
				   vo.setMsg("NOPWD");
			   }
		   }
	   }catch(Exception ex)
	   {
		   System.out.println(ex.getMessage());
	   }
	   finally
	   {
		   if(session!=null)
			   session.close();
	   }
	   return vo;
   }
}















