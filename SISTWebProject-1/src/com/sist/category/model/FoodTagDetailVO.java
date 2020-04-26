package com.sist.category.model;


import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FoodTagDetailVO {
	
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
	public String getRname() {
		return rname;
	}
	public void setRname(String rname) {
		this.rname = rname;
	}
	public String getOpenhour() {
		return openhour;
	}
	public void setOpenhour(String openhour) {
		this.openhour = openhour;
	}
	public String getRphoto() {
		return rphoto;
	}
	public void setRphoto(String rphoto) {
		this.rphoto = rphoto;
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
	private String rname;
	private String openhour;
	private String rphoto;
	private String price;
	private int rescheck;
	private int grade;
}
