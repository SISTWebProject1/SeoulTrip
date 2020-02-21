package jhs.vo.src.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jhs.vo.src.vo.LocationRawDataVO;

public class LocationRawDataDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private final String URL = "jdbc:oracle:thin:@localhost:1521:XE";

	public LocationRawDataDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			System.out.print("LocationRawDataDAO():");
			e.printStackTrace();
		}
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(URL, "hr", "happy");
		} catch (Exception e) {
			System.out.print("LocationRawDataDAO:getConnection():");
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
			System.out.print("LocationRawDataDAO:disConnection():");
			e.printStackTrace();
		}
	}
	
	public void locRDInsert(LocationRawDataVO vo) {
		try {
			getConnection();
			String sql ="INSERT INTO LocationRawData VALUES("
						+ "(SELECT NVL(MAX(locNo)+1,1) FROM LocationRawData),?,?,?,?,?,?,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, vo.getLocName());
			ps.setString(2, vo.getTags());
			ps.setString(3, vo.getAddress());
			ps.setString(4, vo.getOpenHour());
			ps.setString(5, vo.getWebsite());
			ps.setString(6, vo.getPhoneNumber());
			ps.setDouble(7, vo.getLat());
			ps.setDouble(8, vo.getLng());
			
			ps.executeUpdate();
		} catch (Exception e) {
			System.out.println("locRDInsert():");
			e.printStackTrace();
		} finally {
			disConnection();
		}
	}
	
	public int getLocNoByName(String locName) {
		int locNo = 0;
		try {
			getConnection();
			String sql = "SELECT locNo FROM LocationRawData WHERE locName = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, locName);
			ResultSet rs = ps.executeQuery();
			rs.next();
			locNo = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			System.out.println("locNoByName():");
			e.printStackTrace();
		} finally {
			disConnection();
		}
		return locNo;
	}

}
