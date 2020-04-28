package com.sist.tourplace.model;

import java.io.Serializable;
import java.util.List;

import com.sist.detail.dao.DetailReviewVO;
import com.sist.main.dao.HashTagVO;

import lombok.Getter;
import lombok.Setter;


public class TourplaceVO implements Serializable{
	private int no;
	private String tname;
	private String openhour;
	private String tphoto;
	private String info;
	private int tel;
	private String link;
	private int mapX;
	private int mapY;
	private String addr1;
	private String addr2;
	private int rank;
	private String price;
	private String menu;
	private int rescheck;
	private int grade;
	private String post;
	private boolean wish;
	private List<HashTagVO> hashtags;
	private DetailReviewVO topRv;
	private DetailReviewVO worstRv;
	
	public DetailReviewVO getTopRv() {
		return topRv;
	}
	public void setTopRv(DetailReviewVO topRv) {
		this.topRv = topRv;
	}
	public DetailReviewVO getWorstRv() {
		return worstRv;
	}
	public void setWorstRv(DetailReviewVO worstRv) {
		this.worstRv = worstRv;
	}
	public List<HashTagVO> getHashtags() {
		return hashtags;
	}
	public void setHashtags(List<HashTagVO> hashtags) {
		this.hashtags = hashtags;
	}
	public boolean getWish() {
		return wish;
	}
	public void setWish(boolean wish) {
		this.wish = wish;
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
	public void setTphoto(String tphoto) {
		this.tphoto = tphoto;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
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
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
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
	public String getPost() {
		return post;
	}
	public void setPost(String post) {
		this.post = post;
	}
	
}
