package com.sist.detail.dao;



public class DetailTourplaceVO {
	private int no;
	private String tname;
	private String tphoto;
	private String openhour;
	private String tel;
	private String link;
	private String info;
	private double mapx;
	private double mapy;
	
	public double getDistance() {
		return distance;
	}

	public void setDistance(double distance) {
		this.distance = distance;
	}

	private String addr1;
	private String addr2;
	private double grade;
	private String post;
	private double distance;

	private Detail_Review_PhotoVO drpvo = new Detail_Review_PhotoVO();

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

	public String getTphoto() {
		return tphoto;
	}

	public void setTphoto(String tphoto) {
		this.tphoto = tphoto;
	}

	public String getOpenhour() {
		return openhour;
	}

	public void setOpenhour(String openhour) {
		this.openhour = openhour;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public double getMapx() {
		return mapx;
	}

	public void setMapx(double mapx) {
		this.mapx = mapx;
	}

	public double getMapy() {
		return mapy;
	}

	public void setMapy(double mapy) {
		this.mapy = mapy;
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

	public String getPost() {
		return post;
	}

	public void setPost(String post) {
		this.post = post;
	}

	public Detail_Review_PhotoVO getDrpvo() {
		return drpvo;
	}

	public void setDrpvo(Detail_Review_PhotoVO drpvo) {
		this.drpvo = drpvo;
	}

}
