package com.sist.home.model;

import java.util.ArrayList;

public class MonthVO {

	private int month;
	private ArrayList<DateVO> dates = new ArrayList<DateVO>();

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public ArrayList<DateVO> getDates() {
		return dates;
	}

	public void setDates(ArrayList<DateVO> dates) {
		this.dates = dates;
	}

}