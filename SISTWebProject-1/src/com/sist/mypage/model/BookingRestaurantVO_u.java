package com.sist.mypage.model;

import com.sist.reservation.model.RestaurantVO;

public class BookingRestaurantVO_u {
/*
 BOOKINGNUMBER
MEMBERID
NO
RESERVATIONDATE
TIME
INWON
NAME
EMAIL
TEL
 */
	private int bookingnumber;
	private String memberId;
	private int no;
	private String reservationDate;
	private String time;
	private int inwon;
	private String name;
	private String email;
	private String tel;

	private String rname_reservation;
	private String rphoto_reservation;
	private int price_reservation;
	private String grade;
	
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getBookingnumber() {
		return bookingnumber;
	}
	public void setBookingnumber(int bookingnumber) {
		this.bookingnumber = bookingnumber;
	}
	public int getPrice_reservation() {
		return price_reservation;
	}
	public void setPrice_reservation(int price_reservation) {
		this.price_reservation = price_reservation;
	}
	public String getRname_reservation() {
		return rname_reservation;
	}
	public void setRname_reservation(String rname_reservation) {
		this.rname_reservation = rname_reservation;
	}
	public String getRphoto_reservation() {
		return rphoto_reservation;
	}
	public void setRphoto_reservation(String rphoto_reservation) {
		this.rphoto_reservation = rphoto_reservation;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getReservationDate() {
		return reservationDate;
	}
	public void setReservationDate(String reservationDate) {
		this.reservationDate = reservationDate;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
}
