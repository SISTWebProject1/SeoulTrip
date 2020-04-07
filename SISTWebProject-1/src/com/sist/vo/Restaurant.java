package com.sist.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import oracle.sql.NUMBER;


@Getter
@Setter
public class Restaurant {
	private Number no;
	private Number Rname;
	private Date OpenHour;
	private String Rphoto;
	private String info;
	private Number Tel;
	private String Link;
	private Number mapX;
	private Number mapY;
	private String Addr1;
	private String Addr2;
	private Number Rank;
	private String Price;
	private String Menu;
	private Boolean ResCheck;
	private Number grade;
}
