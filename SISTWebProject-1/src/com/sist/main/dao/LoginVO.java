package com.sist.main.dao;

import java.util.ArrayList;

public class LoginVO {

	private String state;
	private String memberId;
	private String pwd;
	private String name;
	private String photo;
	private ArrayList<int[]> recentItems;

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
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

	public ArrayList<int[]> getRecentItems() {
		return recentItems;
	}

	public void addRecentItems(int[] type_no) {
		for(int[] item : recentItems) {
			if(type_no[0]!=item[0] || type_no[1]!=item[1]) continue;
			else return;
		}
		
		if(recentItems.size()==5) recentItems.remove(0);
		
		recentItems.add(type_no);
		return;
	}

}
