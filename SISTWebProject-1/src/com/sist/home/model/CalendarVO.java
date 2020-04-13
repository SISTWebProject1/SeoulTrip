package com.sist.home.model;

import java.util.ArrayList;
import java.util.Calendar;

public class CalendarVO {

	private int year;
	private ArrayList<MonthVO> months = new ArrayList<MonthVO>();
	private int curmonth;

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public ArrayList<MonthVO> getMonths() {
		return months;
	}
	
	public CalendarVO getInstance() {
		for (int i = 1; i < curmonth; i++) {
			MonthVO temp = months.get(0);
			months.remove(0);
			months.add(temp);
		}
		
		return this;
	}

	public void setMonths(ArrayList<MonthVO> months) {
		this.months = months;
	}

	public CalendarVO(int year, int curmonth) {
		this.curmonth = curmonth;
		
		Calendar cld = Calendar.getInstance();
		cld.set(cld.YEAR, year);
		this.setYear(cld.get(cld.YEAR));

		for (int i = 0; i < cld.getMaximum(cld.MONTH) + 1; i++) {
			MonthVO monthvo = new MonthVO();
			monthvo.setMonth(i + 1);

			cld.set(cld.MONTH, monthvo.getMonth() - 1);
			for (int j = 0; j < cld.getActualMaximum(cld.DATE); j++) {
				DateVO date = new DateVO();
				date.setDate(j + 1);

				cld.set(cld.DATE, date.getDate());
				int day = cld.get(cld.DAY_OF_WEEK);
				switch (day) {
					case 1: {
						date.setDay("일");
						break;
					}
					case 2: {
						date.setDay("월");
						break;
					}
					case 3: {
						date.setDay("화");
						break;
					}
					case 4: {
						date.setDay("수");
						break;
					}
					case 5: {
						date.setDay("목");
						break;
					}
					case 6: {
						date.setDay("금");
						break;
					}
					case 7: {
						date.setDay("토");
						break;
					}
				}

				monthvo.getDates().add(date);
			}

			this.getMonths().add(monthvo);
		}
	}
}