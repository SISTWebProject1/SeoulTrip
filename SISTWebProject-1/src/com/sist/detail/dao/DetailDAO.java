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
			list = session.selectList("DetailgetReviewData",map);
			
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
	
	
	// ############################################################################### 질문 게시판 처리 
	
	public static List<DetailQnaVO> detailQnaListData (Map map){
		List<DetailQnaVO> list = new ArrayList<DetailQnaVO>();
		SqlSession session=null;
		try {
			session = ssf.openSession();
			list = session.selectList("detailQnaListData",map);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static void DetailQnaInsert(DetailQnaVO vo){
		SqlSession session=null;
		try {
			session = ssf.openSession(true);
			session.update("DetailQnaInsert",vo);
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
	}
	
	// ############################################################################ 랭킹 계산
	public static DetailRankingTourplaceVO detailRankTourData(int no){
		
		DetailRankingTourplaceVO vo = new DetailRankingTourplaceVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("getRankingTourplace",no);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return vo;
	}
	public static DetailRankingRestaurantVO detailRankResData(int no){
		
		DetailRankingRestaurantVO vo = new DetailRankingRestaurantVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("getRankingRestaurant",no);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return vo;
	}
	public static DetailRankingFestivalVO detailRankFestivalData(int no){
		
		DetailRankingFestivalVO vo = new DetailRankingFestivalVO();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			vo = session.selectOne("getRankingFestival",no);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return vo;
	}
	
	public static int getTotalTourplace(){
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("getTotalTourplace");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return total;
	}
	public static int getTotalRestaurant(){
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("getTotalRestaurant");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return total;
	}
	public static int getTotalFestival(){
		int total = 0;
		SqlSession session = null;
		try {
			session = ssf.openSession();
			total = session.selectOne("getTotalFestival");
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return total;
	}
	
	public static List<DetailReviewCountVO> getReviewCount(Map map){
	
		List<DetailReviewCountVO> list = new ArrayList<DetailReviewCountVO>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("getReviewCountByGrade",map);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return list;
	}
	
	public static List<String> getTourTag(int no){
		List<String> list = new ArrayList<String>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("getTourTag",no);
			
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e.getMessage());
		}finally{
			if(session!=null)
				session.close();
		}
		return list;
	}
	public static List<String> getResTag(int no){
		List<String> list = new ArrayList<String>();
		SqlSession session = null;
		try {
			session = ssf.openSession();
			list = session.selectList("getResTag",no);
			
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
