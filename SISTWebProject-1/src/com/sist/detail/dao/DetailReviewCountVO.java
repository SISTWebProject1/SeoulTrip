package com.sist.detail.dao;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DetailReviewCountVO {
	private int count;
	private String grade;
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	
}
