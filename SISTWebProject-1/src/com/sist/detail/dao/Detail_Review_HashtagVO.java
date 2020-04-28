package com.sist.detail.dao;

public class Detail_Review_HashtagVO {
	private int no;
	private int reviewno;
	private int type;
	private String tagname;
	private int tagcode;
	
	
	public int getTagcode() {
		return tagcode;
	}
	public void setTagcode(int tagcode) {
		this.tagcode = tagcode;
	}
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
	public int getReviewno() {
		return reviewno;
	}
	public void setReviewno(int reviewno) {
		this.reviewno = reviewno;
	}
	public String getTagname() {
		return tagname;
	}
	public void setTagname(String tagname) {
		this.tagname = tagname;
	}
}
