package com.sist.home.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class FestivalVO {

	private int no;
	private String fname;
	private Date startdate;
	private Date enddate;
	private String info;
	private double mapy;
	private double mapx;
	private String addr1;
	private String addr2;
	private double grade;
	private String fphoto;
	private boolean wish;

	public String getFmtStart() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

		return sdf.format(startdate);
	}

	public String getFmtEnd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

		return sdf.format(enddate);
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public Date getStartdate() {
		return startdate;
	}

	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}

	public Date getEnddate() {
		return enddate;
	}

	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public double getMapy() {
		return mapy;
	}

	public void setMapy(double mapy) {
		this.mapy = mapy;
	}

	public double getMapx() {
		return mapx;
	}

	public void setMapx(double mapx) {
		this.mapx = mapx;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public double getGrade() {
		return grade;
	}

	public void setGrade(double grade) {
		this.grade = grade;
	}

	public String getFphoto() {
		return fphoto;
	}

	public void setFphoto(String fphoto) {
		this.fphoto = fphoto;
	}

	public boolean getWish() {
		return wish;
	}

	public void setWish(boolean wish) {
		this.wish = wish;
	}

}
