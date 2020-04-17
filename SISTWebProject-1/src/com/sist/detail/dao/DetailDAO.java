package com.sist.detail.dao;

import java.io.Reader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;




public class DetailDAO {
	private static SqlSessionFactory ssf;
	static {
		try {
			Reader reader = Resources.getResourceAsReader("Config.xml");
			ssf= new SqlSessionFactoryBuilder().build(reader);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}
	}
	// type 별로 장소 세부 데이터 가져오기 
	public DetailTourplaceVO getTourplaceData(int no){
		DetailTourplaceVO vo = new DetailTourplaceVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("getTourplaceData",no);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return vo;
	}
	

	public DetailRestaurantVO getRestaurantData(int no){
		DetailRestaurantVO vo = new DetailRestaurantVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("getRestaurantData",no);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	public DetailFestivalVO getFestivalData(int no){
		DetailFestivalVO vo = new DetailFestivalVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("getFestivalData",no);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	
	
	public static int getTotalReview(Map map){
		SqlSession session = null;
		int total = 0;
		try {
			session = ssf.openSession();
			total = session.selectOne("getTotalReview",map);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return total;
	}
	
	
	public List<DetailReviewVO> getReviewData(Map map){
		List<DetailReviewVO> list = new ArrayList<DetailReviewVO>();
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
	public List<Detail_Review_PhotoVO> getImageForReview(int no){
		List<Detail_Review_PhotoVO> list = new ArrayList<Detail_Review_PhotoVO>();
		SqlSession session=null;
		try {
			session = ssf.openSession();
			list = session.selectList("getImagesForReview",no);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return list;
		
		
	}
	
	
	
	//*######################################################################################## 근처 이미지 출력 테스트중
	public String getImageFilepath (int no){
		SqlSession session = null;
		String filepath ="";
		try {
			session = ssf.openSession();
			filepath = session.selectOne("getImageFilepath", no);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return filepath;
	}
	
	public static List<DetailReviewVO> getImageFile(){
		SqlSession session=ssf.openSession();
		List<DetailReviewVO> list = session.selectList("getImageFile");
		session.close();
		return list;
	}
	
	//X,Y 좌표값 구해오기
	public static DetailTourplaceVO getXYcoordinate(int no){
		DetailTourplaceVO vo = new DetailTourplaceVO();
		
		SqlSession session = null;

		try {
			session = ssf.openSession();
			vo = session.selectOne("getXYcoordinate",no);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return vo;
		
	}
	
	public static List<DetailTourplaceVO> getNearTourplace(Map map){
		List<DetailTourplaceVO> list = new ArrayList<DetailTourplaceVO>();
		SqlSession session=null;
		try {
			session = ssf.openSession();
			list = session.selectList("getNearTourplace",map);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static List<DetailRestaurantVO> getNearRestaurant(Map map){
		List<DetailRestaurantVO> list = new ArrayList<DetailRestaurantVO>();
		SqlSession session=null;
		try {
			session = ssf.openSession();
			list = session.selectList("getNearRestaurant",map);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	
	public static List<DetailFestivalVO> getNearFestival(Map map){
		List<DetailFestivalVO> list = new ArrayList<DetailFestivalVO>();
		SqlSession session=null;
		try {
			session = ssf.openSession();
			list = session.selectList("getNearFestival",map);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return list;
	}
	
}
