package com.sist.main.dao;

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
	private int type;
	private int no;
	private String name;
	private String photo;

}
