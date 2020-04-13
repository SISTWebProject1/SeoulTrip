package com.sist.reservation.model;
/*
BOOKINGNUMBER   NOT NULL NUMBER         
MEMBERID        NOT NULL VARCHAR2(4000) 
NO              NOT NULL NUMBER         
RESERVATIONDATE          DATE           
TIME                     DATE           
INWON                    NUMBER    
 */
public class ReservationVO {

	private int bookingnumber;
	private String memberid;
	private int no;
	private String reservationdate;
	private String time;
	private int inwon;
	public int getBookingnumber() {
		return bookingnumber;
	}
	public void setBookingnumber(int bookingnumber) {
		this.bookingnumber = bookingnumber;
	}
	public String getMemberid() {
		return memberid;
	}
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getReservationdate() {
		return reservationdate;
	}
	public void setReservationdate(String reservationdate) {
		this.reservationdate = reservationdate;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public int getInwon() {
		return inwon;
	}
	public void setInwon(int inwon) {
		this.inwon = inwon;
	}
	
	
}
