package com.sist.home.model;

import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FestivalVO {
	
	private int no;
	private String fname;
	private Date startdate;
	private Date enddate;
	private String info;
	private double mapy;
	private double mapx;
	private String addr1;
	private String addr2;
	private double grade;
	private String fphoto;
	
	public String getFmtStart() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		return sdf.format(startdate);
	}
	
	public String getFmtEnd() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		return sdf.format(enddate);
	}

}
