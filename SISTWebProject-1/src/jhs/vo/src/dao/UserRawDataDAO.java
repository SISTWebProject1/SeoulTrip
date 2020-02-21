package jhs.vo.src.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jhs.vo.src.vo.UserRawDataVO;

public class UserRawDataDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";

	public UserRawDataDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.print("UserRawDataDAO():");
			e.printStackTrace();
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "hr", "happy");
		} catch (Exception e) {
			System.out.print("UserRawDataDAO:getConnection():");
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
			System.out.print("UserRawDataDAO:disConnection():");
			e.printStackTrace();
		}
	}
	
	public void usrRDInsert(UserRawDataVO vo) {
		try {
			getConnection();
			String sql ="INSERT INTO UserRawData VALUES(?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getUsrId());
			ps.setString(2, vo.getUsrName());
			ps.setString(3, vo.getPfPic());
			ps.setString(4, vo.getLocal());
			ps.setString(5, vo.getRegDate());
			
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("usrRDInsert():");
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}
	
	public boolean hasUsrID(String usrId) {
		boolean bCheck = true;
		try {
			getConnection();
			String sql = "SELECT COUNT(*) FROM UserRawData WHERE usrId = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, usrId);
			ResultSet rs = ps.executeQuery();
			rs.next();
			if(rs.getInt(1)==0) bCheck = false;
			rs.close();
		} catch (Exception e) {
			System.out.println("hasUserID():");
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return bCheck;
	}

}
