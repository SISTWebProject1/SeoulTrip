package com.sist.mypage.model;

import java.util.Date;

public class WishListVO_u {

	private String wishListNO;
	private String wishlistname;
	private String memeberId;
	private int type;
	private int no;
	private Date regdate;
	private String wish_photo;
	
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWish_photo() {
		return wish_photo;
	}
	public void setWish_photo(String wish_photo) {
		this.wish_photo = wish_photo;
	}
	public String getWishListNO() {
		return wishListNO;
	}
	public void setWishListNO(String wishListNO) {
		this.wishListNO = wishListNO;
	}
	public String getWishlistname() {
		return wishlistname;
	}
	public void setWishlistname(String wishlistname) {
		this.wishlistname = wishlistname;
	}
	public String getMemeberId() {
		return memeberId;
	}
	public void setMemeberId(String memeberId) {
		this.memeberId = memeberId;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
	
	
}
