package jhs.vo.src.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jhs.vo.src.vo.ReviewRawDataVO;

public class ReviewRawDataDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";

	public ReviewRawDataDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.print("ReviewRawDataDAO():");
			e.printStackTrace();
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "hr", "happy");
		} catch (Exception e) {
			System.out.print("ReviewRawDataDAO:getConnection():");
			e.printStackTrace();
		}
	}

	public void disConnection() {
		try {
			if (ps != null)
				ps.close();
			if (conn != null)
				conn.close();
		} catch (Exception e) {
			System.out.print("ReviewRawDataDAO:disConnection():");
			e.printStackTrace();
		}
	}
	
	public void rvRDInsert(ReviewRawDataVO vo) {
		try {
			getConnection();
			String sql ="INSERT INTO ReviewRawData VALUES("
						+ "(SELECT NVL(MAX(rvNo)+1,1) FROM ReviewRawData),?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, vo.getLocNo());
			ps.setString(2, vo.getUsrId());
			ps.setString(3, vo.getRegDate());
			ps.setInt(4, vo.getScore());
			ps.setString(5, vo.getTitle());
			ps.setString(6, vo.getContent());
			ps.setString(7, vo.getExpDate());
			
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("rvRDInsert():");
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}
	
	public int getRvNoByContent(String content) {
		int rvNo = 0;
		try {
			getConnection();
			String sql = "SELECT rvNo FROM ReviewRawData WHERE content = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, content);
			ResultSet rs = ps.executeQuery();
			rs.next();
			rvNo = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			System.out.println("rvNoByContent():");
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return rvNo;
	}

}
