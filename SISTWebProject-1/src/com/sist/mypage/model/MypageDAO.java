package com.sist.mypage.model;


import java.io.Reader;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.detail.dao.DetailReviewVO;
import com.sist.detail.dao.Detail_Review_PhotoVO;
import com.sist.reservation.model.ReservationVO;
import com.sist.reservation.model.RestaurantVO;

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

	
	public static MemberVO_u PassWord_check(String id){
		SqlSession session =null;
		MemberVO_u vo = new MemberVO_u();
		try{
			session = ssf.openSession();
			vo = session.selectOne("passwordCheck",id);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	public static void Update_ok(MemberVO_u vo){
		SqlSession session = null;
		try{
			session = ssf.openSession(true);
			session.update("update_profile",vo);
			
		}catch(Exception ex){
			ex.printStackTrace();
		}finally{
			if(session!=null)
				session.close();
		}
		
	}
	public static List<ReviewVO_u> ReviewData(Map map){
		SqlSession session =null;
		List<ReviewVO_u> list = new ArrayList<ReviewVO_u>();
		try{
			session = ssf.openSession();
			list = session.selectList("reivewData",map);
		}catch(Exception ex){
			ex.getMessage();
			ex.printStackTrace();
		}finally{
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static int ReviewCount(String id){
		SqlSession session =null;
		int count = 0;
		try{
			session = ssf.openSession();
			count = session.selectOne("reviewCount",id);
		}catch(Exception ex){
			ex.getMessage();
			ex.printStackTrace();
		}finally{
			if(session!=null)
				session.close();
		}
		return count;
	}
	public static List<WishListVO_u> wishlistData(String id){
		SqlSession session =null;
		List<WishListVO_u> list = new ArrayList<WishListVO_u>();
		try{
			session = ssf.openSession();
			list = session.selectList("wishtList",id);
			
			System.out.println(list.size());
			int no =0;
			String photo=" ";
			for(WishListVO_u vo : list){
				no = vo.getNo();
				System.out.println(no);
				photo=session.selectOne("mypage_getimage",no);
				
				System.out.println("photo : "+photo);
				vo.setWish_photo(photo);
			}
			
		}catch(Exception ex){
			ex.getMessage();
			ex.printStackTrace();
		}finally{
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	
	
	public static List<ReviewVO_u> getReviewData(Map map){
		List<ReviewVO_u> list = new ArrayList<ReviewVO_u>();
		SqlSession session = null;
		
		try {
			session = ssf.openSession();
			list = session.selectList("getReviewData",map);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return list;
	}
	//리뷰별 이미지 출력
	public static List<ReviewVO_u> getImageForReview(List<ReviewVO_u> list, int[] reviewNo){	
		SqlSession session=null;
		
		try {
			session = ssf.openSession();
			
			String filepath=" ";
			String temp ="";
			for(int i=0; i<reviewNo.length; i++){
				filepath = session.selectOne("getReviewData_image_profile",reviewNo[i]);
				temp = temp+filepath+"@";
			}
			String[] filepath_temp = temp.split("@");
			System.out.println(filepath_temp.length);
			for(String te : filepath_temp){
				System.out.println(te);
			}
			int i =0;
			for(ReviewVO_u vo1 : list){
				vo1.setFilepath(filepath_temp[i]);
				i++;
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return list;
		
		
	}
	
	
	
	public static List<BookingRestaurantVO_u> BookingListData(String id){
		List<BookingRestaurantVO_u> Booking_list = new ArrayList<BookingRestaurantVO_u>();
		SqlSession session = null;
		String grade ="";
		try {
			session = ssf.openSession();
			Booking_list = session.selectList("BookingListData",id);
			for(BookingRestaurantVO_u bvo : Booking_list){
				RestaurantVO rvo = new RestaurantVO();
				rvo = session.selectOne("restaurant_reservation_Data",bvo.getNo());
				bvo.setRname_reservation(rvo.getRname());
				bvo.setRphoto_reservation(rvo.getRphoto());
				grade = session.selectOne("restaurant_review_score",bvo.getNo());
				bvo.setGrade(grade);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
			e.printStackTrace();
		}finally{
			if(session!=null)
				session.close();
		}
		return Booking_list;
	}
}
