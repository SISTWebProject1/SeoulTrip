package com.sist.main.dao;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class HomeItemVO {
	
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	public int getReviewCnt() {
		return reviewCnt;
	}
	public void setReviewCnt(int reviewCnt) {
		this.reviewCnt = reviewCnt;
	}
	public List<HashTagVO> getHashtags() {
		return hashtags;
	}
	public void setHashtags(List<HashTagVO> hashtags) {
		this.hashtags = hashtags;
	}
	public boolean isWish() {
		return wish;
	}
	public void setWish(boolean wish) {
		this.wish = wish;
	}
	private int type;
	private int no;
	private String name;
	private String photo;
	private int grade;
	private int reviewCnt;
	private List<HashTagVO> hashtags;
	private boolean wish = false;

}
