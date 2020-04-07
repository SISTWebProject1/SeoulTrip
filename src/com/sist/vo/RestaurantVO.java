package com.sist.vo;

import java.sql.Date;

public class RestaurantVO {
	private int no;
	private int Rname;
	private Date OpenHour;
	private String Rphoto;
	private String info;
	private int Tel;
	private String Link;
	private int mapX;
	private int mapY;
	private String Addr1;
	private String Addr2;
	private int Rank;
	private String Price;
	private String Menu;
	private int ResCheck;
	private int grade;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getRname() {
		return Rname;
	}
	public void setRname(int rname) {
		Rname = rname;
	}
	public Date getOpenHour() {
		return OpenHour;
	}
	public void setOpenHour(Date openHour) {
		OpenHour = openHour;
	}
	public String getRphoto() {
		return Rphoto;
	}
	public void setRphoto(String rphoto) {
		Rphoto = rphoto;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getTel() {
		return Tel;
	}
	public void setTel(int tel) {
		Tel = tel;
	}
	public String getLink() {
		return Link;
	}
	public void setLink(String link) {
		Link = link;
	}
	public int getMapX() {
		return mapX;
	}
	public void setMapX(int mapX) {
		this.mapX = mapX;
	}
	public int getMapY() {
		return mapY;
	}
	public void setMapY(int mapY) {
		this.mapY = mapY;
	}
	public String getAddr1() {
		return Addr1;
	}
	public void setAddr1(String addr1) {
		Addr1 = addr1;
	}
	public String getAddr2() {
		return Addr2;
	}
	public void setAddr2(String addr2) {
		Addr2 = addr2;
	}
	public int getRank() {
		return Rank;
	}
	public void setRank(int rank) {
		Rank = rank;
	}
	public String getPrice() {
		return Price;
	}
	public void setPrice(String price) {
		Price = price;
	}
	public String getMenu() {
		return Menu;
	}
	public void setMenu(String menu) {
		Menu = menu;
	}
	public int getResCheck() {
		return ResCheck;
	}
	public void setResCheck(int resCheck) {
		ResCheck = resCheck;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	
}
