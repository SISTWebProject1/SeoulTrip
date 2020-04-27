package com.sist.tourplace.model;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TourplaceTagDetailVO {
	
	public int getTagcode() {
		return tagcode;
	}
	public void setTagcode(int tagcode) {
		this.tagcode = tagcode;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public String getOpenhour() {
		return openhour;
	}
	public void setOpenhour(String openhour) {
		this.openhour = openhour;
	}
	public String getTphoto() {
		return tphoto;
	}
	public void setRphoto(String rphoto) {
		this.tphoto = tphoto;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public int getRescheck() {
		return rescheck;
	}
	public void setRescheck(int rescheck) {
		this.rescheck = rescheck;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	private int tagcode;
	private int no;
	private String tname;
	private String openhour;
	private String tphoto;
	private String price;
	private int rescheck;
	private int grade;
}
