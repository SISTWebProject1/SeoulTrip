package com.sist.category.model;

import java.io.Serializable;
import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class FoodVO implements Serializable{
	private int no;
	private String rname;
	private Date openHour;
	private String rphoto;
	private String info;
	private int tel;
	private String link;
	private int mapX;
	private int mapY;
	private String addr1;
	private String addr2;
	private int rank;
	private String price;
	private String menu;
	private int resCheck;
	private int grade;
	private String post;
}
