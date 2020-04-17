package com.sist.member.model;


import java.util.Date;

public class MemberVO_c {

	private String photo;
	private String memberid;
	private String pwd;
	private String name;
	private String email;
	private String birth;
	private String gender;
	private String addr1;
	private String addr2;
	private String tel;
	private Date regdate;
	private String selfInfo;
	private int grade;
	private String coverPhoto;
	private String msg;
	
	public String getMemberId() {
		return memberid;
	}
	public void setMemberId(String memberid) {
		this.memberid = memberid;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
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
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getSelfInfo() {
		return selfInfo;
	}
	public void setSelfInfo(String selfInfo) {
		this.selfInfo = selfInfo;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public String getCoverPhoto() {
		return coverPhoto;
	}
	public void setCoverPhoto(String coverPhoto) {
		this.coverPhoto = coverPhoto;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	
	

}
