package com.sist.mypage.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FestivalVO_u {

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
}
